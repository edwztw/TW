<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="head.jsp" />
<link rel="stylesheet" href="css/style_login.css">
	<jsp:include page="navbar.jsp" />
	<body style="background-image:url('assets/img/ticket-blur.png'); width:100%">
		<div class="row mt-5">
			<div class="form-structor" id="form">
				<div class="signup">
					<h2 class="form-title" id="signup"><span>ou</span>Cadastre-se</h2>
					<form id="cadastroForm" method="POST">
						<div class="form-holder">
							<input type="text" class="input" placeholder="Nome" id="nome_c" name="nome_c"/>
							<input type="text" class="input" placeholder="Nome de usuário" id="nomeUsuario_c" name="nomeUsuario_c"/>
							<input type="email" class="input" placeholder="Email" id="email_c" name="email_c"/>
							<input type="password" class="input" placeholder="Senha" id="senha_c" name="senha_c"/>
						</div>
						<button class="submit-btn" type="button" onclick="cadastrarUsuario()">Cadastrar</button>
					</form>
				</div>
				<div class="login slide-up">
					<div class="center">
						<h2 class="form-title" id="login"><span>ou</span>Entre</h2>
						<div class="form-holder">
							<form id="loginForm" method="POST">
					                <input placeholder="Nome de usuário" type="text" class="input" id="nomeUsuario" name="nomeUsuario" required>
					                <input placeholder="Senha" type="password" class="input" id="senha" name="senha" required>
					        </form>
						</div>
						<button type="button" class="submit-btn" onclick="autenticarUsuario()">Entrar</button>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="container mt-5">
		        <div class="card text-center" id="successCard" style="display: none;">
		            <div class="card-header bg-success text-white">
		                Login Efetuado!
		            </div>
		            <div class="card-body">
		                <p class="card-text">Você foi autenticado com sucesso.</p>
		                <p class="card-text">Redirecionando para a página principal...</p>
		            </div>
		        </div>
		     </div>
     	</div>
	    <script>
	        function autenticarUsuario() {
	            var nomeUsuario = $("#nomeUsuario").val();
	            var senha = $("#senha").val();
	
	            $.ajax({
	                type: "POST",
	                url: "login",
	                data: { nomeUsuario: nomeUsuario, senha: senha },
	                success: function(data) {
	                	if (data.success){
	                    	document.getElementById('form').style.display = 'none';
	                    	document.getElementById('successCard').style.display = 'block';
		                    setTimeout(function () {
		                        window.location.href = "/ticket_wave/index.jsp";
		                    }, 3000);
	                	}else{
	                		alert("Failure");
	                		window.location.href = "/ticket_wave/Login.jsp";
	                	}
	                },
	                error: function(error) {
	                    alert("Erro na requisição AJAX");
	                }
	            });
	        }
	        
	        function cadastrarUsuario() {
	            var nome = $("#nome_c").val();
	            var nomeUsuario = $("#nomeUsuario_c").val();
	            var email = $("#email_c").val();
	            var senha = $("#senha_c").val();
	
	            $.ajax({
	                type: "POST",
	                url: "register",
	                data: { nome: nome, nomeUsuario: nomeUsuario, email: email, senha: senha },
	                success: function(response) {
	                    $("#resultadoCadastro").html(response);
	                    window.location.href = "index.jsp";
	                },
	                error: function(error) {
	                    alert("Erro na requisição AJAX");
	                }
	            });
	        }
	    </script>
	    <script  src="js/script_login.js"></script>
	</body>	
</html>
