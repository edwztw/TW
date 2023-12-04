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
    <button type="submit" class="btn btn-primary">Enviar</button>
  </form>
  <div id="msg">
  
  </div>
</div>

<script type="text/javascript">

	$(document).ready(function(){
		$("#frmLogin").on("submit", function(event){
			event.preventDefault();
			var requestUrl = "Respondedor";
			var dataForm = $("#frmLogin").serialize();
			
			$.ajax({
				url		: requestUrl,
				method	: "POST", 
				data	: dataForm,
				dataType: "json" 
			}).fail(function(){
				alert("Falhou!");
            }).done(function(data){
            	alert(JSON.stringify( data ));
            });
				 
			
			
			
			
			$.post( url, dataForm, function(data, status) {
					alert( "HTTP RESPONSE: "+ JSON.stringify( data )); //+ email:"+ data.email + "  \n senha:  " + data.senha);
					$("#msg").html( data.email + ", "+data.senha );
			}, "json");
		});
	});
</script>
</body>
</html>
