import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
        if (autenticarUsuario(nomeUsuario, senha, request)) {
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": true}");
        } else {
            response.setContentType("application/json");
            response.getWriter().write("{\"success\": false}");
        }
    }
    private boolean autenticarUsuario(String nomeUsuario, String senha, HttpServletRequest request) {
	    UsuarioDAO usuario = new UsuarioDAO(nomeUsuario, senha);
	    if(usuario.autenticarUsuario(nomeUsuario, senha)) {
	    	HttpSession session = request.getSession();
            session.setAttribute("nomeUsuario", nomeUsuario);
	    	return true;
	    }
	    else {
	    	return false;
	    }
    }
}
