<%-- 
    Document   : movieJSON
    Created on : 29 gen 2023, 20:17:14
    Author     : super
--%>

<%@page contentType="application/json" pageEncoding="UTF-8"%>
<%@taglib prefix="json" uri="http://www.atg.com/taglibs/json"%>
<json:object>
    <json:property name="idMovie" value="${movie.getIdMovie()}"/>
    <json:property name="title" value="${movie.getTitle()}"/>
    <json:property name="description" value="${movie.getDescription()}"/>
    <json:property name="photo" value="${movie.getPhoto()}"/>    
    <json:property name="releaseDate" value="${movie.getReleaseDate()}"/>    
    <json:property name="runningTime" value="${movie.getRunningTime()}"/>    
    <json:property name="price" value="${movie.getPrice()}"/>    
    <json:property name="score" value="${movie.getScore()}"/> 
    <json:property name="user_id" value="${movie.getUser_id()}"/>
</json:object>
