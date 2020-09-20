<%-- 
    Document   : Menu_TotalCost
    Created on : Sep 26, 2019, 11:52:08 PM
    Author     : Zafar
--%>

<%@page import="WebApp_Restaurant.Menu_Model"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<%@include file="Footer.jsp"%>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>

    </head>
    <body style="background: #B8860B">
        <%
            // Get all Attributes where we set Attributes from MenuController Class
            Menu_Model Beverage = (Menu_Model) request.getAttribute("Beverage");
            Menu_Model Appetizer = (Menu_Model) request.getAttribute("Appetizer");
            Menu_Model MainCourse = (Menu_Model) request.getAttribute("MainCourse");
            Menu_Model Dessert = (Menu_Model) request.getAttribute("Dessert");
        %>

        <%   // We declare variables as double to add Tax and to display the total cost after tax added.
            double taxRate1 = 0.05;
            double taxRate2 = 0.10;
            double taxRate3 = 0.15;
            double totalTax = 0;
            double totalBill = 0;

            // if Beverage price is greater than 2 then taxRate1 0.5 will multiply with the Beverage Price.
            if (Beverage.getPrice() > 2) {
                // We Asigned totalTax to taxRate1 plus Beverage Price in order to get the total cost.
                // We Applied the same methods to other Categories Prices with the conditional Statements.
                // If any item exceeds or within the set parameter or any Item is selected it will add taxRate with the price.
                totalTax = taxRate1 * Beverage.getPrice();

            }
            if (Appetizer.getPrice() >= 6) {
                totalTax = taxRate2 * Appetizer.getPrice();
            }
            if (MainCourse.getPrice() >= 12) {
                totalTax = taxRate3 * MainCourse.getPrice();
            }
            if (Dessert.getPrice() >= 4) {
                totalTax = taxRate1 *= Dessert.getPrice();
            }
            // Assign totalTax to all taxRates and than assigned totalBill to all tax plus price to print the total cost.

            totalTax = taxRate1 + taxRate2 + taxRate3;

            totalBill = Beverage.getPrice() + Appetizer.getPrice() + MainCourse.getPrice() + Dessert.getPrice() + totalTax;
        %>   
        <!-- This HTML Table is to Display all selected items values with separate Categories with inner css is used.-->
        <table border="1"  style="margin-left: 400px;margin-top: 130px;border: solid;width: 600px;height:200px">
            <tr><th>Category</th><th>Item Name</th><th>Price </th><tr>
            <tr>  
                <!-- Table row for Beverage -->
                <td> <%=Beverage.getCategory()%></td>
                <td><%=Beverage.getName()%></td>
                <td><%=Beverage.getPrice()%></td>
            </tr>
            <tr>  
                <!-- Table row for Appetizer -->
                <td> <%=Appetizer.getCategory()%></td>
                <td><%=Appetizer.getName()%></td>
                <td><%=Appetizer.getPrice()%></td>
            </tr>
            <!-- Table row for Main Course -->
            <tr>  
                <td> <%=MainCourse.getCategory()%></td>
                <td><%=MainCourse.getName()%></td>
                <td><%=MainCourse.getPrice()%></td>
            </tr>
            <!-- Table row for Dessert -->
            <tr>  
                <td> <%=Dessert.getCategory()%></td>
                <td><%=Dessert.getName()%></td>
                <td><%=Dessert.getPrice()%></td>
            </tr>
            <tr><td>Tax :<%= totalTax%></td></tr><br>

            <tr><td>TotalCost :<%= totalBill%></td></tr>
        </table>
    </body>
</html>
