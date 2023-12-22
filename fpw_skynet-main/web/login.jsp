 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%-- 
    Document   : login
    Created on : 8 ago 2022, 18:19:06
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <jsp:include page="templates/head_common.jsp"/>
    <title>Skynet Cinema - Login</title>
    <meta name="description" content="Esegui il login su Skynet Cinema">
    <meta name="keywords" content="skynet,cinema,login">
</head>

<body>
    
    <!-- User Logged -->
    <c:if test="${not empty user}">
        <c:redirect url="personalArea.jsp"/>
    </c:if>
    
    <!-- User not logged -->
    <c:if test="${empty user}">  
    
    <c:set var="page" value="login" scope="application" />

    <jsp:include page="templates/header.jsp"/>
    <jsp:include page="templates/navbar_login.jsp"/>
    
    <div class="layout-grid">
        <main>
            <div class="form-box">
                <h1><img src="./img/icone/user-black.svg" width="40">Login</h1>
                <form action="login" method="post" accept-charset="utf-8">
                    <label for="login-username">Username:</label>
                    <div class="form-textbox">
                        <input id="login-username" type="text" name="username">
                    </div>
                    <label for="login-password">Password:</label>
                    <div class="form-textbox">
                        <input id="login-password" type="password" name="password">
                    </div>
                    <input type="submit" value="Login">
                </form>
                <br>
                    <a class="reg-link" href="registration.jsp">Non sei registrato? Iscriviti ora</a>
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
