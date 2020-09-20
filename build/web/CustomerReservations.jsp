<%@page import="java.sql.Statement"%>
<%@page import="java.sql.SQLException"%>
<%@page import="WebApp_Restaurant.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<%@include file="Footer.jsp"%>
<!DOCTYPE html>
<html>
    <head>

        <title>Customer Reservations</title>
        <script>
            //In ReservationForm if the FirstName and LastName feilds are empty it will pop up the alert message on trigger.
            function CheckForFields() {//Javascript function for text feilds validation.
                if (document.getElementById('FirstName').value == "" || document.getElementById('LastName').value == "") {  // If the first and last Name is blank. 
                    alert("Fields are empty");    //If fields are empty It should append this message.
                    document.getElementById('FirstName').style.borderColor = "red";
                    document.getElementById('LastName').style.borderColor = "red"; // TextField set to red.
                    return false;
                }
            }
        </script>
    </head>
    <!--In the body Tag we set the BackGround Color and aligned them to center using style -->
    <body style="background-color:#B8860B;text-align : center;margin-bottom:150px">
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
        <!-- Set form for input data entry action set at the same page on trigger the new entry single line data will display. -->
        <!-- Form inputs fields set to different sizes  -->
        <!-- Java Script function as Check For Fields is used for fields validation -->

        <form class="EntryForm" name="ReservationForm" action="CustomerReservations.jsp" onsubmit="return CheckForFields();">
            First Name:<br>
            <input type="text" size="40" name="FirstName" id="FirstName"/><br>
            Last Name:<br>
            <input type="text" size="40" name="LastName" id="LastName"/><br>  
            Address:<br>
            <input type="text" size="40" name="Address" required="true"/><br> <!--All Text Field must be filled required set to true-->
            Telephone:<br>
            <input type="text" size="35" name="Telephone" required="true"/><br>
            Date:<br>
            <input type="date" size="30" name="Date" required="true"><br><!-- Note: type="Date" is not supported in Safari or Internet Explorer 11 and earlier versions-->
            Number in party:<br>
            <input type="text" size="25" name="NumberInParty" required="true"/><br>
            Table:<select name="Table">      <!--Select Option is used for only 10 tables available for the reservation -->
                <option value='1'>Table 1</option>
                <option value='2'>Table 2</option>
                <option value='3'>Table 3</option>
                <option value='4'>Table 4</option>
                <option value='5'>Table 5</option>
                <option value='6'>Table 6</option> 
                <option value='7'>Table 7</option>  
                <option value='8'>Table 8</option>  
                <option value='9'>Table 9</option> 
                <option value='10'>Table 10</option>  
            </select><br>
            <input type="submit" value="Save"/>
            <input type="reset" value="Clear"/>
        </form> 

        <% // Declare all the variables and get request all variables names from Customer Reservation.jsp which is at this class.
            String firstname = request.getParameter("FirstName");
            String lastname = request.getParameter("LastName");
            String address = request.getParameter("Address");
            String telephone = request.getParameter("Telephone");
            String date = request.getParameter("Date");
            String numberinparty = request.getParameter("NumberInParty");
            String table = request.getParameter("Table");
            //Import Connection to connect to our DataBase 
            //Statement is to set our sql query and ResultSet to count all rows from the database. 
            Statement statement = null;
            ResultSet resultSet = null;
            Connection connection = null;
            try {
                statement = DBConnection.getConnection().createStatement();
                // Select count query is used to count number of rows in database.
                String sql1 = "SELECT COUNT(*) FROM reservations where TableNumber = '" + table + "';";
                resultSet = statement.executeQuery(sql1);
                resultSet.next();

                String CountRow = resultSet.getString(1);

                if (CountRow.equals("0")) {   // If the next row in the Database is zero or empty then Insert data
                    statement.executeUpdate("insert into reservations(Firstname,LastName,Address,Telephone,Date,NumberInParty,TableNumber)"
                            + "values('" + firstname + "','" + lastname + "','" + address + "','" + telephone + "','" + date + "','" + numberinparty + "','" + table + "')");

                    response.sendRedirect("DisplayNewReservation.jsp");

                } else {          // If the next row in the Database is eqauls to zero or data already exists.
                    out.println("<p style= 'color:red'>Table is already booked</p>");
                    out.println("<p style='text-align:center;'><a href='DisplayAllReservations.jsp'>Show Previous Reservations</a></p>");
                }

            } catch (SQLException ex) {
                System.out.print(ex);
                ex.printStackTrace();
            } finally { // In finally if ResultSet,Connection and Statement is not null then close all.   
                try {
                    resultSet.close();
                } catch (Exception e) {
                    /* ignored */ }
                try {
                    statement.close();
                } catch (Exception e) {
                    /* ignored */ }
                try {
                    connection.close();
                } catch (Exception e) {
                }
            }


        %>