package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.ConexaoBanco;
import database.DBQuery;

public class UsuarioDAO extends Usuario {
	
	public UsuarioDAO(int id, String nome, String nome_usuario, String email, String senha) {
		this.setIdUsuario(id);
		this.setNome(nome);
		this.setNomeDeUsuario(nome_usuario);
		this.setEmail(email);
		this.setSenha(senha);
	}
	
	public UsuarioDAO(String nome_usuario, String senha) {
		this.setNomeDeUsuario(nome_usuario);
		this.setSenha(senha);
	}

	private static final String OBTENHA_USUARIO_POR_NOME_USUARIO = "SELECT * FROM usuarios WHERE nome_usuario = ?";
	private static final String AUTENTICAR_USUARIO = "SELECT * FROM usuarios WHERE nome_usuario = ? AND senha = ?";
	private static final String CRIAR_USUARIO = "INSERT INTO usuarios (nome, nome_usuario, email, senha) VALUES ('John Doe', 'john_doe', 'john.doe@example.com', 'randompassword');";

	public void inserirUsuario() {
		this.save();
	}

	public Usuario obterUsuarioPorNomeUsuario(String nomeUsuario) {
		try (Connection conexao = ConexaoBanco.obterConexao();
				PreparedStatement pstmt = conexao.prepareStatement(OBTENHA_USUARIO_POR_NOME_USUARIO)) {

			pstmt.setString(1, nomeUsuario);

			try (ResultSet rs = pstmt.executeQuery()) {
				if (rs.next()) {
					return mapearUsuario(rs);
				}
			}

		} catch (SQLException e) {
			e.printStackTrace(); // Trate a exceção adequadamente no seu código real
		}

		return null;
	}

	public boolean autenticarUsuario(String nomeUsuario, String senha) {
        DBQuery dbQuery = new DBQuery();

        try {
            String[] values = {nomeUsuario, senha};
            ResultSet rs = dbQuery.query(AUTENTICAR_USUARIO, values);

            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
	
	public boolean criarUsuario(String id, String nome, String nomeUsuario, String email, String senha) {
		String fieldsName = "id,nome,nome_usuario,email,senha";
        DBQuery dbQuery = new DBQuery("usuarios", fieldsName, "id");
        String[] values = {id, nome, nomeUsuario, email, senha};
        if(dbQuery.insert(values) == 1) {
        	return true;
        }else {
        	return false;
        }
    }

	private Usuario mapearUsuario(ResultSet rs) throws SQLException {
		Usuario usuario = new Usuario();
		usuario.setIdUsuario(rs.getInt("id"));
		usuario.setNome(rs.getString("nome"));
		usuario.setNomeDeUsuario(rs.getString("nome_usuario"));
		usuario.setEmail(rs.getString("email"));
		usuario.setSenha(rs.getString("senha"));
		return usuario;
	}
}



