import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.UsuarioDAO;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	String nome = request.getParameter("nome");
        String nomeUsuario = request.getParameter("nomeUsuario");
        String email = request.getParameter("email");
        String senha = request.getParameter("senha");

        // Autenticação do usuário
        if (autenticarUsuario(nomeUsuario, senha)) {
            response.getWriter().write("Autenticação bem sucedida");
        } else {
            response.getWriter().write("Falha na autenticação");
        }
    }

    private boolean autenticarUsuario(String nomeUsuario, String senha) {
	    UsuarioDAO usuario = new UsuarioDAO(nomeUsuario, senha);
	    if(usuario.autenticarUsuario(nomeUsuario, senha)) {
	    	return true;
	    }
	    else {
	    	return false;
	    }
    }
}
