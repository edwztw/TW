

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/Respondedor")
public class ExemploRecebedor extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public ExemploRecebedor() {
        super();

    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email"); // $_REQUEST["email"]
		String senha = request.getParameter("pswd");  // $_REQUEST["pswd"]

		String outJson = "{\"method\":\""+ "GET" +"\", \"email\":\"" + email + "\", \"senha\": \"" + senha + "\"}";
		
		out.write(outJson);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter out = response.getWriter();
	
		String email = request.getParameter("email"); // $_REQUEST["email"]
		String senha = request.getParameter("pswd");  // $_REQUEST["pswd"]

		String outJson = "{\"method\":\""+ "POST" +"\", \"email\":\"" + email + "\", \"senha\": \"" + senha + "\"}";
		
		out.write(outJson);
	}
	
	protected void doPut(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email"); // $_REQUEST["email"]
		String senha = request.getParameter("pswd");  // $_REQUEST["pswd"]

		String outJson = "{\"method\":\""+ "PUT" +"\", \"email\":\"" + email + "\", \"senha\": \"" + senha + "\"}";
		
		out.write(outJson);		
	}

	protected void doDelete(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		PrintWriter out = response.getWriter();
		
		String email = request.getParameter("email"); // $_REQUEST["email"]
		String senha = request.getParameter("pswd");  // $_REQUEST["pswd"]

		String outJson = "{\"method\":\""+ "DELETE" +"\", \"email\":\"" + email + "\", \"senha\": \"" + senha + "\"}";
		
		out.write(outJson);
	}


}
