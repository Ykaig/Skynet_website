<%-- 
    Document   : errore
    Created on : 8 ago 2022, 17:14:28
    Author     : Simon
--%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <jsp:include page="templates/head_common.jsp"/>
    <title>Skynet Cinema</title>
    <meta http-equiv="refresh" content="5; url='index.jsp'" />
    <meta name="description" content="Pagina di errore di Skynet Cinema">
    <meta name="keywords" content="skynet,cinema,errore,error">
</head>
<body>
    <jsp:include page="templates/header.jsp"/>
    <jsp:include page="templates/navbar.jsp"/>
    <div class="layout-grid">        
        <main>
            <div class="error-box"> 
                <img src="img/icone/errore.svg" width="25" height="25" alt="Error page"/>
                <h3>Errore: ${errormsg}</h3>
            </div>         
        </main>
        <section class="layout-secondario"></section>
    </div>
    <jsp:include page="templates/footer.jsp"/>   
</body>
</html>
