<%-- 
    Document   : navbar
    Created on : 8 ago 2022, 17:53:22
    Author     : Simon
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!-- Barra di navigazione -->
<nav id="navbar">
    <ul>
        <li class="nav-element">
            <a href="availableMovies.jsp">Migliori Film
                <img class="navbar-icons" src="./img/icone/navbar_shopping_cart.svg" alt="Available movies">
            </a>
        </li>
        
        <li class="nav-element">
            <a href="addMovie.jsp">Aggiungi Film
                <img class="navbar-icons" src="./img/icone/navbar_post_add.svg" alt="Add movie">
            </a>
        </li>
            
        <li class="nav-element selected">
            <a href="aboutUs.jsp">About us
                <img class="navbar-icons" src="./img/icone/navbar_groups.svg" alt="About us">
            </a>
        </li>
        
        <li class="nav-element" id="nav-login">
            
            <!-- User Logged -->
            <c:if test="${not empty user}">
                <a href="login.jsp">Area Personale
                <img class="navbar-icons" src="./img/icone/navbar_login.svg" alt="Personal Area">
            </a>
            </c:if>
        
            <!-- User not logged -->
            <c:if test="${empty user}">
                <a href="login.jsp">Login
                <img class="navbar-icons" src="./img/icone/navbar_login.svg" alt="Login">
            </a>
            </c:if>
            
        </li>
    </ul>
</nav>
