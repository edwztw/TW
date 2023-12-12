<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<jsp:include page="head.jsp" />
<link rel="stylesheet" href="css/style_login.css">
<body id="grad_login" style="width:100%">
	<jsp:include page="navbar.jsp" />
    <div class="form-structor mt-5">
		<div class="signup">
			<h2 class="form-title" id="signup"><span>ou</span>Cadastre-se</h2>
			<div class="form-holder">
				<input type="text" class="input" placeholder="Nome" id="nome" name="nome"/>
				<input type="text" class="input" placeholder="Nome de usuário" id="nomeUsuario" name="nomeUsuario"/>
				<input type="email" class="input" placeholder="Email" id="email" name="email"/>
				<input type="password" class="input" placeholder="Senha" id="senha" name="senha"/>
			</div>
			<button class="submit-btn" type="button" onclick="cadastrarUsuario()">Cadastrar</button>
		</div>
		<div class="login slide-up">
			<div class="center">
				<h2 class="form-title" id="login"><span>ou</span>Entre</h2>
				<div class="form-holder">
					<input type="email" class="input" id="nomeUsuario" name="nomeUsuario" placeholder="E-mail" />
					<input type="password" class="input" id="senha" name="senha" placeholder="Senha" />
				</div>
				<button type="button" class="submit-btn" onclick="autenticarUsuario()">Entrar</button>
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
                success: function(response) {
                    alert(response);
                    // Redirecione ou atualize a página conforme necessário
                },
                error: function(error) {
                    alert("Erro na requisição AJAX");
                }
            });
        }
        
        function cadastrarUsuario() {
            var nome = $("#nome").val();
            var nomeUsuario = $("#nomeUsuario").val();
            var email = $("#email").val();
            var senha = $("#senha").val();

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
