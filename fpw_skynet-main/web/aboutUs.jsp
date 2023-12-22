<%-- 
    Document   : aboutus
    Created on : 8 ago 2022, 18:06:02
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="it">
<head>
    <jsp:include page="templates/head_common.jsp"/>
    <title>Skynet - About Us</title>
    <meta name="description" content="Qui vengono elencati i membri fondatori di Skynet Cinema">
    <meta name="keywords" content="skynet,cinema,film,movie,founders,creators,fondatori">
</head>
<body>
    <jsp:include page="templates/header.jsp"/>
    <jsp:include page="templates/navbar_aboutus.jsp"/>
    <div class="layout-grid">
        <main>
            <h1>Scopri chi c'è dietro le quinte di Skynet Cinema!</h1>
            <div class="fondatore-container">
                <img src="img/profile_pics/pic02.jpg" alt="Foto di Gabriele">
                <div>
                    <h1 class="fondatore-nome">Gabriele Musio</h1>
                    <p class="fondatore-cit"><em>"Il voto è innocuo"</em></p>
                    <p class="fondatore-desc">Lorem ipsum dolor sit amet consectetur adipiscing elit, cum id condimentum luctus odio facilisi, inceptos leo egestas sapien morbi quis. Sagittis tincidunt hendrerit nascetur at eleifend ullamcorper purus dis cras, ornare habitasse bibendum praesent ut mus habitant netus, fames metus magnis placerat blandit rhoncus porta per. Per sociosqu montes dictum praesent enim ac, platea justo aptent blandit diam metus quam, ultrices mollis aliquam tempus magna.</p>
                </div>
            </div>
            <div class="fondatore-container">
                <img src="img/profile_pics/pic01.jpg" alt="Foto di Giacomo">
                <div>
                    <h1 class="fondatore-nome">Giacomo Lecis</h1>
                    <p class="fondatore-cit"><em>"Il voto è innocuo"</em></p>
                    <p class="fondatore-desc">Lorem ipsum dolor sit amet consectetur adipiscing elit, cum id condimentum luctus odio facilisi, inceptos leo egestas sapien morbi quis. Sagittis tincidunt hendrerit nascetur at eleifend ullamcorper purus dis cras, ornare habitasse bibendum praesent ut mus habitant netus, fames metus magnis placerat blandit rhoncus porta per. Per sociosqu montes dictum praesent enim ac, platea justo aptent blandit diam metus quam, ultrices mollis aliquam tempus magna.</p>
                </div>
            </div>
            <div class="fondatore-container">
                <img src="img/profile_pics/pic03.jpg" alt="Foto di Simone">
                <div>
                    <h1 class="fondatore-nome">Simone Massenti</h1>
                    <p class="fondatore-cit"><em>"Il voto è innocuo"</em></p>
                    <p class="fondatore-desc">Lorem ipsum dolor sit amet consectetur adipiscing elit, cum id condimentum luctus odio facilisi, inceptos leo egestas sapien morbi quis. Sagittis tincidunt hendrerit nascetur at eleifend ullamcorper purus dis cras, ornare habitasse bibendum praesent ut mus habitant netus, fames metus magnis placerat blandit rhoncus porta per. Per sociosqu montes dictum praesent enim ac, platea justo aptent blandit diam metus quam, ultrices mollis aliquam tempus magna.</p>
                </div>
            </div>
        </main>
        <jsp:include page="templates/infosecondarie.jsp"/>
    </div>
    <jsp:include page="templates/footer.jsp"/>
</body>
</html>
