<%-- 
    Document   : success.jsp
    Created on : 22 nov 2022, 09:52:59
    Author     : Giacomo
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <jsp:include page="templates/head_common.jsp"/>
    <title>Skynet Cinema</title>
    <meta http-equiv="refresh" content="4; url='./login.jsp'" />
</head>
<body>
    <jsp:include page="templates/header.jsp"/>
    <jsp:include page="templates/navbar.jsp"/>
    <div class="layout-grid">
        <main>
            <div class="success-box"> 
                <img src="img/icone/form_done.svg" width="25" height="25" alt="simbolo di successo"/>
                <h3>${msg}</h3>
                <p> Attendere la redirezione...</p>
            </div>         
        </main>
        <section class="layout-secondario"></section>
    </div>
    <jsp:include page="templates/footer.jsp"/>   
</body>
</html>
