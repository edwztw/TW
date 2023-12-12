package models;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
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
	
	public UsuarioDAO(int id) {
		this.setIdUsuario(id);
	}
	
	public UsuarioDAO() {
	}

	private static final String OBTENHA_USUARIO_POR_NOME_USUARIO = "SELECT * FROM usuarios WHERE nome_usuario = ?";
	private static final String AUTENTICAR_USUARIO = "SELECT * FROM usuarios WHERE nome_usuario = ? AND senha = ?";
	private static final String CRIAR_USUARIO = "INSERT INTO usuarios (nome, nome_usuario, email, senha) VALUES ('John Doe', 'john_doe', 'john.doe@example.com', 'randompassword');";
	private static final String LISTAR_USUARIOS = "SELECT * FROM usuarios";
	
	public void inserirUsuario() {
		this.save();
	}

	public boolean autenticarUsuario(String nomeUsuario, String senha) {
		String fieldsName = "id,nome,nome_usuario,email,senha";
        DBQuery dbQuery = new DBQuery("usuarios", fieldsName, "id");
        try {
            String[] values = {nomeUsuario, senha};
            ResultSet rs = dbQuery.query(AUTENTICAR_USUARIO, values);
            //this.mapearUsuario(rs);
            System.out.println(nomeUsuario);
            System.out.println(senha);
            return rs.next();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
	
	public String getUsuarioPorNome(String nomeUsuario) {
		String fieldsName = "id,nome,nome_usuario,email,senha";
        DBQuery dbQuery = new DBQuery("usuarios", fieldsName, "id");
        try {
            String[] values = {nomeUsuario};
            ResultSet rs = dbQuery.query(OBTENHA_USUARIO_POR_NOME_USUARIO, values);
            while (rs.next()) {
            	this.setIdUsuario(rs.getInt("id"));
				this.setNome(rs.getString("nome"));
				this.setNomeDeUsuario(rs.getString("nome_usuario"));
				this.setEmail(rs.getString("email"));
				this.setSenha(rs.getString("senha"));
				System.out.println(this.getNome());
				return this.getNome();
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return null;
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
	
	public List<Usuario> listarUsuarios() {
		String fieldsName = "id,nome,nome_usuario,email,senha";
        DBQuery dbQuery = new DBQuery("usuarios", fieldsName, "id");
        ResultSet resultSet = dbQuery.query(LISTAR_USUARIOS);
        
        List<Usuario> usuarios = new ArrayList<>();

        try {
            while (resultSet.next()) {
                int id = resultSet.getInt("id");
                String nome = resultSet.getString("nome");
                String nomeUsuario = resultSet.getString("nome_usuario");
                String email = resultSet.getString("email");
                String senha = resultSet.getString("senha");

                Usuario usuario = new Usuario(id, nome, nomeUsuario, email, senha);
                usuarios.add(usuario);
            }
            System.out.println(usuarios);
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in your code
        }
        return usuarios;
    }

	private void mapearUsuario(ResultSet rs) throws SQLException {
		try {
            while (rs.next()) {
            	this.setIdUsuario(rs.getInt("id"));
				this.setNome(rs.getString("nome"));
				this.setNomeDeUsuario(rs.getString("nome_usuario"));
				this.setEmail(rs.getString("email"));
				this.setSenha(rs.getString("senha"));
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Handle the exception appropriately in your code
        }
	}
}



