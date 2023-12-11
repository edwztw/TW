<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<jsp:include page="head.jsp" />

<body style="background-color: black;">

	<jsp:include page="navbar.jsp" />

	<!-- ======= Hero Section ======= -->
	<section id="hero"
		class="d-flex align-items-center justify-content-center">
		<div class="container" data-aos="fade-up">

			<div class="row justify-content-center" data-aos="fade-up"
				data-aos-delay="150">
				<div class="col-xl-6 col-lg-8">
					<h1>
						Compartilhe suas ideias, surfe nessa onda<span>.</span>
					</h1>
					<h2>Compre seus ingressos e faça sua resenha.</h2>
				</div>
			</div>

			<!-- ======= Portfoio Section ======= -->
			<section id="portfolio" class="portfoio">
				<div class="container" data-aos="fade-up">

					<div class="section-title">
						<h2>Vilmes</h2>
					</div>

					<div class="row">
						<div class="col-lg-12 d-flex justify-content-center">
							<ul id="portfolio-flters">
								<li data-filter="*" class="filter-active">All</li>
								<li data-filter=".filter-app">App</li>
								<li data-filter=".filter-card">Card</li>
								<li data-filter=".filter-web">Web</li>
							</ul>
						</div>
					</div>


					<div id="pfContent" class="row portfolio-container" style="position: relative; height:1000px">
						<script>
						    $(document).ready(function () {
						        getRecentMovies();
						        getHeroBanner();
						    });
						
						    function getHeroBanner() {
						        $.ajax({
						            url: "https://api.themoviedb.org/3/movie/popular?language=pt-BR",
						            data: {
						                api_key: "db2e1996e8f3cccdec769dce7aa8211d"
						            },
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
						
						    function getRecentMovies() {
						        $.ajax({
						            url: "https://api.themoviedb.org/3/movie/now_playing?language=pt-BR",
						            data: {
						                api_key: "db2e1996e8f3cccdec769dce7aa8211d"
						            },
						            success: function (result) {
						                displayRecentMovies(result.results);
						                // Adicione a chamada para a função que exibe os itens do portfólio
						                displayPortfolioItems(result.results);
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
						
						    // Função para exibir os itens do portfólio dinamicamente
						    function displayPortfolioItems(movies) {
					        var portfolioDiv = $("#pfContent");
						        
						        $.each(movies, function (index, movie) {
						            var portfolioItem = $("<div class='col-lg-4 col-md-6 portfolio-item filter-app'>");
						            var imgSrc = "https://image.tmdb.org/t/p/w500" + movie.poster_path;
						
						            var img = $("<img class='img-fluid' alt='" + movie.title + "' src='" + imgSrc + "'>");
						            var portfolioInfo = $("<div class='portfolio-info'>");
						
						            portfolioInfo.append("<h4>" + movie.title + "</h4>");
						            portfolioInfo.append("<p>App</p>");
						
						            var previewLink = $("<a href='" + imgSrc + "' data-gallery='portfolioGallery' class='portfolio-lightbox preview-link' title='" + movie.title + "'><i class='bx bx-plus'></i></a>");
						            var detailsLink = $("<a href='portfolio-details.html' class='details-link' title='More Details'><i class='bx bx-link'></i></a>");
						
						            portfolioInfo.append(previewLink);
						            portfolioInfo.append(detailsLink);
						
						            portfolioItem.append(img);
						            portfolioItem.append(portfolioInfo);
						            portfolioItem.append("</div>");
						            portfolioDiv.append(portfolioItem);
						        });
						    }
						</script>
					</div>
				</div>
			</section>
			<!-- End Portfoio Section -->
		</div>
	</section>
	<!-- End Hero -->

	<main id="main">

		<!-- ======= Services Section ======= -->
		<section id="services" class="services">
			<div class="container">

				<div class="section-title">
					<h2>O QUE VOCÊ PODE FAZER NO TICKET WAVE?</h2>
				</div>

				<div class="row">
					<div class="col-lg-4 col-md-6">
						<div class="icon-box">
							<div class="icon">
								<i class="bi bi-ticket-detailed" style="color: white;"></i>
							</div>
							<h4 class="title">
								<a href="">Adquira Ingressos</a>
							</h4>
							<p class="description">Reserve assentos em qualquer cinema do
								Brasil! A Ticket Wave mantém parceria com Cinépolis, Cinemark e
								muito mais.</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mt-4 mt-md-0">
						<div class="icon-box">
							<div class="icon">
								<i class="bi bi-bookmark-heart-fill" style="color: white;"></i>
							</div>
							<h4 class="title">
								<a href="">Favoritos Pertinho</a>
							</h4>
							<p class="description">Fique à distância de um toque de
								qualquer filme, resenha ou gênero ao favoritá-los.</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
						<div class="icon-box">
							<div class="icon">
								<i class="bi bi-globe-americas" style="color: white;"></i>
							</div>
							<h4 class="title">
								<a href="">Compartilhe Mundialmente</a>
							</h4>
							<p class="description">Expanda seus horizontes ao conhecer e
								falar sobre filmes do mundo inteiro.</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mt-4">
						<div class="icon-box">
							<div class="icon">
								<i class="bi bi-file-earmark-text-fill" style="color: white;"></i>
							</div>
							<h4 class="title">
								<a href="">Venha Resenhar</a>
							</h4>
							<p class="description">Faça avaliações, explique seus
								critérios e crie seu próprio ranking de filmes com suas
								resenhas.</p>
						</div>
					</div>

					<div class="col-lg-4 col-md-6 mt-4">
						<div class="icon-box">
							<div class="icon">
								<i class="bi bi-journal-check" style="color: white;"></i>
							</div>
							<h4 class="title">
								<a href="">Faça Anotações</a>
							</h4>
							<p class="description">Mantenha um registro de tudo que você
								já assistiu e compartilhe seus logs com outros usuários.</p>
						</div>
					</div>
					<div class="col-lg-4 col-md-6 mt-4">
						<div class="icon-box">
							<div class="icon">
								<i class="bi bi-chat-square-quote-fill" style="color: white;"></i>
							</div>
							<h4 class="title">
								<a href="">Guarde Citações</a>
							</h4>
							<p class="description">Alguma fala do roteiro tocou seu
								coração? Registre suas citações favoritas.</p>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End Services Section -->

		<!-- ======= ULTIMAS POSTAGENS MAIS FAMOSAS ======= -->


		<!-- muita encheção de linguiça, fiz duas colunas com cards diferentes -->
		<section id="about" class="about">
			<div class="container" data-aos="fade-up">
				<div class="section-title">
					<h2>POSTAGENS POPULARES DA ÚLTIMA SEMANA</h2>
				</div>
				<div class="row">
					<div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left"
						data-aos-delay="100">
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="..." class="img-fluid rounded-start" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">Card title</h5>
										<p class="card-text">This is a wider card with supporting
											text below as a natural lead-in to additional content. This
											content is a little bit longer.</p>
										<p class="card-text">
											<small class="text-body-secondary">Last updated 3
												mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="..." class="img-fluid rounded-start" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">Card title</h5>
										<p class="card-text">This is a wider card with supporting
											text below as a natural lead-in to additional content. This
											content is a little bit longer.</p>
										<p class="card-text">
											<small class="text-body-secondary">Last updated 3
												mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="..." class="img-fluid rounded-start" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">Card title</h5>
										<p class="card-text">This is a wider card with supporting
											text below as a natural lead-in to additional content. This
											content is a little bit longer.</p>
										<p class="card-text">
											<small class="text-body-secondary">Last updated 3
												mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="..." class="img-fluid rounded-start" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">Card title</h5>
										<p class="card-text">This is a wider card with supporting
											text below as a natural lead-in to additional content. This
											content is a little bit longer.</p>
										<p class="card-text">
											<small class="text-body-secondary">Last updated 3
												mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="..." class="img-fluid rounded-start" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">Card title</h5>
										<p class="card-text">This is a wider card with supporting
											text below as a natural lead-in to additional content. This
											content is a little bit longer.</p>
										<p class="card-text">
											<small class="text-body-secondary">Last updated 3
												mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="..." class="img-fluid rounded-start" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">Card title</h5>
										<p class="card-text">This is a wider card with supporting
											text below as a natural lead-in to additional content. This
											content is a little bit longer.</p>
										<p class="card-text">
											<small class="text-body-secondary">Last updated 3
												mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
						<div class="card mb-3" style="max-width: 540px;">
							<div class="row g-0">
								<div class="col-md-4">
									<img src="..." class="img-fluid rounded-start" alt="...">
								</div>
								<div class="col-md-8">
									<div class="card-body">
										<h5 class="card-title">Card title</h5>
										<p class="card-text">This is a wider card with supporting
											text below as a natural lead-in to additional content. This
											content is a little bit longer.</p>
										<p class="card-text">
											<small class="text-body-secondary">Last updated 3
												mins ago</small>
										</p>
									</div>
								</div>
							</div>
						</div>
					</div>
					<div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content"
						data-aos="fade-right" data-aos-delay="100">
						<div class="card mb-3 mx-auto">
							<img
								src="https://manualgeek.com.br/wp-content/uploads/2023/12/Capa-Facebook-rosa-nao-ignore-o-seu-potencial-2023-12-04T105131.621.png"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-body-secondary">Last updated 3 mins
										ago</small>
								</p>
							</div>
						</div>
						<div class="card mb-3 mx-auto">
							<img
								src="https://macmagazine.com.br/wp-content/uploads/2023/07/10-napoleon-trailer.jpg"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-body-secondary">Last updated 3 mins
										ago</small>
								</p>
							</div>
						</div>
						<div class="card mb-3 mx-auto">
							<img
								src="https://i0.wp.com/geekpopnews.com.br/wp-content/uploads/2023/08/a-chamada-capa.jpg?resize=1200%2C640&ssl=1"
								class="card-img-top" alt="...">
							<div class="card-body">
								<h5 class="card-title">Card title</h5>
								<p class="card-text">This is a wider card with supporting
									text below as a natural lead-in to additional content. This
									content is a little bit longer.</p>
								<p class="card-text">
									<small class="text-body-secondary">Last updated 3 mins
										ago</small>
								</p>
							</div>
						</div>
					</div>
				</div>

			</div>
		</section>
		<!-- End About Section -->


		<!-- ======= Clients Section ======= -->
		<!-- ======= Clients Section ======= -->
		<section id="clients" class="clients section-bg">
			<div class="container">

				<div class="row">

					<div
						class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
						<img
							src="https://upload.wikimedia.org/wikipedia/pt/9/99/Kinoplex.png"
							class="img-fluid" alt="">
					</div>

					<div
						class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
						<img src="https://ucibrasil.com.br/web/img/logo.png"
							class="img-fluid" alt="">
					</div>

					<div
						class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
						<img
							src="https://malucellidotlive.files.wordpress.com/2017/08/cinepolis-logo-transp.png"
							class="img-fluid" alt="">
					</div>

					<div
						class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
						<img
							src="https://ativagruposbf.com.br/explorer/uploads/upload_1662594981.png"
							class="img-fluid" alt="">
					</div>

					<div
						class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
						<img
							src="https://seeklogo.com/images/P/Playarte_Pictures-logo-B133CCE3BF-seeklogo.com.png"
							class="img-fluid" alt="">
					</div>

					<div
						class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
						<img
							src="https://www.caruarushopping.com/wp-content/uploads/2015/09/centerplex-cinemas.png"
							class="img-fluid" alt="">
					</div>

				</div>

			</div>
		</section>
		<!-- End Clients Section -->

		<!-- ======= Counts Section ======= -->
		<section id="counts" class="counts">
			<div class="container" data-aos="fade-up">

				<div class="row no-gutters">
					<div
						class="image col-xl-5 d-flex align-items-stretch justify-content-center justify-content-lg-start"
						data-aos="fade-right" data-aos-delay="100"></div>
					<div
						class="col-xl-7 ps-4 ps-lg-5 pe-4 pe-lg-1 d-flex align-items-stretch"
						data-aos="fade-left" data-aos-delay="100">
						<div class="content d-flex flex-column justify-content-center">
							<h3>Voluptatem dignissimos provident quasi</h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipiscing elit,
								sed do eiusmod tempor incididunt ut labore et dolore magna
								aliqua. Duis aute irure dolor in reprehenderit</p>
							<div class="row">
								<div class="col-md-6 d-md-flex align-items-md-stretch">
									<div class="count-box">
										<i class="bi bi-emoji-smile"></i> <span
											data-purecounter-start="0" data-purecounter-end="65"
											data-purecounter-duration="2" class="purecounter"></span>
										<p>
											<strong>Happy Clients</strong> consequuntur voluptas nostrum
											aliquid ipsam architecto ut.
										</p>
									</div>
								</div>

								<div class="col-md-6 d-md-flex align-items-md-stretch">
									<div class="count-box">
										<i class="bi bi-journal-richtext"></i> <span
											data-purecounter-start="0" data-purecounter-end="85"
											data-purecounter-duration="2" class="purecounter"></span>
										<p>
											<strong>Projects</strong> adipisci atque cum quia aspernatur
											totam laudantium et quia dere tan
										</p>
									</div>
								</div>

								<div class="col-md-6 d-md-flex align-items-md-stretch">
									<div class="count-box">
										<i class="bi bi-clock"></i> <span data-purecounter-start="0"
											data-purecounter-end="35" data-purecounter-duration="4"
											class="purecounter"></span>
										<p>
											<strong>Years of experience</strong> aut commodi quaerat modi
											aliquam nam ducimus aut voluptate non vel
										</p>
									</div>
								</div>

								<div class="col-md-6 d-md-flex align-items-md-stretch">
									<div class="count-box">
										<i class="bi bi-award"></i> <span data-purecounter-start="0"
											data-purecounter-end="20" data-purecounter-duration="4"
											class="purecounter"></span>
										<p>
											<strong>Awards</strong> rerum asperiores dolor alias quo
											reprehenderit eum et nemo pad der
										</p>
									</div>
								</div>
							</div>
						</div>
						<!-- End .content-->
					</div>
				</div>

			</div>
		</section>
		<!-- End Counts Section -->

		<!-- ======= Testimonials Section ======= -->
		<section id="testimonials" class="testimonials">
			<div class="container" data-aos="zoom-in">

				<div class="testimonials-slider swiper" data-aos="fade-up"
					data-aos-delay="100">
					<div class="swiper-wrapper">

						<div class="swiper-slide">
							<div class="testimonial-item">
								<img src="assets/img/testimonials/testimonials-1.jpg"
									class="testimonial-img" alt="">
								<h3>Saul Goodman</h3>
								<h4>Ceo &amp; Founder</h4>
								<p>
									<i class="bx bxs-quote-alt-left quote-icon-left"></i> Proin
									iaculis purus consequat sem cure digni ssim donec porttitora
									entum suscipit rhoncus. Accusantium quam, ultricies eget id,
									aliquam eget nibh et. Maecen aliquam, risus at semper. <i
										class="bx bxs-quote-alt-right quote-icon-right"></i>
								</p>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<img src="assets/img/testimonials/testimonials-2.jpg"
									class="testimonial-img" alt="">
								<h3>Sara Wilsson</h3>
								<h4>Designer</h4>
								<p>
									<i class="bx bxs-quote-alt-left quote-icon-left"></i> Export
									tempor illum tamen malis malis eram quae irure esse labore quem
									cillum quid cillum eram malis quorum velit fore eram velit sunt
									aliqua noster fugiat irure amet legam anim culpa. <i
										class="bx bxs-quote-alt-right quote-icon-right"></i>
								</p>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<img src="assets/img/testimonials/testimonials-3.jpg"
									class="testimonial-img" alt="">
								<h3>Jena Karlis</h3>
								<h4>Store Owner</h4>
								<p>
									<i class="bx bxs-quote-alt-left quote-icon-left"></i> Enim nisi
									quem export duis labore cillum quae magna enim sint quorum
									nulla quem veniam duis minim tempor labore quem eram duis
									noster aute amet eram fore quis sint minim. <i
										class="bx bxs-quote-alt-right quote-icon-right"></i>
								</p>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<img src="assets/img/testimonials/testimonials-4.jpg"
									class="testimonial-img" alt="">
								<h3>Matt Brandon</h3>
								<h4>Freelancer</h4>
								<p>
									<i class="bx bxs-quote-alt-left quote-icon-left"></i> Fugiat
									enim eram quae cillum dolore dolor amet nulla culpa multos
									export minim fugiat minim velit minim dolor enim duis veniam
									ipsum anim magna sunt elit fore quem dolore labore illum
									veniam. <i class="bx bxs-quote-alt-right quote-icon-right"></i>
								</p>
							</div>
						</div>
						<!-- End testimonial item -->

						<div class="swiper-slide">
							<div class="testimonial-item">
								<img src="assets/img/testimonials/testimonials-5.jpg"
									class="testimonial-img" alt="">
								<h3>John Larson</h3>
								<h4>Entrepreneur</h4>
								<p>
									<i class="bx bxs-quote-alt-left quote-icon-left"></i> Quis
									quorum aliqua sint quem legam fore sunt eram irure aliqua
									veniam tempor noster veniam enim culpa labore duis sunt culpa
									nulla illum cillum fugiat legam esse veniam culpa fore nisi
									cillum quid. <i class="bx bxs-quote-alt-right quote-icon-right"></i>
								</p>
							</div>
						</div>
						<!-- End testimonial item -->
					</div>
					<div class="swiper-pagination"></div>
				</div>

			</div>
		</section>
		<!-- End Testimonials Section -->

	</main>
	<!-- End #main -->

	<!-- ======= Footer ======= -->
	<footer id="footer">
		<div class="footer-top">
			<div class="container">
				<div class="row">

					<div class="col-lg-3 col-md-6">
						<div class="footer-info">
							<h3>
								Gp<span>.</span>
							</h3>
							<p>
								A108 Adam Street <br> NY 535022, USA<br>
								<br> <strong>Phone:</strong> +1 5589 55488 55<br> <strong>Email:</strong>
								info@example.com<br>
							</p>
							<div class="social-links mt-3">
								<a href="#" class="twitter"><i class="bx bxl-twitter"></i></a> <a
									href="#" class="facebook"><i class="bx bxl-facebook"></i></a> <a
									href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
								<a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
								<a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
							</div>
						</div>
					</div>

					<div class="col-lg-2 col-md-6 footer-links">
						<h4>Useful Links</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Home</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">About
									us</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Services</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Terms
									of service</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Privacy
									policy</a></li>
						</ul>
					</div>

					<div class="col-lg-3 col-md-6 footer-links">
						<h4>Our Services</h4>
						<ul>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Design</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Web
									Development</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Product
									Management</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Marketing</a></li>
							<li><i class="bx bx-chevron-right"></i> <a href="#">Graphic
									Design</a></li>
						</ul>
					</div>

					<div class="col-lg-4 col-md-6 footer-newsletter">
						<h4>Our Newsletter</h4>
						<p>Tamen quem nulla quae legam multos aute sint culpa legam
							noster magna</p>
						<form action="" method="post">
							<input type="email" name="email"><input type="submit"
								value="Subscribe">
						</form>

					</div>

				</div>
			</div>
		</div>

		<div class="container">
			<div class="copyright">
				&copy; Copyright <strong><span>Gp</span></strong>. All Rights
				Reserved
			</div>
			<div class="credits">
				<!-- All the links in the footer should remain intact. -->
				<!-- You can delete the links only if you purchased the pro version. -->
				<!-- Licensing information: https://bootstrapmade.com/license/ -->
				<!-- Purchase the pro version with working PHP/AJAX contact form: https://bootstrapmade.com/gp-free-multipurpose-html-bootstrap-template/ -->
				Designed by <a href="https://bootstrapmade.com/">BootstrapMade</a>
			</div>
		</div>
	</footer>
	<!-- End Footer -->

	<div id="preloader"></div>
	<a href="#"
		class="back-to-top d-flex align-items-center justify-content-center"><i
		class="bi bi-arrow-up-short"></i></a>

	<!-- Vendor JS Files -->
	<script src="assets/vendor/purecounter/purecounter_vanilla.js"></script>
	<script src="assets/vendor/aos/aos.js"></script>
	<script src="assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="assets/vendor/glightbox/js/glightbox.min.js"></script>
	<script src="assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
	<script src="assets/vendor/swiper/swiper-bundle.min.js"></script>
	<script src="assets/vendor/php-email-form/validate.js"></script>

	<!-- Template Main JS File -->
	<script src="assets/js/main.js"></script>

</body>

</html>