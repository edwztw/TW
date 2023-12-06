<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Recently Released Movies</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
        <a class="navbar-brand" href="<URL_DO_SITE>/ticket_wave/filmesRecentes.jsp">Home</a>
        <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav">
                <li class="nav-item">
                    <a class="nav-link" href="/ticket_wave/buscaPorTitulo.jsp">Busca por Título</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ticket_wave/buscaPorId.jsp">Busca por ID</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ticket_wave/listarUsuarios.jsp">Listar Usuários</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ticket_wave/Login.jsp">Login</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="/ticket_wave/cadastro.jsp">Cadastro</a>
                </li>
            </ul>
        </div>
    </nav>

    <div class="container mt-5">
        <h2 class="mb-4">Recently Released Movies</h2>

        <div id="recentMovies" class="card-columns">
            <!-- Recently released movies with images will be displayed here -->
        </div>
    </div>

    <script>
        $(document).ready(function () {
            getRecentMovies();
        });

        function getRecentMovies() {
            $.ajax({
                url: "https://api.themoviedb.org/3/movie/now_playing?language=pt-BR",
                data: {
                    api_key: "db2e1996e8f3cccdec769dce7aa8211d"
                },
                success: function (result) {
                    displayRecentMovies(result.results);
                },
                error: function (error) {
                    console.log("Error fetching recently released movies: ", error);
                }
            });
        }

        function displayRecentMovies(movies) {
            var recentMoviesDiv = $("#recentMovies");
            recentMoviesDiv.empty();

            $.each(movies, function (index, movie) {
                var card = $("<div class='card'>");
                var imgSrc = "https://image.tmdb.org/t/p/w500" + movie.poster_path;

                var cardImg = $("<img class='card-img-top' alt='" + movie.title + "' src='" + imgSrc + "'>");
                var cardBody = $("<div class='card-body'>");

                cardBody.append("<h5 class='card-title'>" + movie.title + "</h5>");
                cardBody.append("<p class='card-text'><strong>Overview:</strong> " + movie.overview + "</p>");
                cardBody.append("<p class='card-text'><strong>Rating:</strong> " + movie.vote_average + "</p>");

                card.append(cardImg);
                card.append(cardBody);
                recentMoviesDiv.append(card);
            });

            recentMoviesDiv.show();
        }
    </script>

</body>
</html>
