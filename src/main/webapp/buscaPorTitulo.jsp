<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Movie Search</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="navbar.jsp" />
    <div class="container mt-5">
        <h2 class="mb-4">Movie Search</h2>

        <form class="form-inline mb-4">
            <label class="mr-2" for="movieName">Enter Movie Name:</label>
            <input type="text" class="form-control mr-2" id="movieName" name="movieName" required>
            <button type="button" class="btn btn-primary" onclick="searchMovies()">Search</button>
        </form>

        <div id="movieList" class="card-columns">
            <!-- Movie list will be displayed here -->
        </div>
    </div>

    <script>
        function searchMovies() {
            var movieName = document.getElementById("movieName").value;

            $.ajax({
                url: "https://api.themoviedb.org/3/search/movie?language=pt-BR",
                data: {
                    api_key: "db2e1996e8f3cccdec769dce7aa8211d",
                    query: movieName
                },
                success: function (result) {
                    displayMovieList(result.results);
                },
                error: function (error) {
                    console.log("Error fetching movie list: ", error);
                }
            });
        }

        function displayMovieList(movies) {
            var movieListDiv = $("#movieList");
            movieListDiv.empty();

            $.each(movies, function (index, movie) {
                var card = $("<div class='card'>");
                var cardBody = $("<div class='card-body'>");

                cardBody.append("<h5 class='card-title'>" + movie.title + "</h5>");
                cardBody.append("<p class='card-text'><strong>Overview:</strong> " + movie.overview + "</p>");
                cardBody.append("<p class='card-text'><strong>Rating:</strong> " + movie.vote_average + "</p>");

                card.append(cardBody);
                movieListDiv.append(card);
            });

            movieListDiv.show();
        }
    </script>

</body>
</html>
