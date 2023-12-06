package models;

import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.google.gson.Gson;
import com.google.gson.GsonBuilder;

import database.DBQuery;

public class Usuario {

	private int idUsuario;
	private String nomeDeUsuario;
	private String nome;
	private String email;
	private String senha;

	
	public Usuario() {
	}
	
	public Usuario(int id, String nome, String nome_usuario, String email, String senha) {
		this.setIdUsuario(id);
		this.setNome(nome);
		this.setNomeDeUsuario(nome_usuario);
		this.setEmail(email);
		this.setSenha(senha);
	}
	
	public DBQuery getDBQuery() {
		String	tableName  = "ticket_wave.usuarios";
		String	fieldsName  ="id, nome, nome_usuario, email, senha";  
		String	fieldKey	="id";
		return( new DBQuery(tableName, fieldsName, fieldKey));
	}
	
	public String toJson() {
        String json = new Gson().toJson(this, this.getClass());
		return ( json );
	}
	
	public void fromJson(String json) {
		new Gson().fromJson(json, this.getClass());
	}
	
	public String[] toArray() {
		return(
			new String[] {
				this.getIdUsuario()+"",
				this.getNome(),
				this.getNomeDeUsuario(),
				this.getEmail(),
				this.getSenha()
			}
		);
	}
	
	public ArrayList<Usuario> listAll() {
		
		ArrayList<Usuario> listUsuarios = new ArrayList<Usuario>(); 
		ResultSet rs = this.getDBQuery().select("");
		try {
			while (rs.next()) {
				Usuario tempUsuario = new Usuario(
						rs.getInt("id"),
						rs.getString("nome"),
						rs.getString("nome_usuario"),
						rs.getString("email"),
						rs.getString("senha")
				 );
				listUsuarios.add(tempUsuario);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return(listUsuarios);
	}
	
	
	public int save() {
		if (this.getIdUsuario() > 0) {
			return this.getDBQuery().update(this.toArray());
		}else {
			return this.getDBQuery().insert(this.toArray());
		}
	}
	
	public int delete() {
		if (this.getIdUsuario() > 0) {
			return this.getDBQuery().delete(this.toArray());
		}
		return(0);
	}
	
	public int update() {
		if (this.getIdUsuario() > 0) {
			return this.getDBQuery().update(this.toArray());
		}
		return(0);
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


