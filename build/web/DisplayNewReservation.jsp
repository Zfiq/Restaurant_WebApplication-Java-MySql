<%@page import="WebApp_Restaurant.DBConnection"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <jsp:include page="CustomerReservations.jsp"/>
        <%
               // To accsess this page user must login with valid User Name and Password 
            // Check session if the data was entered. 
            if (session.getAttribute("WaiterValidate") == null) {  // If the User Name doesn't match in that case it will call Login page.
                response.sendRedirect("index.jsp"); // If a valid User Name entered it will proceed to WellCome Page.
            }
            //We must Set header To Prevent the back button after Logout it should clear all the cache Data by using the method below
            // This must be outside the If statement.
            response.setHeader("Cache-Control", "no-cache, no-store, must revalidate");
            
            Connection connection = null;
            ResultSet resultSet = null;
            PreparedStatement preparedStatement = null;

            connection = DBConnection.getConnection(); // Get Connection DBConnection class and getConnection.

            try {
                //Select all data from reservations database using PreparedStatement.
                preparedStatement = connection.prepareStatement("SELECT * FROM reservations");

                resultSet = preparedStatement.executeQuery();
                // use of html table to display the new reservations with Edit and delete hyperlink at end.

                out.println("<table border='1'cellpadding='10'align='center'>"); //Set table border,cell padding to 10px and align to center
                // Set the table rows with headings
                out.println("<tr><td >First Name</td><td>Last Name</td><td>Address</td><td>Telephone</td><td>Date</td><td>Number In Party</td><td>Table Number</td></tr>");
                // Result Set last is used to show the last data entry.
                resultSet.last();
                out.println("<tr><td>" + resultSet.getString(1) + "</td><td>"
                        + resultSet.getString(2) + "</td><td bgcolor='gray'>" + resultSet.getString(3)
                        + "</td><td class='Price-Text'>" + resultSet.getString(4) + "</td><td>" + resultSet.getString(5)
                        + "</td><td>" + resultSet.getInt(6) + "</td><td>" + resultSet.getInt(7) + "</td>");
        %>
        <!-- hyperlinked to edit the new entry direct to UpdateReservations.jsp -->
    <td><a href="Input_UpdateReservations.jsp?Table=<%=resultSet.getInt(7)%>">Edit</a></td> 
    <td><a href="Reservation_Delete.jsp?Table=<%=resultSet.getInt(7)%>">Cancel</a></td>
</table>
<%
        // used <p> to align the text to center and An anchor tag to hypertext link to another page which is DisplayAllReservations.jsp.
        out.println("<p style='text-align:center;'><a href='DisplayAllReservations.jsp'>Show all Booked Reservations</a></p>");
    } catch (SQLException ex) {
        System.out.print(ex);
        ex.printStackTrace();

    } finally { // In finally if ResultSet,Connection and Statement is not null then close all.   
        try {
            resultSet.close();
        } catch (Exception e) {
            /* ignored */ }
        try {
            preparedStatement.close();
        } catch (Exception e) {
            /* ignored */ }
        try {
            connection.close();
        } catch (Exception e) {
        }
    }

%>
</body>
</html>
