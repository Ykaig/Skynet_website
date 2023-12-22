<%-- 
    Document   : areaPersonale
    Created on : 9 ago 2022, 19:04:26
    Author     : Simon
--%>


<%@taglib prefix="jstl" uri="http://java.sun.com/jsp/jstl/core"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="it">
    <head>
        <jsp:include page="templates/head_common.jsp"/>
        <title>Skynet Cinema - Personal Area</title>
        <meta name="description" content="Area Personale degli utenti di Skynet Cinema">
        <meta name="keywords" content="skynet,cinema,area,personale,login">
    </head>
    
    <body>
        <jsp:include page="templates/header.jsp"/>
        <jsp:include page="templates/navbar_login.jsp"/>
            
        <div class="layout-grid">
        <main>  
            <h1>Area Personale di ${name} ${surname}</h1>
            <div id="personal-area">
                <img id="user-photo" src="${photo}" alt="Foto di ${name} ${surname}">
                <div id="user-info">
                    <span> Nome: ${name}<br>
                        Cognome: ${surname}<br>
                        Indirizzo Email: ${email}<br>
                        Città: ${city}<br> </span>
                </div>
                <form action="logout" method="post" accept-charset="utf-8">
                    <input type="submit" id="logout-button" value="Logout">
                </form>   
            </div>                
        </main>
                    
            <jsp:include page="templates/infosecondarie.jsp"/>
        </div>
    <jsp:include page="templates/footer.jsp"/>
    </body>

</html>
