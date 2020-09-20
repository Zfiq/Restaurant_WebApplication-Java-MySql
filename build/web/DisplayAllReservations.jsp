<%@page import="WebApp_Restaurant.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.SQLException"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<%@include file="Footer.jsp"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        
        <title>Show All Reservations</title>
        <!-- Css is Used to position Table to the top of the page and set background color to cyan-->
        <!-- Css is Used to position Updated message as Update Message to the top of the page and set color to green-->
        <style>
            .Table{top:200px;background-color: cyan;margin-bottom: 200px;}
            .UpdatedMessage{position: absolute;top: 100px; margin-left: 400px; color:green;}
            form{margin-top: 100px}
        </style>    
    </head>
    <body style="background-color:#B8860B">
        <%
            // To accsess this page user must login with valid User Name and Password 
            // If the Waiter Validate is null response send redirect to login page which is index.jsp
            if (session.getAttribute("WaiterValidate") == null) {  // If it doesn't match the name in that case call Login page.
                response.sendRedirect("index.jsp"); // If a valid User Name entered proceed to WellCome Page.
            }
            //Clear Cache after logout to prevent the back button.
            response.setHeader("Cache-Control", "no-cache, no-store, must revalidate");
        %>
        <%
// Get Table parameter value from input form.
            String table = request.getParameter("Table");
        %>
        <!--User Input form to access the reservation data by table number-->
        <form style="text-align:right;" action="Input_UpdateReservations.jsp" method="get">
            Table:<input type="text" size="5" name="Table">     
            <br>
            <input type="submit" value="Edit"/>
       

        <%            Connection connection = null;
            ResultSet resultSet = null;
            PreparedStatement preparedStatement = null;
            connection = DBConnection.getConnection(); // Get Connection DBConnection class and getConnection method

            try {
                preparedStatement = connection.prepareStatement("SELECT * FROM reservations");
                resultSet = preparedStatement.executeQuery();
                // use of html table to display all the reservations.
                out.println("<table border='1'cellpadding='10' class='Table'>"); //Set table border,cell padding to 10px and align to center
// Set the table rows with headings
                out.println("<tr><td >First Name</td><td>Last Name</td><td>Address</td><td>Telephone</td><td>Date</td><td>Number In Party</td><td>Table Number</td></tr>");
                while (resultSet.next()) {
                    // While loop to fetch data in table from database
        %>
       
    <tr> <!-- HTML Table to display all data from database. -->
        <td><%=resultSet.getString(1)%></td>
        <td><%=resultSet.getString(2)%></td>
        <td><%=resultSet.getString(3)%></td>
        <td><%=resultSet.getString(4)%></td>
        <td><%=resultSet.getString(5)%></td>
        <td><%=resultSet.getInt(6)%></td>
        <td><%=resultSet.getInt(7)%></td>
        <td><a href="Input_UpdateReservations.jsp?Table=<%=resultSet.getInt(7)%>">Update</a></td>
        <td><a href="Reservation_Delete.jsp?Table=<%=resultSet.getInt(7)%>">Delete</a><br>
</tr>
         </form> 
          <p class="UpdatedMessage"> ${Updated}</p>  <!--Set Attribute from Reservation_Update as Updated with text.-->
<%
        }
    } catch (SQLException ex) {
        System.out.print(ex);
        ex.printStackTrace();
    }
%>
</body>
</html>
