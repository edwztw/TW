<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<% 


if (request.getMethod().toLowerCase().equals("post")){
	String email = request.getParameter("email"); // $_REQUEST["email"]
	String senha = request.getParameter("pswd");  // $_REQUEST["pswd"]

	String outJson = "{\"email\":\"" + email + "\", \"senha\": \"" + senha + "\"}";
		
	out.write(outJson);
} else {
	String outJson = "{\"email\":\"none\", \"senha\": \"none\"}";
	out.write(outJson);
}

%>