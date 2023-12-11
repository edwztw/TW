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
<body id="grad1">
	<jsp:include page="navbar.jsp" />

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
