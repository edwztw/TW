<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="head.jsp" />
<body id="grad1">
    <jsp:include page="navbar.jsp" />
    <div class="container mt-5">
        <h2>Edição de Usuário</h2>
        <form id="edicaoForm" action="update" method="post">
            <div class="form-group">
                <label for="nome">Nome:</label>
                <input type="text" class="form-control" id="nome" name="nome" value="${usuario.nome}" required>
            </div>

            <div class="form-group">
                <label for="nomeUsuario">Nome de Usuário:</label>
                <input type="text" class="form-control" id="nomeUsuario" name="nomeUsuario" value="${usuario.nomeUsuario}" readonly>
            </div>

            <div class="form-group">
                <label for="email">E-mail:</label>
                <input type="email" class="form-control" id="email" name="email" value="${usuario.email}" required>
            </div>

            <div class="form-group">
                <label for="senha">Nova Senha:</label>
                <input type="password" class="form-control" id="senha" name="senha">
            </div>

            <button type="submit" class="btn btn-primary">Atualizar</button>
        </form>
    </div>
</body>
</html>
