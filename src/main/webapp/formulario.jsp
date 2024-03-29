<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<!DOCTYPE html>
<html lang="en">
<head>
  	<title> Bootstrap Example </title>
  	<meta charset="utf-8">
  	<meta name="viewport" content="width=device-width, initial-scale=1">
  	
  	<link href="css/bootstrap.min.css" rel="stylesheet">
  	<script src="js/jquery.min.js"></script>
  	<script src="js/bootstrap.bundle.min.js"></script>

</head>
<body>
<div class="container mt-3">
  <h2>Login</h2>
  <form id="frmLogin">
    <div class="mb-3 mt-3">
      <label for="email">Email:</label>
      <input type="email" class="form-control" id="email" placeholder="Enter email" name="email">
    </div>
    <div class="mb-3">
      <label for="pwd">Password:</label>
      <input type="password" class="form-control" id="pwd" placeholder="Enter password" name="pswd">
    </div>
    <div class="form-check mb-3">
      <label class="form-check-label">
        <input class="form-check-input" type="checkbox" name="remember"> Remember me
      </label>
    </div>
    <input type="hidden" name="action" value="login">
    <button type="button" id="btnFrmLogin" class="btn btn-primary">Enviar</button>
  </form>
  <div id="msgRequest">
  </div>
  <div id="msgResponse">
  </div>
</div>

<script type="text/javascript">

	$(document).ready(function(){
		$("#btnFrmLogin").click( function(){
			var url = "http://localhost:8080/ExemploAjax/usuario";
			var dataForm = $("#frmLogin").serialize();
			$("#msgRequest").html("HTTP REQUEST: "+dataForm);
			
			$.post( url, dataForm, function(data, status) {
				$("#msgResponse").html("HTTP RESPONSE:" + JSON.stringify( data ) );
				alert(  data.idUsuario+ ", " +data.email+ ", " +data.idNivelUsuario+ ", " +data.nome+ ", " +data.cpf+ ", " +data.endereco+ ", " +data.bairro+ ", " +data.cidade+ ", " +data.uf+ ", " +data.cep+ ", " +telefone+ ", " +data.foto+ ", " +data.ativo  );
			}, "json");
		});
	});
</script>
</body>
</html>
