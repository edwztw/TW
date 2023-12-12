 <%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
 <header id="header" class="fixed-top ">
   <div class="container d-flex align-items-center justify-content-lg-between">
   
     <a href="/ticket_wave/index.jsp" class="logo me-auto me-lg-0"><img src="assets/img/ticket-blue-png.png" alt="" class="img-fluid"></a>

     <nav id="navbar" class="navbar order-last order-lg-0">
       <ul>
         <li><a class="nav-link scrollto active" href="/ticket_wave/index.jsp">Início</a></li>
         <li><a class="nav-link scrollto" href="#about">Ingressos</a></li>
         <li><a class="nav-link scrollto" href="#services">Filmes</a></li>
         <li><a class="nav-link scrollto " href="#portfolio">Resenhas</a></li>
         <li class="dropdown"><a href="#"><span>Favoritos</span> <i class="bi bi-chevron-down"></i></a>
           <ul>
             <li><a href="#">Top Filmes</a></li>
             <li><a href="#">Top Resenhas</a></li>
             <li class="dropdown"><a href="#"><span>Top Gêneros</span> <i class="bi bi-chevron-right"></i></a>
               <ul>
                 <li><a href="#">Gênero 1</a></li>
                 <li><a href="#">Gênero 2</a></li>
                 <li><a href="#">Gênero 3</a></li>
                 <li><a href="#">Gênero 4</a></li>
                 <li><a href="#">Gênero 5</a></li>
               </ul>
             </li>
           </ul>
         </li>
       </ul>
       <i class="bi bi-list mobile-nav-toggle"></i>
     </nav><!-- .navbar -->
     <a href="#"><i class="bi bi-search"></i></a>
     <a href="/ticket_wave/Login.jsp" class="get-started-btn scrollto" id="loginButton">Entrar</a>
     <div id="userNameContainer" style="color:white"></div>
     <jsp:include page="js/auth.js" />
   </div>
 </header><!-- End Header -->