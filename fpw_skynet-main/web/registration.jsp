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
    <title>Skynet Cinema - Registration</title>
    <meta name="description" content="Registra un nuovo utente su Skynet Cinema">
    <meta name="keywords" content="skynet,cinema,registrazione,registration,new,user">
</head>
<body>
    <jsp:include page="templates/header.jsp"/>
    <jsp:include page="templates/navbar.jsp"/>
    <div class="layout-grid">
        <main class="login-main">
            <div class="form-box">
                <h1><img src="./img/icone/user-black.svg" width="40">Nuovo Utente</h1>
                <form class="register-form" action="user" method="post" accept-charset="utf-8">
                        <label for="reg-username">Username:</label>
                        <div class="form-textbox">
                            <input id='reg-username' type="text" name="username" >
                        </div>
                        <label for="reg-password">Password:</label>
                        <div class="form-textbox">
                            <input id="reg-password" type="password" name="password">
                        </div>
                        <label for="reg-name">Nome:</label>
                        <div class="form-textbox">
                            <input id="reg-name" type="text" name="name">
                        </div>
                        <label for="reg-surname">Cognome:</label>
                        <div class="form-textbox">
                            <input id="reg-surname" type="text" name="surname" >
                        </div>
                        <label for="reg-email">Email:</label>
                        <div class="form-textbox">
                            <input id="reg-email" type="email" name="email">
                        </div>
                        <label for="reg-city">Città:</label>
                        <div class="form-textbox">
                            <input id="reg-city" type="text" name="city"> 
                        </div>
                        <input id="reg-photo" type="hidden" value="img/profile_pics/placeholder.jpg" name="photo">
                    <input type="submit" value="Sign me up">
                    <p id="clientside-error"></p>
                </form>
                <a class="reg-link" href="login.jsp">Sei già registrato? Log in</a>
            </div>
        </main>
        <section class="layout-secondario">
            <jsp:include page="templates/infosecondarie.jsp"/>
        </section>
    </div>
    <jsp:include page="templates/footer.jsp"/>
    <script src="./js/code.js"></script>
</body>
</html>
