package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import database.ConexaoBanco;

public class UsuarioDAO {
	
	private int idUsuario;
	private String nomeDeUsuario;
	private String nome;
	private String email;
	private String senha;

	private static final String INSERIR_USUARIO = "INSERT INTO usuarios (nome, nome_usuario, email, senha) VALUES (?, ?, ?, ?)";
    private static final String OBTENHA_USUARIO_POR_NOME_USUARIO = "SELECT * FROM usuarios WHERE nome_usuario = ?";
    private static final String AUTENTICAR_USUARIO = "SELECT * FROM usuarios WHERE nome_usuario = ? AND senha = ?";

    public void inserirUsuario(Usuario usuario) {
        try (Connection conexao = ConexaoBanco.obterConexao();
             PreparedStatement pstmt = conexao.prepareStatement(INSERIR_USUARIO)) {

            pstmt.setString(1, usuario.getNome());
            pstmt.setString(2, usuario.getNomeUsuario());
            pstmt.setString(3, usuario.getEmail());
            pstmt.setString(4, usuario.getSenha());

            pstmt.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace(); // Trate a exceção adequadamente no seu código real
        }
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
        try (Connection conexao = ConexaoBanco.obterConexao();
             PreparedStatement pstmt = conexao.prepareStatement(AUTENTICAR_USUARIO)) {

            pstmt.setString(1, nomeUsuario);
            pstmt.setString(2, senha);

            try (ResultSet rs = pstmt.executeQuery()) {
                return rs.next();
            }

        } catch (SQLException e) {
            e.printStackTrace(); // Trate a exceção adequadamente no seu código real
        }

        return false;
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
    
    public int getIdUsuario() {
		return idUsuario;
	}

	public void setIdUsuario(int idUsuario) {
		this.idUsuario = idUsuario;
	}

	public String getNomeDeUsuario() {
		return nomeDeUsuario;
	}

	public void setNomeDeUsuario(String nomeDeUsuario) {
		this.nomeDeUsuario = nomeDeUsuario;
	}

	public String getNome() {
		return nome;
	}

	public void setNome(String nome) {
		this.nome = nome;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getSenha() {
		return senha;
	}

	public void setSenha(String senha) {
		this.senha = senha;
	}
}



