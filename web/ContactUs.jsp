<%-- 
    Document   : ContactUs
    Created on : Sep 3, 2019, 11:35:33 PM
    Author     : Zafar
--%>
<!--This Class contain contact details and location as a sample and we have used a simple table to align
the material with headings with help of inner css style.-->
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp" %>
<%@include file="Footer.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Contact Page</title>
        <style>
         
            .ContactTable{margin-top:100px;margin-left: 300px}
            .ContactUs{color:red;font-size:30px;padding-left: 30px}
            .Address{color:blue}
            .Email{color:blue}
            .Phone{color:blue}
            .Map{text-align: center;padding:50px}
            img{margin-bottom:300px}
            body{background-color: gray}
        </style>
    </head>
    <body style="background-color:#B8860B">
        <table class="ContactTable">
            <tr><th class="ContactUs">Contact Us.</th>
            <tr><th class="Address">Address.</th><td>88 King North Street Dublin.</td>
            <tr><th class="Email">E-Mail.</th><td>YourRes_Enquiry@gmail.com</td>
            <tr><th class="Phone">Phone.</th><td>(01)3321763</td></tr>
</table>
        <div class="Map">
        <h3>Map Location.</h3>
        <img src="StyleCss/Image/DummyLocation.jpg" style="width:500px;height:300px;">
        </div>
    </body>
</html>
