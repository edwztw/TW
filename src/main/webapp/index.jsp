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
			          <h1>Compartilhe suas ideias, surfe nessa onda<span>.</span></h1>
			          <h2>Compre seus ingressos e faça sua resenha.</h2>
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
            <div class="icon"><i class="bi bi-ticket-detailed" style="color: white;"></i></div>
            <h4 class="title"><a href="">Adquira Ingressos</a></h4>
            <p class="description">Reserve assentos em qualquer cinema do Brasil! A Ticket Wave mantém parceria com Cinépolis, Cinemark e muito mais.</p>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mt-4 mt-md-0">
          <div class="icon-box">
            <div class="icon"><i class="bi bi-bookmark-heart-fill" style="color: white;"></i></div>
            <h4 class="title"><a href="">Favoritos Pertinho</a></h4>
            <p class="description">Fique à distância de um toque de qualquer filme, resenha ou gênero ao favoritá-los.</p>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 mt-4 mt-lg-0">
          <div class="icon-box">
            <div class="icon"><i class="bi bi-globe-americas" style="color: white;"></i></div>
            <h4 class="title"><a href="">Compartilhe Mundialmente</a></h4>
            <p class="description">Expanda seus horizontes ao conhecer e falar sobre filmes do mundo inteiro.</p>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mt-4">
          <div class="icon-box">
            <div class="icon"><i class="bi bi-file-earmark-text-fill" style="color:white;"></i></div>
            <h4 class="title"><a href="">Venha Resenhar</a></h4>
            <p class="description">Faça avaliações, explique seus critérios e crie seu próprio ranking de filmes com suas resenhas.</p>
          </div>
        </div>

        <div class="col-lg-4 col-md-6 mt-4">
          <div class="icon-box">
            <div class="icon"><i class="bi bi-journal-check" style="color: white;"></i></div>
            <h4 class="title"><a href="">Faça Anotações</a></h4>
            <p class="description">Mantenha um registro de tudo que você já assistiu e compartilhe seus logs com outros usuários.</p>
          </div>
        </div>
        <div class="col-lg-4 col-md-6 mt-4">
          <div class="icon-box">
            <div class="icon"><i class="bi bi-chat-square-quote-fill" style="color: white;"></i></div>
            <h4 class="title"><a href="">Guarde Citações</a></h4>
            <p class="description">Alguma fala do roteiro tocou seu coração? Registre suas citações favoritas.</p>
          </div>
        </div>
      </div>

    </div>
  </section><!-- End Services Section -->

    <!-- ======= ULTIMAS POSTAGENS MAIS FAMOSAS ======= -->
    
      
      <!-- muita encheção de linguiça, fiz duas colunas com cards diferentes -->
      <section id="about" class="about">
        <div class="container" data-aos="fade-up">
          <div class="section-title">
            <h2>POSTAGENS POPULARES DA ÚLTIMA SEMANA</h2>
          </div>
          <div class="row">
            <div class="col-lg-6 order-1 order-lg-2" data-aos="fade-left" data-aos-delay="100">
              <div class="card mb-3" style="max-width: 540px;">
                <div class="row g-0">
                  <div class="col-md-4">
                    <img src="..." class="img-fluid rounded-start" alt="...">
                  </div>
                  <div class="col-md-8">
                    <div class="card-body">
                      <h5 class="card-title">Card title</h5>
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
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
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
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
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
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
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
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
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
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
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
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
                      <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                      <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                    </div>
                  </div>
                </div>
              </div>
            </div>
            <div class="col-lg-6 pt-4 pt-lg-0 order-2 order-lg-1 content" data-aos="fade-right" data-aos-delay="100">
              <div class="card mb-3 mx-auto">
                <img src="https://manualgeek.com.br/wp-content/uploads/2023/12/Capa-Facebook-rosa-nao-ignore-o-seu-potencial-2023-12-04T105131.621.png" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                </div>
              </div>
              <div class="card mb-3 mx-auto">
                <img src="https://macmagazine.com.br/wp-content/uploads/2023/07/10-napoleon-trailer.jpg" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                </div>
              </div>
              <div class="card mb-3 mx-auto">
                <img src="https://i0.wp.com/geekpopnews.com.br/wp-content/uploads/2023/08/a-chamada-capa.jpg?resize=1200%2C640&ssl=1" class="card-img-top" alt="...">
                <div class="card-body">
                  <h5 class="card-title">Card title</h5>
                  <p class="card-text">This is a wider card with supporting text below as a natural lead-in to additional content. This content is a little bit longer.</p>
                  <p class="card-text"><small class="text-body-secondary">Last updated 3 mins ago</small></p>
                </div>
              </div>
            </div>
          </div>

        </div>
      </section><!-- End About Section -->
    

    <!-- ======= Clients Section ======= -->
    <!-- ======= Clients Section ======= -->
    <section id="clients" class="clients section-bg">
      <div class="container">

        <div class="row">

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="https://upload.wikimedia.org/wikipedia/pt/9/99/Kinoplex.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="https://ucibrasil.com.br/web/img/logo.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="https://malucellidotlive.files.wordpress.com/2017/08/cinepolis-logo-transp.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="https://ativagruposbf.com.br/explorer/uploads/upload_1662594981.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="https://seeklogo.com/images/P/Playarte_Pictures-logo-B133CCE3BF-seeklogo.com.png" class="img-fluid" alt="">
          </div>

          <div class="col-lg-2 col-md-4 col-6 d-flex align-items-center justify-content-center">
            <img src="https://www.caruarushopping.com/wp-content/uploads/2015/09/centerplex-cinemas.png" class="img-fluid" alt="">
          </div>

        </div>

      </div>
    </section><!-- End Clients Section -->

    <!-- ======= Counts Section ======= -->
    <section id="counts" class="counts">
      <div class="container" data-aos="fade-up">

        <div class="row no-gutters">
          <div class="image col-xl-5 d-flex align-items-stretch justify-content-center justify-content-lg-start" data-aos="fade-right" data-aos-delay="100"></div>
          <div class="col-xl-7 ps-4 ps-lg-5 pe-4 pe-lg-1 d-flex align-items-stretch" data-aos="fade-left" data-aos-delay="100">
            <div class="content d-flex flex-column justify-content-center">
              <h3>O seu destino cinematográfico que vai além da tela.</h3>
              <p>
                Bem-vindo à Ticket Wave, onde a paixão pelo cinema se encontra com a energia contagiante da comunidade. Compre seus ingressos e embarque na jornada cinematográfica definitiva.
              </p>
              <div class="row">
                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-emoji-smile"></i>
                    <span data-purecounter-start="0" data-purecounter-end="1468" data-purecounter-duration="2" class="purecounter"></span>
                    <p><strong>Clientes e usuários satisfeitos.</strong> Nossos usuários estão encantados em "surfar" na onda do cinema e da interação social. A experiência de comprar ingressos se tornou uma jornada compartilhada, elevando a ida ao cinema a um evento único.</p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-journal-richtext"></i>
                    <span data-purecounter-start="0" data-purecounter-end="23" data-purecounter-duration="2" class="purecounter"></span>
                    <p><strong>Parcerias</strong> com redes de cinema em todo o Brasil, garantimos acesso a emocionantes experiências cinematográficas em diversas localidades.</p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-clock"></i>
                    <span data-purecounter-start="0" data-purecounter-end="12" data-purecounter-duration="4" class="purecounter"></span>
                    <p><strong>Anos de experiência</strong> com uma trajetória consolidada no mercado, nos destacamos como uma referência na integração inovadora entre a venda de ingressos para cinema e a construção de uma comunidade apaixonada por filmes.</p>
                  </div>
                </div>

                <div class="col-md-6 d-md-flex align-items-md-stretch">
                  <div class="count-box">
                    <i class="bi bi-award"></i>
                    <span data-purecounter-start="0" data-purecounter-end="8" data-purecounter-duration="4" class="purecounter"></span>
                    <p><strong>Premiações.</strong> Não vendemos apenas ingressos; oferecemos uma experiência. Junte-se a nós e descubra um mundo onde a magia do cinema se funde com a comunidade. Surfe nessa onda conosco - o futuro é cinematográfico e social na Ticket Wave.</p>
                  </div>
                </div>
              </div>
            </div><!-- End .content-->
          </div>
        </div>

      </div>
    </section><!-- End Counts Section -->

    <!-- ======= Testimonials Section ======= -->
    <section id="testimonials" class="testimonials">
      <div class="container" data-aos="zoom-in">

        <div class="testimonials-slider swiper" data-aos="fade-up" data-aos-delay="100">
          <div class="swiper-wrapper">

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="https://s2-oglobo.glbimg.com/-Fa_LUfhpeTxbAdUZTR_fcstzXk=/0x0:1279x717/924x0/smart/filters:strip_icc()/i.s3.glbimg.com/v1/AUTH_da025474c0c44edd99332dddb09cabe8/internal_photos/bs/2023/x/z/MPAIuKSNmrCUfbUW2b0Q/dirty-dancing.png" class="testimonial-img" alt="">
                <h3>Dirty Dancing</h3>
                <h4>Johnny Castle</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Viver com medo é viver pela metade.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="https://assets.folhavitoria.com.br/images/c03c70c0-67ff-11eb-a0e9-d762bf5849eb--minified.jpg" class="testimonial-img" alt="">
                <h3>A Sociedade dos Poetas Mortos</h3>
                <h4>John Keating</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Carpe diem. Aproveitem o dia. Tornem suas vidas extraordinárias.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="https://cenasdecinema.com/wp-content/uploads/2012/10/Django-livre_destaque3.jpg" class="testimonial-img" alt="">
                <h3>Django Livre</h3>
                <h4>Django</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Deixe a liberdade ecoar.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="https://thumbs.jusbr.com/imgs.jusbr.com/publications/images/8dc98aa968508b53d31f0e63502a15f2" class="testimonial-img" alt="">
                <h3>À Procura da Felicidade</h3>
                <h4>Chris Gardner</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Nunca deixe que alguém lhe diga que não pode fazer algo. Se você tem um sonho, tem que protegê-lo. As pessoas que não podem fazer por si mesmas, dirão que você não consegue. Se quer alguma coisa, vá e lute por ela. Ponto final
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->

            <div class="swiper-slide">
              <div class="testimonial-item">
                <img src="https://epipoca.com.br/wp-content/uploads/2021/05/Batman-O-Cavaleiro-das-Trevas-Ressurge-Divulgacao-1200x900.jpg" class="testimonial-img" alt="">
                <h3>Batman - O Cavaleiro das Trevas</h3>
                <h4>Batman</h4>
                <p>
                  <i class="bx bxs-quote-alt-left quote-icon-left"></i>
                  Ou você morre herói, ou vive o suficiente para se tornar o vilão.
                  <i class="bx bxs-quote-alt-right quote-icon-right"></i>
                </p>
              </div>
            </div><!-- End testimonial item -->
          </div>
          <div class="swiper-pagination"></div>
        </div>

      </div>
    </section><!-- End Testimonials Section -->

  </main><!-- End #main -->

  <jsp:include page="footer.jsp" />