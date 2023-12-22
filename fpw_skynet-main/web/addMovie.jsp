<%-- 
    Document   : aggiungiFilm
    Created on : 8 ago 2022, 18:10:02
    Author     : Simon
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <jsp:include page="templates/head_common.jsp"/>
        <title>Skynet Cinema - Add movie</title>
        <meta name="description" content="Aggiungi un film come proposta alla programmazione di Skynet Cinema">
        <meta name="keywords" content="skynet,cinema,aggiungi,film,movie,add">
    </head>
    <body>
        
        <!-- User not logged -->
        <c:if test="${empty user}">
            <c:redirect url="login.jsp"/>
        </c:if>
    
        <!-- User logged -->
        <c:if test="${not empty user}">
            <c:set var="page" value="addMovie" scope="application" />

            <jsp:include page="templates/header.jsp"/>
            <jsp:include page="templates/navbar_addmovie.jsp"/>

            <div class="layout-grid">
                <main>
                    <div class="form-box">                
                        <h1>Aggiungi una proposta</h1>
                        <form action="newMovie" method="POST" accept-charset="utf-8" enctype="multipart/form-data">
                            <label for="addmovie-title">Titolo: </label>
                            <div class="form-textbox">
                                <input id="addmovie-title" type="text" name="title">
                            </div>
                            
                            <label for="addmovie-desc">Descrizione: </label>
                            <div class="form-textbox">
                                <textarea id="addmovie-desc" name="description"></textarea>
                            </div>
                            
                            <label for="addmovie-photo">Locandina: </label>
                            <input id="addmovie-photo" name="photo" type="file" accept="image/*">
                            
                            <label for="addmovie-date">Data di uscita: </label>
                            <input id="addmovie-date" type="date" name="releaseDate">
                            
                            <label for="addmovie-runningTime">Durata: </label>
                            <input id="addmovie-runningTime" type="number" name="runningTime" placeholder="150 (example)" min="0"step="1">
                            
                            <label for="addmovie-price">Prezzo:</label>
                            <input id="addmovie-price" type="number" name="price" placeholder="10.90 (example)" min="0" step=".01">
                            
                            <label for="addmovie-score">Punteggio (0-5):</label>
                            <input id="addmovie-score" type="number" name="score" placeholder="4.8 (example)" min="0" min="5.0" step=".1">
                            
                            <input type="hidden" name="user_id" value="${user}">

                            <input type="submit" value="Add movie">
                            <p id="clientside-error"></p>
                        </form>
                    </div>
                </main>
                <section class="layout-secondario">
                    <jsp:include page="templates/infosecondarie.jsp"/>
                </section>
            </div>
            <jsp:include page="templates/footer.jsp"/>
        </c:if>
        <script type="text/javascript" src="./js/code.js"></script>
    </body>
</html>