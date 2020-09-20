<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="WebApp_Restaurant.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@include file="Header.jsp" %>
<%@include file="Footer.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- The Title appears Update data from reservations on top of the page after Header -->
        <!--Body background color to orange -->
        <!--Form set margin to bottom at 150px-->
        <style>
            body{background: #B8860B;}

            .Title{ border-radius: 25px;margin-left: 250px;margin-right: 250px;margin-top:115px;
                    background: #73AD21;background-color:cadetblue; 
                    text-align: center;padding: 5px;
                    font-style:italic;
                    color:brown}
            form{margin-bottom:150px}
        </style>
        <title>Update Reservations</title>

    </head>
    <body/>

    <h1 class="Title">Update data from Reservations.</h1>
     <%
            // To accsess this page user must login with valid User Name and Password 
            // If the Waiter Validate is null response send redirect to login page which is index.jsp
            if (session.getAttribute("WaiterValidate") == null) {  // If it doesn't match the name in that case call Login page.
                response.sendRedirect("index.jsp"); // If a valid User Name entered proceed to WellCome Page.
            }
            //We must Set response header To Prevent the back button after Logout it should clear all the cache Data by using the method below
            // This must be outside the If statement.
            response.setHeader("Cache-Control", "no-cache, no-store, must revalidate");
        %>
    <%
        //Any Table number is seleted must be visible in the text Field before updating it.
        //Get all parameters values from user input.
        String firstname = request.getParameter("FirstName");
        String lastname = request.getParameter("LastName");
        String address = request.getParameter("Address");
        String telephone = request.getParameter("Telephone");
        String date = request.getParameter("Date");
        String numberinparty = request.getParameter("NumberInParty");
        String table = request.getParameter("Table");
        Connection connection = null;
        ResultSet resultSet = null;
        Statement statement = null;

        try {
            // Connection from DBConnection Class 
            connection = DBConnection.getConnection();
            statement = connection.createStatement();
            // Query for Table selection
            String sql = "select * from reservations where TableNumber = " + table + "";

            resultSet = statement.executeQuery(sql);
            // While loop to fetch data in table from database
            while (resultSet.next()) {

    %>
    <!-- Input from for Editing any reservation data.-->

    <form action="Reservation_Update" method="get">

        First name:<br>
        <input type="text" name="FirstName" value="<%=resultSet.getString(1)%>">
        <br>
        Last name:<br>
        <input type="text" name="LastName" value="<%=resultSet.getString(2)%>">
        <br>
        Address:<br>
        <input type="text" name="Address" value="<%=resultSet.getString(3)%>">
        <br>
        Telephone:<br>
        <input type="text" name="Telephone" value="<%=resultSet.getString(4)%>">
        <br>
        Date:<br>
        <input type="text" name="Date" value="<%=resultSet.getString(5)%>">
        <br>
        Number In Party:<br>
        <input type="text" name="NumberInParty" value="<%=resultSet.getInt(6)%>">
        <br>
        <!-- Used paragraph for a Table text and a style to set the color as Red and background color to white.-->
        <p style="color: red;background-color: white;width:210px">Table Number: <%=resultSet.getInt(7)%> is selected</p><br>
        <input type="text" name="Table" value="<%=resultSet.getInt(7)%>">
        <input type="submit" value="submit">
    </form>
    <%
            }

        } catch (Exception e) {
            e.printStackTrace();
        }// Close try catch next we create a controller jsp class to proceed the update action.
        statement.close();
        resultSet.close();
        connection.close();
    %>
</body>
</html>
