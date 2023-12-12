import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtém a sessão do usuário (cria uma nova se não existir)
        HttpSession session = request.getSession(false);

        // Verifica se a sessão existe antes de invalidá-la
        if (session != null) {
            // Invalida a sessão
            session.invalidate();
        }

        // Redireciona para a página de login ou outra página desejada após o logout
        response.sendRedirect("/ticket_wave/Login.jsp");
    }
}
