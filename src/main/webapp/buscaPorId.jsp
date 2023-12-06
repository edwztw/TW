<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Movie Details</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</head>
<body>
	<jsp:include page="navbar.jsp" />
    <div class="container mt-5">
        <h2 class="mb-4">Movie Details</h2>

        <form class="form-inline mb-4">
            <label class="mr-2" for="movieId">Enter Movie ID:</label>
            <input type="text" class="form-control mr-2" id="movieId" name="movieId" required>
            <button type="button" class="btn btn-primary" onclick="getMovieDetails()">Get Details</button>
        </form>

        <div id="movieDetails" class="card">
            <!-- Movie details will be displayed here -->
            <div class="card-body">
                <h3 class="card-title"></h3>
                <p class="card-text"></p>
                <p class="card-text"></p>
            </div>
        </div>
    </div>

    <script>
        function getMovieDetails() {
            var movieId = document.getElementById("movieId").value;

            $.ajax({
                url: "https://api.themoviedb.org/3/movie/" + movieId + "?language=pt-BR",
                data: {
                    api_key: "db2e1996e8f3cccdec769dce7aa8211d"
                },
                success: function (result) {
                    displayMovieDetails(result);
                },
                error: function (error) {
                    console.log("Error fetching movie details: ", error);
                }
            });
        }

        function displayMovieDetails(movie) {
            var detailsDiv = $("#movieDetails");
            detailsDiv.find(".card-title").text(movie.title);
            detailsDiv.find(".card-text:eq(0)").html("<strong>Description:</strong> " + movie.overview);
            detailsDiv.find(".card-text:eq(1)").html("<strong>Rating:</strong> " + movie.vote_average);
            detailsDiv.show();
        }
    </script>

</body>
</html>
