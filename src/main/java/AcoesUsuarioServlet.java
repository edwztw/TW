import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import models.UsuarioDAO;

@WebServlet("/acoesUsuario")
public class AcoesUsuarioServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acao = request.getParameter("acao");
        String idUsuario = request.getParameter("idUsuario");

        if ("excluir".equals(acao)) {
            excluirUsuario(Integer.parseInt(idUsuario));
        } else if ("modificar".equals(acao)) {
            // Implemente a lógica de modificação do usuário
        }

        // Pode redirecionar para a página de listagem após as ações
        response.sendRedirect(request.getContextPath() + "/listarUsuarios");
    }

    private boolean excluirUsuario(int idUsuario) {
        UsuarioDAO usuarioDAO = new UsuarioDAO(idUsuario);
        if(usuarioDAO.delete() == 1){
        	return true;
        }else {
        	return false;
        }
    }
}
