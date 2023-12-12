<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<jsp:include page="head.jsp" />

<body id="grad_login">

<jsp:include page="navbar.jsp" />

<main id="main">

    <!-- ======= Movie Details Section ======= -->
    <section id="movie-details" class="movie-details">
        <div class="container mt-5">
            <div class="row gy-4">

                <div class="col-lg-8">
                    <div id="movie-details-slider" class="movie-details-slider swiper">
                        <div class="swiper-wrapper align-items-center">
                            <!-- Images will be dynamically loaded here -->
                        </div>
                        <div class="swiper-pagination"></div>
                    </div>
                </div>

                <div class="col-lg-4">
                    <div id="movie-info" class="movie-info">
                        <!-- Movie details will be dynamically loaded here -->
                    </div>
                </div>

            </div>
        </div>
    </section><!-- End Movie Details Section -->

</main><!-- End #main -->

<div id="preloader"></div>
<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i
        class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->
<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
<script src="assets/vendor/aos/aos.js"></script>
<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
<script src="assets/vendor/typed.js/typed.umd.js"></script>
<script src="assets/vendor/waypoints/noframework.waypoints.js"></script>
<script src="assets/vendor/php-email-form/validate.js"></script>

<!-- Template Main JS File -->
<script src="assets/js/main.js"></script>

<script>
    $(document).ready(function () {
        var movieId = 872585; // Assume you have a function to extract movie ID from URL
        getMovieDetails(movieId);
    });

    function getMovieDetails(movieId) {
        $.ajax({
            url: "https://api.themoviedb.org/3/movie/" + movieId + "?language=pt-BR",
            data: {
                api_key: "db2e1996e8f3cccdec769dce7aa8211d"
            },
            success: function (movie) {
                displayMovieDetails(movie);
            },
            error: function (error) {
                console.log("Error fetching movie details: ", error);
            }
        });
    }

    function displayMovieDetails(movie) {
        // Display movie images
        var movieDetailsSlider = $("#movie-details-slider");
        movieDetailsSlider.empty();
        $.each(movie.images.backdrops, function (index, backdrop) {
            var imgSrc = "https://image.tmdb.org/t/p/original" + backdrop.file_path;
            var swiperSlide = $("<div class='swiper-slide'>");
            swiperSlide.append("<img src='" + imgSrc + "' alt='Movie Image'>");
            movieDetailsSlider.append(swiperSlide);
        });

        // Display movie information
        var movieInfo = $("#movie-info");
        movieInfo.empty();
        movieInfo.append("<h3>Movie Information</h3>");
        movieInfo.append("<ul>");
        movieInfo.append("<li><strong>Title</strong>: " + movie.title + "</li>");
        movieInfo.append("<li><strong>Release Date</strong>: " + movie.release_date + "</li>");
        movieInfo.append("<li><strong>Vote Average</strong>: " + movie.vote_average + "</li>");
        movieInfo.append("<li><strong>Overview</strong>: " + movie.overview + "</li>");
        // Add more details as needed
        movieInfo.append("</ul>");
    }
</script>

</body>

</html>
