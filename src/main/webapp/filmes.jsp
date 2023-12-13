<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<jsp:include page="head.jsp" />

<body style="background-color: black;">

	<jsp:include page="navbar.jsp" />

	<section id="hero" class="d-flex align-items-center justify-content-center">
    	<div class="container" data-aos="fade-up">
	      	<div class="row justify-content-center" data-aos="fade-up" data-aos-delay="150">
		        <div class="col-xl-6 col-lg-8">
			          <h1>Buscando filmes<span>?</span></h1>
			          <h2>Surfe nessa onda.</h2>
		        </div>
	      	</div>

      <!-- ======= Portfoio Section ======= -->
			<section id="portfolio" class="portfoio">
				<div class="container" data-aos="fade-up">
					<div class="section-title">
						<h2>Filmes</h2>
					</div>
				
					<div class="row">
						<div class="col-lg-12 d-flex justify-content-center">
							<ul id="portfolio-flters">
								<li style="color:white" data-filter="*" class="filter-active">All</li>
								<li style="color:white" data-filter=".filter-app">App</li>
								<li style="color:white" data-filter=".filter-card">Card</li>
								<li style="color:white" data-filter=".filter-web">Web</li>
							</ul>
						</div>
					</div>
					<div id="pfContent" class="row portfolio-container" style="position: relative; min-height:4000px">
						<script>				    
						    $(document).ready(async function () {
						        try {
						            await getRecentMovies();
						            await getHeroBanner();
						            displayPortfolioItems(result.results);
						        } catch (error) {
						            console.error("Error:", error);
						        }
						    });
						
						    function getHeroBanner() {
						        $.ajax({
						            url: "/ticket_wave/lista",					            
						            success: function (result) {
						                if (result.results.length > 0) {
						                    setHeroBanner(result.results[0]);
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
						    
						    async function getRecentMovies() {
						        return new Promise((resolve, reject) => {
						            $.ajax({
						                url: "/ticket_wave/lista",
						                success: function (result) {
						                	displayPortfolioItems(result.results);
						                    resolve(result);
						                },
						                error: function (error) {
						                    reject(error);
						                }
						            });
						        });
						    }
						
						
						    // Função para exibir os itens do portfólio dinamicamente
						    function displayPortfolioItems(movies) {
					        var portfolioDiv = $("#pfContent");
						        
						        $.each(movies, function (index, movie) {
						            var portfolioItem = $("<div class='col-lg-4 col-md-6 portfolio-item filter-app'>");
						            var imgSrc = "https://image.tmdb.org/t/p/w500" + movie.poster_path;
						
						            var img = $("<img src='" + imgSrc + "' class='img-fluid'>");
						            var portfolioInfo = $("<div class='portfolio-info'>");
						
						            portfolioInfo.append("<h4>" + movie.title + "</h4>");
						            portfolioInfo.append("<p>App</p>");
						
						            var previewLink = $("<a href='" + imgSrc + "' data-gallery='portfolioGallery' class='portfolio-lightbox preview-link' title='" + movie.title + "'><i class='bx bx-plus'></i></a>");
						            var detailsLink = $("<a href='/ticket_wave/details.jsp?id="+movie.id+"' class='details-link' title='More Details'><i class='bx bx-link'></i></a></div></div>");
						
						            portfolioInfo.append(previewLink);
						            portfolioInfo.append(detailsLink);
						
						            portfolioItem.append(img);
						            portfolioItem.append(portfolioInfo);
						            portfolioDiv.append(portfolioItem);
						        });
						        portfolioDiv.show();
						    }
						</script>
					</div>
				</div>
			</section>
			<!-- End Portfoio Section -->
		</div>
	</section>
	<!-- End Hero -->
  <jsp:include page="footer.jsp" />