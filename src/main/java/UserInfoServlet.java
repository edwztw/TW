import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import models.UsuarioDAO;

@WebServlet("/userInfo")
public class UserInfoServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
    	UsuarioDAO usuario = new UsuarioDAO();
    	
        response.setContentType("application/json");

        // Obtém a sessão do usuário
        HttpSession session = request.getSession();
        
        // Verifica se o usuário está autenticado
        if (session.getAttribute("nomeUsuario") != null) {
            // Cria um objeto JSON com as informações do usuário
        	String nome_usuario = (String) session.getAttribute("nomeUsuario");
        	String nome = usuario.getUsuarioPorNome(nome_usuario);
            String userInfo = "{ \"nomeUsuario\": \"" + session.getAttribute("nomeUsuario") + "\", \"usuario\": \"" + nome + "\" }";
            response.getWriter().write(userInfo);
        } else {
            response.getWriter().write("{ \"mensagem\": \"Usuário não autenticado\" }");
        }
    }
}
