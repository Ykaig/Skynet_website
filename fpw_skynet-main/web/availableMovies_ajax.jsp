<%-- 
    Document   : filmDisponibili
    Created on : 8 ago 2022, 18:12:16
    Author     : Simon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <jsp:include page="templates/head_common.jsp"/>
    <title>Skynet Cinema - Movies</title>
    <meta name="description" content="Scopri la programmazione corrente di Skynet Cinema">
    <meta name="keywords" content="skynet,cinema,programmazione,film,movies,biglietti">
</head>

<body>
    
    
    <!-- User not logged -->
    <c:if test="${empty user}">
        <c:redirect url="login.jsp"/>
    </c:if>
    
    <!-- User logged -->
    <c:if test="${not empty user}">
        
       
        
        <jsp:include page="templates/header.jsp"/>
        <jsp:include page="templates/navbar_availablemovies.jsp"/>
   
         <!-- Initializing a list of movies -->
        <c:if test="${empty movie}">
            <c:redirect url="movies" />     
        </c:if>
        
        <div class="layout-grid">
        <main>
            <!-- If the list of movies has elements in it -->
            <c:if test="${not empty movie}">
                    <div class="film-container">
                        <img class="film-thumbnail" src="${movie.getPhoto()}" alt="${movie.getTitle()} thumbnail">
                        <div class="film-dettagli">
                            <h1 class="film-titolo">${movie.getTitle()}</h1>
                            <p class="film-desc">${movie.getDescription()}</p>
                            <br>
                            <p class="film-dataUscita">Data di uscita: ${movie.getReleaseDate()}📅</p>
                            <p class="film-durata">Durata: ${movie.getRunningTime()}min🕒</p>
                            <p class="film-prezzo">Punteggio: ${movie.getScore()}⭐</p>
                            <p class="film-user">Aggiunto da utente: ${movie.getUser_id()}👤</p>
                            <a href="#" class="film-submit">Prenota a ${movie.getPrice()}€</a>
                        </div>
                    </div>
                <div id="movie_ajax_controls">
                   <button id="prevMovie"> < </button>
                   <button id="nextMovie"> > </button>         
                </div>
            </c:if> 
        </main>
        <jsp:include page="templates/infosecondarie.jsp"/>
        </div>
        <jsp:include page="templates/footer.jsp"/>
    </c:if>
    <script type="text/javascript" src="./js/movie_ajax.js"></script>
</body>
</html>

