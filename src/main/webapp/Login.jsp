<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Login</title>
    <!-- Adicione os links do Bootstrap CSS e do jQuery -->
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="navbar.jsp" />
    <div class="container mt-5">
        <form id="loginForm">
            <div class="form-group">
                <label for="nomeUsuario">Nome de Usuário:</label>
                <input type="text" class="form-control" id="nomeUsuario" name="nomeUsuario" required>
            </div>

            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha" required>
            </div>

            <button type="button" class="btn btn-primary" onclick="autenticarUsuario()">Login</button>
        </form>
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
    </script>
</body>
</html>
