<script>
document.addEventListener("DOMContentLoaded", function () {
    // Função para verificar o status de autenticação
    function verificarAutenticacao() {
        fetch("/ticket_wave/userInfo", {
            method: "GET",
            headers: {
                "Content-Type": "application/json"
            }
        })
        .then(response => response.json())
        .then(data => {
            if ("nomeUsuario" in data) {
                // Usuário autenticado
                exibirUsuarioAutenticado(data.usuario);
            } else {
                // Usuário não autenticado
                exibirBotaoEntrar();
            }
        })
        .catch(error => {
            console.error("Erro na verificação de autenticação:", error);
        });
    }

    // Função para exibir o botão de entrar
    function exibirBotaoEntrar() {
        document.getElementById("loginButton").innerHTML = "Entrar";
        document.getElementById("userNameContainer").innerHTML = "";
        document.getElementById("loginButton").href = "/ticket_wave/Login.jsp";
    }

    // Função para exibir o botão de logout e o nome do usuário
    function exibirUsuarioAutenticado(nomeUsuario) {
        document.getElementById("loginButton").innerHTML = "Sair";
        document.getElementById("userNameContainer").innerHTML = "Olá, " + nomeUsuario;
        document.getElementById("loginButton").href = "/ticket_wave/logout";
    }

    // Verificar a autenticação quando a página carrega
    verificarAutenticacao();
});
</script>
