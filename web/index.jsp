<%-- 
    Document   : index
    Created on : Sep 25, 2019, 10:59:59 AM
    Author     : Zafar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp" %>
<%@include file="Footer.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="StyleCss/Style.css"> <!-- Link connection to StyleCss folder path Style.css -->
        <title>Login Page</title>
    </head>
    <body style="background-color:#B8860B">
        <!-- Set form for user name and password and aligned from top using Style.css -->
        <!-- After login successfully it will redirect to WellCome.jsp page -->
        <form action="Login" method="get" class="EntryForm">
            User Name:<input type="text" name="UserName"/><br>
            Password:<input type="password" name="Password"/><br>
            <!-- Two Input buttons first one for submission and second one to clear the fields -->
            <input type="submit" value="submit"/>
            <input type="reset" value="Clear"/>
        </form>
        <!-- Set the error messages to red color using Style.css -->
        <p id="Fields_Error"> ${NoEntryError}</p>
        <p id="User_Error"> ${InvalidUser}</p

    </body>
</html>
