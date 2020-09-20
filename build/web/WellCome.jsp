
<%@page import="java.sql.Date"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp" %>
<%@include file="Footer.jsp" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" type="text/css" href="StyleCss/Style.css"> <!-- Link connection to StyleCss folder path Style.css -->
        <META HTTP-EQUIV="Refresh" CONTENT="1800"><!--If a user session is inactive for 1800 seconds which is equivalent to 30 minutes. This Page will refresh in 30 minutes same time as in XML session timeout.
                                                 The User must login again to access this page.-->
        <style>
            .AccessDate{margin-top:100px}
            .Section1{margin-top:30px}
            .Section2{margin-top:40px}
        </style>

        <title> Wellcome Page!</title>

    </head>
    <body style="background-color:#B8860B">

        <%
            // To accsess this page user must login with valid User Name and Password 
            // Check session if the data was entered. 
            if (session.getAttribute("WaiterValidate") == null) {  // If the User Name doesn't match in that case it will call Login page.
                response.sendRedirect("index.jsp"); // If a valid User Name entered it will proceed to WellCome Page.
            }
            //We must Set header To Prevent the back button after Logout it should clear all the cache Data by using the method below
            // This must be outside the If statement.
            response.setHeader("Cache-Control", "no-cache, no-store, must revalidate");
        %>
        <!-- Last Login at this session Inactive timeout session in 2 minutes which is 120 Seconds. -->
        <p class="AccessDate"> You last accessed on: <%= new Date(session.getLastAccessedTime())%> <br />
            The maximum inactive interval is: <%= session.getMaxInactiveInterval()%> seconds</p>
        <h1 class="Section1">WellCome! ${WaiterValidate}</h1> <!-- Name Label is the session name in Login Servlet to display the User Name as Waiter Validate
        <!-- Hyper links for different classes used div class name as section1 and Section2 so we can move it from top by using style. -->
        <p class="Section2"><a href="BillCalculator.jsp">Restaurant Bill Calculator</a><br>
            <a href="CustomerReservations.jsp">Restaurant Reservations </a><br>
            <a href="Menu">Menu</a></p><br></br>

</html>
