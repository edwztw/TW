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
                if(data.nomeUsuario != "admin"){
                    alert("Usuário não autorizado!");
                    window.location.href = "/ticket_wave/index.jsp";
                }else{
                    alert("Acesso autorizado");
                }
            } else {
                // Usuário não autenticado
                window.location.href = "/ticket_wave/Login.jsp";
            }
        })
        .catch(error => {
            console.error("Erro na verificação de autenticação:", error);
        });
    }
    // Verificar a autenticação quando a página carrega
    verificarAutenticacao();
});
</script>
