<%-- 
    Document   : index
    Created on : 8 ago 2022, 18:15:31
    Author     : Simon
--%>

<!-- Prova github -->

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
    <head>
        <jsp:include page="templates/head_common.jsp"/>
        <title>Skynet Cinema - Home</title>
        <meta name="description" content="Skynet Cinema, il migliore cinema di Roma ora online">
        <meta name="keywords" content="skynet,cinema,film,movies,biglietti">
    </head>

    <body>
        <jsp:include page="templates/header.jsp"/>
        <jsp:include page="templates/navbar.jsp"/>
        <div class="layout-grid">
            <main>
                <h1>Welcome to Skynet Cinema!</h1>
                <p>Il migliore cinema di Roma ora disponibile anche online!</p>
                <br>
                <div class="card-container">
                    <div class="card">
                        <img src="./img/icone/film-mono.svg">
                        <h2>Movies</h2>
                        <p>Siamo sempre aggiornati sulle migliori uscite dell'anno, e decidiamo la programmazione grazie al contributo del nostro pubblico!</p>
                    </div>
                    <div class="card">
                        <img src="./img/icone/seat-mono.svg">
                        <h2>Comfort</h2>
                        <p>Le nostre poltrone reclinabili comfortevoli ti faranno sentire comodo come se fossi a casa tua. Cerca però di non addormentarti durante il film!</p>
                    </div>
                    <div class="card">
                        <img src="./img/icone/noleggio-mono.svg">
                        <h2>Services</h2>
                        <p>Il nostro staff professionale è sempre a tua disposizione per garantirti la migliore esperienza cinematografica mai vista prima!</p>
                    </div>
                </div>
                <br>
                <h2>Find us:</h2>
                <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d190029.0177339561!2d12.39591350966426!3d41.90998597323602!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x132f6196f9928ebb%3A0xb90f770693656e38!2sRoma%20RM!5e0!3m2!1sit!2sit!4v1659196801810!5m2!1sit!2sit" style="border:0;padding:0;margin:0;width: 100%;" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            </main>
            <jsp:include page="templates/infosecondarie.jsp"/>
        </div>
        <jsp:include page="templates/footer.jsp"/>
    </body>

</html>
