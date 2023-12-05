import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.UsuarioDAO;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String nome = request.getParameter("nome");
        String nomeUsuario = request.getParameter("nomeUsuario");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        if (criarUsuario(nome, nomeUsuario, email, senha)) {
            response.getWriter().write("Usuário criado com sucesso");
        } else {
            response.getWriter().write("Falha na criação do usuário");
        }
    }
    
    private boolean criarUsuario(String nome, String nomeUsuario, String email, String senha) {
	    UsuarioDAO usuario = new UsuarioDAO(0, nome, nomeUsuario, email, senha);
	    if(usuario.criarUsuario("0", nome, nomeUsuario, email, senha)) {
	    	return true;
	    }
	    else {
	    	return false;
	    }
    }
}
