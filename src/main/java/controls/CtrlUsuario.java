package controls;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import models.Usuario;

/**
 * Servlet implementation class CtrlUsuario
 */
@WebServlet("/usuario")
public class CtrlUsuario extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public CtrlUsuario() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	
		
	}


	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
		String action = request.getParameter("action");
		
		switch (action) {
		case "login": {
			String email 	= request.getParameter("email");
			String senha 	= request.getParameter("pswd");
			Usuario usuario = new Usuario().checkLogin(email, senha);
			if( usuario != null ) {
				request.getSession().setAttribute("idUsuario", usuario.getIdUsuario() );
				request.getSession().setAttribute("email", usuario.getEmail() );
				request.getSession().setAttribute("nome", usuario.getNome() );
				request.getSession().setAttribute("idNivelUsuario", usuario.getIdNivelUsuario());
				usuario.setSenha("");
			} else{
				usuario = new Usuario(0, "", "", 0, "", "", "", "", "", "", "", "", "", "");
				request.getSession().invalidate();
			}
			String outJson = usuario.toJson();
			out.write( outJson ) ;
		} break;
		case "save": {
			String idUsuario= request.getParameter("idUsuario");
			String email 	= request.getParameter("email");
			String senha 	= request.getParameter("senha");
			String idNivelUsuario = request.getParameter("idNivelUsuario");
			String nome 	= request.getParameter("nome");
			String cpf 		= request.getParameter("cpf");
			String endereco = request.getParameter("endereco");
			String bairro 	= request.getParameter("bairro");
			String cidade 	= request.getParameter("cidade");
			String uf 		= request.getParameter("uf");
			String cep 		= request.getParameter("cep");
			String telefone = request.getParameter("telefone");
			String foto 	= request.getParameter("foto");
			String ativo 	= request.getParameter("ativo");
			Usuario usuario = new Usuario(0, email, senha, 1, nome, cpf, endereco, bairro, cidade, uf, cep, telefone, foto, ativo);
			usuario.save();
			
		} break;
		default:
			throw new IllegalArgumentException("Unexpected value: " + action);
		}
	}

}
