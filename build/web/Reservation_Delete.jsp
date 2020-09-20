<%-- 
    Document   : Reservation_Delete
    Created on : Aug 30, 2019, 2:11:15 PM
    Author     : Zafar
--%>

<%@page import="java.sql.SQLException"%>
<%@page import="WebApp_Restaurant.DBConnection"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
             String table = request.getParameter("Table");

        Connection connection = null;
        Statement statement = null;

        try {
            connection = DBConnection.getConnection();
            String sql = "delete from reservations where TableNumber = '" + table + "'";
            statement = connection.createStatement();
            statement.executeUpdate(sql);
         
response.sendRedirect("DisplayAllReservations.jsp");
            

        } catch (SQLException ex) {
            out.println("There is problem in deleting this reservation");

        }
    
            %>
    </body>
</html>
