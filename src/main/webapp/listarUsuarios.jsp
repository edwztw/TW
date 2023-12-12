<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<jsp:include page="head.jsp" />
<body id="grad1">
	<jsp:include page="navbar.jsp" />
    <div class="container mt-5">
        <h2>Listar Usuários</h2>
        <table class="table">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Nome de Usuário</th>
                    <th>Email</th>
                    <th>Ações</th>
                </tr>
            </thead>
            <tbody id="usuariosTableBody">
                <!-- User data will be inserted here dynamically -->
            </tbody>
        </table>
    </div>

    <script>
        // Function to load user data using AJAX
        function carregarUsuarios() {
            $.ajax({
                type: "GET",
                url: "listarUsuarios", // Servlet URL
                dataType: "json",
                success: function(usuarios) {
                    // Clear existing rows
                    $("#usuariosTableBody").empty();

                    // Populate the table with user data
                    $.each(usuarios, function(index, usuario) {
                        var row = "<tr>" +
                            "<td>" + usuario.idUsuario + "</td>" +
                            "<td>" + usuario.nome + "</td>" +
                            "<td>" + usuario.nomeDeUsuario + "</td>" +
                            "<td>" + usuario.email + "</td>" +
                            "<td>" +
                            "<button type='button' class='btn btn-danger' onclick='excluirUsuario(" + usuario.idUsuario + ")'>Excluir</button>" +
                            // Adicione botões ou links para modificar o usuário
                            "</td>" +
                            "</tr>";

                        $("#usuariosTableBody").append(row);
                    });
                },
                error: function(error) {
                    alert("Erro na requisição AJAX");
                }
            });
        }

        // Function to delete a user using AJAX
        function excluirUsuario(idUsuario) {
            var confirmacao = confirm("Tem certeza que deseja excluir este usuário?");
            if (confirmacao) {
                $.ajax({
                    type: "POST",
                    url: "acoesUsuario",
                    data: { acao: "excluir", idUsuario: idUsuario },
                    success: function(response) {
                        alert(response);
                        // Recarrega a lista de usuários após a exclusão
                        carregarUsuarios();
                    },
                    error: function(error) {
                        alert("Erro na requisição AJAX");
                    }
                });
            }
        }

        // Carrega a lista de usuários ao carregar a página
        $(document).ready(function() {
            carregarUsuarios();
        });
    </script>
</body>
</html>
