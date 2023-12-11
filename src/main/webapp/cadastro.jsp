<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<!-- <head>
    <meta charset="UTF-8">
    <title>Cadastro de Usuário</title>
    Adicione os links do Bootstrap CSS e do jQuery
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
</head> -->
<jsp:include page="head.jsp" />
<body id="grad1">
	<jsp:include page="navbar.jsp" />
    <div class="container mt-5">
        <h2>Cadastro de Usuário</h2>
        <form id="cadastroForm">
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" class="form-control" id="nome" name="nome" required>
            </div>

            <div class="form-group">
                <label for="nomeUsuario">Nome de Usuário:</label>
                <input type="text" class="form-control" id="nomeUsuario" name="nomeUsuario" required>
            </div>

            <div class="form-group">
                <label for="email">E-mail:</label>
                <input type="email" class="form-control" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="senha">Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha" required>
            </div>

            <button type="button" class="btn btn-primary" onclick="cadastrarUsuario()">Cadastrar</button>
        </form>

        <div id="resultadoCadastro"></div>
    </div>

    <script>
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
                    // Pode adicionar redirecionamento ou outras ações aqui
                },
                error: function(error) {
                    alert("Erro na requisição AJAX");
                }
            });
        }
    </script>
</body>
</html>
