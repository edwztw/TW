<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<jsp:include page="head.jsp" />

<body style="background-color: black;">

	<jsp:include page="navbar.jsp" />

  <main id="main">

    <!-- ======= Breadcrumbs ======= -->
    <section id="breadcrumbs" class="breadcrumbs">
      <div class="container">

        <div class="d-flex justify-content-between align-items-center">
          <h2>Detalhes do Filme</h2>
          <ol>
            <li><a href="index.html">Início</a></li>
            <li><a href="catalogo.html">Filmes</a></li>
            <li><a href="generos.html">Gêneros</a></li>
            <li><a href="...">Gênero 1</a></li>
            <li>Detalhes do Filme</li>
          </ol>
        </div>

      </div>
    </section><!-- End Breadcrumbs -->

    <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center justify-content-center">
	    <div class="container" data-aos="fade-up">      
	    	<div id="dynamic-movie-details" class="row" data-aos="fade-up" data-aos-delay="150">
	  		
			</div>
  		</div>
	</section>
  <script>
	  function getHeroBanner() {
		  var movieId = getParameterByName("id");
	      $.ajax({
	    	  url: "/ticket_wave/buscaId?id="+ movieId,
	          success: function (result) {
	              if (result) { // Verifique se há resultados antes de chamar a função setHeroBanner
	                  setHeroBanner(result);
	              }
	          },
	          error: function (error) {
	              console.log("Error fetching hero banner movie: ", error);
	          }
	      });
	  }
	
	  function setHeroBanner(movie) {
	      var heroSection = $("#hero");
	      var bannerUrl = "https://image.tmdb.org/t/p/original" + movie.backdrop_path;
	      heroSection.css("background-image", "url('" + bannerUrl + "')");
	  }
  
  
	  function getMovieDetailsFromURI() {
		    // Obtenha o ID do filme da URI. Aqui, estou usando um exemplo de URI com parâmetro id.
		    var movieId = getParameterByName("id");
	
		    $.ajax({
		    	url: "/ticket_wave/buscaId?id="+ movieId,
		        /* data: {
		            api_key: "db2e1996e8f3cccdec769dce7aa8211d"
		        }, */
		        success: function (result) {
		            displayMovieDetails(result);
		        },
		        error: function (error) {
		            console.log("Error fetching movie details: ", error);
		        }
		    });
		}
	
		// Função para obter o valor de um parâmetro específico de uma URI.
		function getParameterByName(name, url) {
		    if (!url) url = window.location.href;
		    name = name.replace(/[\[\]]/g, "\\$&");
		    var regex = new RegExp("[?&]" + name + "(=([^&#]*)|&|#|$)"),
		        results = regex.exec(url);
		    if (!results) return null;
		    if (!results[2]) return "";
		    return decodeURIComponent(results[2].replace(/\+/g, " "));
		}
	
		function displayMovieDetails(movieDetails) {
		    var dynamicMovieDetails = $("#dynamic-movie-details");
		    var genres;
		    

		    // Limpe o conteúdo existente, se houver.
		    dynamicMovieDetails.empty();

		    // Atualize a imagem do filme.
		    dynamicMovieDetails.append('<div class=\"col-lg-4 col-md-6 portfolio-item filter-app\"><img src="https://image.tmdb.org/t/p/w500/' + movieDetails.poster_path + '" class="img-fluid" alt=""></div>');
		   
		    dynamicMovieDetails.append('<div class=\"col-lg-2\"> </div>');
		    
		    for (var i = 0; i < movieDetails.genres.length; i++) {
		    	genres += '<li style="color:white;"><strong>Categoria</strong>: ' + movieDetails.genres[i].name + '</li>';
		    }
		    
		    dynamicMovieDetails.append('<div class=\"col-lg-4\"> '+
		    	'<div class=\"portfolio-info\"><h2><a href=\"\"><strong>' + movieDetails.original_title + '</strong></a></h2></div>'+
		    	'<div class=\"portfolio-description\"><h2><span>(' + movieDetails.release_date + ')</span></h2>'+
		    	'<p style=\"color:white;\">' + movieDetails.overview + '</p>'+
		    	'<ul>'+
		    	genres+
		    	'</ul>'+
		    	'<ul>'+
		    	'<li style=\"color:white;\"><strong>Estúdio/produtor</strong>: ' + movieDetails.production_companies[0].name + '</li>'+
		    	'</ul>'+
		    	'<ul>'+
		    	'<li style=\"color:white;\"><strong>Data de lançamento</strong>: ' + movieDetails.release_date + '</li>'+
		    	'</ul>'+
		    	'<ul>'+
		    	'<li style=\"color:white;\"><strong>Comprar ingressos</strong>: <a href="#">cinemark.com.br</a></li>'+
		    	'</ul>'
		    );
		}

	
		// Chame a função para buscar e exibir os detalhes do filme quando a página carregar.
		$(document).ready(function () {
		    getMovieDetailsFromURI();
		    getHeroBanner();
		});

  </script>  

  </main><!-- End #main -->
<jsp:include page="footer.jsp" />