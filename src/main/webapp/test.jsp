<section id="portfolio" class="portfoio">
				<div class="container aos-init aos-animate" data-aos="fade-up">

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


					<div class="row portfolio-container" style="position: relative; height: 0px;">
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
						        var portfolioDiv = $("#portfolio");
						        
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
						           
						            portfolioDiv.append(portfolioItem);
						        });
						    }
						</script>
					
				
			</div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Freelance" src="https://image.tmdb.org/t/p/w500/zDb5YeHSGGMlS6eqhUXcVU2OzAJ.jpg"><div class="portfolio-info"><h4>Freelance</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/zDb5YeHSGGMlS6eqhUXcVU2OzAJ.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Freelance"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Assassinos da Lua das Flores" src="https://image.tmdb.org/t/p/w500/sz0HswdqLa6I5ialoyBvn5gm0r5.jpg"><div class="portfolio-info"><h4>Assassinos da Lua das Flores</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/sz0HswdqLa6I5ialoyBvn5gm0r5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Assassinos da Lua das Flores"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Trolls 3 - Juntos Novamente" src="https://image.tmdb.org/t/p/w500/7mC4iunNnWrHIBamKqiHkpFI32X.jpg"><div class="portfolio-info"><h4>Trolls 3 - Juntos Novamente</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/7mC4iunNnWrHIBamKqiHkpFI32X.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Trolls 3 - Juntos Novamente"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Leo" src="https://image.tmdb.org/t/p/w500/pD6sL4vntUOXHmuvJPPZAgvyfd9.jpg"><div class="portfolio-info"><h4>Leo</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/pD6sL4vntUOXHmuvJPPZAgvyfd9.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Leo"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Wonka" src="https://image.tmdb.org/t/p/w500/AbkZUxkVZU8XhoRGkknu6cZUark.jpg"><div class="portfolio-info"><h4>Wonka</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/AbkZUxkVZU8XhoRGkknu6cZUark.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Wonka"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Five Nights at Freddy" s="" -="" o="" pesadelo="" sem="" fim'="" src="https://image.tmdb.org/t/p/w500/1yUbmAiw2cUSpyXNIaiST7JzCtG.jpg"><div class="portfolio-info"><h4>Five Nights at Freddy's - O Pesadelo Sem Fim</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/1yUbmAiw2cUSpyXNIaiST7JzCtG.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Five Nights at Freddy" s="" -="" o="" pesadelo="" sem="" fim'=""><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Jogos Vorazes: A Cantiga dos Pássaros e das Serpentes" src="https://image.tmdb.org/t/p/w500/nNNxK2NwqHmAjuStya7SwOQeMwq.jpg"><div class="portfolio-info"><h4>Jogos Vorazes: A Cantiga dos Pássaros e das Serpentes</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/nNNxK2NwqHmAjuStya7SwOQeMwq.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Jogos Vorazes: A Cantiga dos Pássaros e das Serpentes"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Os Caras Malvados: Um Natal do Mal" src="https://image.tmdb.org/t/p/w500/tHTEgWMPg7AdeotObEUqdOo98Zx.jpg"><div class="portfolio-info"><h4>Os Caras Malvados: Um Natal do Mal</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/tHTEgWMPg7AdeotObEUqdOo98Zx.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Os Caras Malvados: Um Natal do Mal"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="As Marvels" src="https://image.tmdb.org/t/p/w500/gmtrDKIKXRFkChgHGALZTiKDVo0.jpg"><div class="portfolio-info"><h4>As Marvels</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/gmtrDKIKXRFkChgHGALZTiKDVo0.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="As Marvels"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Godzilla Minus One" src="https://image.tmdb.org/t/p/w500/iXrCBynsyRGbOtoBeWjt1bRINuA.jpg"><div class="portfolio-info"><h4>Godzilla Minus One</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/iXrCBynsyRGbOtoBeWjt1bRINuA.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Godzilla Minus One"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Travessuras de Natal" src="https://image.tmdb.org/t/p/w500/l3qGXGEE6GgcLBdlsmhR2NuZZIy.jpg"><div class="portfolio-info"><h4>Travessuras de Natal</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/l3qGXGEE6GgcLBdlsmhR2NuZZIy.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Travessuras de Natal"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="A Batalha de Natal" src="https://image.tmdb.org/t/p/w500/7xz7evAsp4wqwSBSZLnNd13wBZt.jpg"><div class="portfolio-info"><h4>A Batalha de Natal</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/7xz7evAsp4wqwSBSZLnNd13wBZt.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="A Batalha de Natal"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Napoleão" src="https://image.tmdb.org/t/p/w500/5lkM8eyWLdzHwvhB1jBUxpCLmLR.jpg"><div class="portfolio-info"><h4>Napoleão</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/5lkM8eyWLdzHwvhB1jBUxpCLmLR.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Napoleão"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="O Mundo Depois de Nós" src="https://image.tmdb.org/t/p/w500/qwHZInQ0MBa1DxHV66ExCCUzBf5.jpg"><div class="portfolio-info"><h4>O Mundo Depois de Nós</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/qwHZInQ0MBa1DxHV66ExCCUzBf5.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="O Mundo Depois de Nós"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Wish: O Poder dos Desejos" src="https://image.tmdb.org/t/p/w500/g4XRsmlacnf99OZSCBF1Wlzzbst.jpg"><div class="portfolio-info"><h4>Wish: O Poder dos Desejos</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/g4XRsmlacnf99OZSCBF1Wlzzbst.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Wish: O Poder dos Desejos"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Jogos Mortais X" src="https://image.tmdb.org/t/p/w500/ch1BGjadaiPU59zYbb6zPUTZtyO.jpg"><div class="portfolio-info"><h4>Jogos Mortais X</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/ch1BGjadaiPU59zYbb6zPUTZtyO.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Jogos Mortais X"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Som da Liberdade" src="https://image.tmdb.org/t/p/w500/hwOHbymoAhjrMx7v5ShHCNIP4NI.jpg"><div class="portfolio-info"><h4>Som da Liberdade</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/hwOHbymoAhjrMx7v5ShHCNIP4NI.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Som da Liberdade"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="O Exorcista: O Devoto" src="https://image.tmdb.org/t/p/w500/sJtfth9oaDWx1PwzT0vGKNXwjKz.jpg"><div class="portfolio-info"><h4>O Exorcista: O Devoto</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/sJtfth9oaDWx1PwzT0vGKNXwjKz.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="O Exorcista: O Devoto"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="Trocados" src="https://image.tmdb.org/t/p/w500/qvzfsE88SJAKql3IGl2Y2KdQpAV.jpg"><div class="portfolio-info"><h4>Trocados</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/qvzfsE88SJAKql3IGl2Y2KdQpAV.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="Trocados"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div><div class="col-lg-4 col-md-6 portfolio-item filter-app"><img class="img-fluid" alt="A Chamada" src="https://image.tmdb.org/t/p/w500/eqaSh2PjYcGpS6rybz6UjLNuvrg.jpg"><div class="portfolio-info"><h4>A Chamada</h4><p>App</p><a href="https://image.tmdb.org/t/p/w500/eqaSh2PjYcGpS6rybz6UjLNuvrg.jpg" data-gallery="portfolioGallery" class="portfolio-lightbox preview-link" title="A Chamada"><i class="bx bx-plus"></i></a><a href="portfolio-details.html" class="details-link" title="More Details"><i class="bx bx-link"></i></a></div></div></section>