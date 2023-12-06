import com.google.gson.Gson;
import models.Usuario;
import models.UsuarioDAO;

import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

@WebServlet("/listarUsuarios")
public class ListarUsuariosServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws IOException {
        UsuarioDAO usuarioDAO = new UsuarioDAO();
        List<Usuario> usuarios = usuarioDAO.listarUsuarios();

        // Convert the list of users to JSON
        Gson gson = new Gson();
        String jsonUsuarios = gson.toJson(usuarios);

        // Set the response type to JSON
        response.setContentType("application/json");
        response.setCharacterEncoding("UTF-8");

        // Send the JSON response to the client
        PrintWriter out = response.getWriter();
        out.print(jsonUsuarios);
        System.out.println(jsonUsuarios);
        out.flush();
    }
}
