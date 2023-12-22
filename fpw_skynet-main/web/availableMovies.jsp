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
        
        <!-- Initializing a list of movies -->
        <c:if test="${empty moviesList}">
            <c:redirect url="movies" />     
        </c:if>
        
        <jsp:include page="templates/header.jsp"/>
        <jsp:include page="templates/navbar_availablemovies.jsp"/>
   
        <div class="layout-grid">
        <main>
            <!-- If the list of movies has elements in it -->
            <c:if test="${not empty moviesList}">
                <c:forEach items="${moviesList}" var="movie">
                    <div class="film-container">
                        <img class="film-thumbnail" src="${movie.getPhoto()}">
                        <div class="film-dettagli">
                            <h1 class="film-titolo">${movie.getTitle()}</h1>
                            <p class="film-desc">${movie.getDescription()}</p>
                            <br>
                            <p class="film-dataUscita">Release date: ${movie.getReleaseDate()}</p>
                            <p class="film-durata">Running Time: ${movie.getRunningTime()} min</p>
                            <p class="film-prezzo">Score: ${movie.getScore()}⭐</p>
                            <p class="film-user">Added by user: ${movie.getUser_id()}</p>
                            <a href="#" class="film-submit">Prenota a ${movie.getPrice()}€</a>
                        </div>
                    </div>
                </c:forEach>
            </c:if> 
        </main>
        <jsp:include page="templates/infosecondarie.jsp"/>
        </div>
        <jsp:include page="templates/footer.jsp"/>
    </c:if>
</body>
</html>
