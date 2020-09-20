<%-- 
    Document   : BillCalculator
    Created on : Sep 25, 2019, 8:17:31 PM
    Author     : Zafar
--%>
<%@page import="WebApp_Restaurant.DBConnection"%>
<%@page import="WebApp_Restaurant.Menu_Model"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@include file="Header.jsp"%>
<%@include file="Footer.jsp"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

        <script>
            // Function Calculate displays the total sum of values from select boxes. 
            // Display names for selected prices as DisplaySelectionOne,DisplaySelectionTwo ,DisplaySelectionThree and Four.
            //ComboBox id = ComboBoxOne..ComboBoxTwo..ComboBoxThree..ComboBoxFour.. which are the id names of each select option drop downs. ..Displays price of selected Items...
            function calculate() {
                var item1 = document.getElementById("ComoBoxOne").value;
                var item2 = document.getElementById("ComoBoxTwo").value;
                var item3 = document.getElementById("ComoBoxThree").value;
                var item4 = document.getElementById("ComoBoxFour").value;
                var taxRate1 = 0.05;
                var taxRate2 = 0.10;
                var taxRate3 = 0.15;
                var totalTax = 0;

                // If item1 price is greater than 2 it will multiply rateTax1
                if (item1 >= 2) {
                    totalTax = taxRate1 *= item1;
                    // Add totalTax to totalcost
                }
                // If item2 price is equal and greater than 6 it will multiply rateTax2
                if (item2 >= 6) {
                    totalTax = taxRate2 *= item2;
                    // Add totalTax to totalcost
                }
                // If item3 price is equal and greater than 10 it will multiply rateTax3
                if (item3 >= 10) {
                    totalTax = taxRate3 *= item3;
                    // Add totalTax to totalcost
                }
                // If item4 price is equal and greater than 4 it will multiply rateTax1
                if (item4 >= 4) {
                    totalTax = taxRate1 *= item4;
                    // Add totalTax to totalcost
                }
                var totalcost = parseFloat(item1) + parseFloat(item2) + parseFloat(item3) + parseFloat(item4) + totalTax;
                if (!isNaN(totalcost)) {
                    document.getElementById("DisplayTotal").innerHTML = "Inc Tax Total Cost:" + totalcost; //DisplayTotal is to show total sum of the prices without refreshing the page.
                }
            }
            function ItemOne() {
                var selectItemOne = document.getElementById("ComoBoxOne");
                var DisplaySelectionOne = document.getElementById("DisplaySelectionOne");
                DisplaySelectionOne.innerHTML = selectItemOne.value;
            }
            function ItemTwo() {
                var selectItemTwo = document.getElementById("ComoBoxTwo");
                var DisplaySelectionTwo = document.getElementById("DisplaySelectionTwo");
                DisplaySelectionTwo.innerHTML = selectItemTwo.value;
            }
            function ItemThree() {
                var selectItemThree = document.getElementById("ComoBoxThree");
                var DisplaySelectionThree = document.getElementById("DisplaySelectionThree");
                DisplaySelectionThree.innerHTML = selectItemThree.value;
            }
            function ItemFour() {
                var selectItemFour = document.getElementById("ComoBoxFour");
                var DisplaySelectionFour = document.getElementById("DisplaySelectionFour");
                DisplaySelectionFour.innerHTML = selectItemFour.value;
            }
        </script>
        <style>

            form{margin-top:100px}

        </style>

    </head>
    <body style="background: #B8860B">

        <!-- Set HTML from for user selection from combo Box to check prices of each item from different Categories which is from Menu database.-->
        <!-- We aligned the from to margin bottom to make it scrollable -->
        <!--This form contains select and option to show items from database within the options.-->
        <!--Use of javaScript to show values on the same page without refreshing the page.-->

        <!--User must login to use this page and to achive this will use the same method as previously used in different classes.-->
        <%
            // To accsess this page user must login with valid User Name and Password 
            // If the Waiter Validate is null response send redirect to login page which is index.jsp
            if (session.getAttribute("WaiterValidate") == null) {  // If it doesn't match the name in that case call Login page.
                response.sendRedirect("index.jsp"); // If a valid User Name entered proceed to WellCome Page.
            }
            //Clear Cache after logout to prevent the back button.
            response.setHeader("Cache-Control", "no-cache, no-store, must revalidate");
        %>

        <form action="Menu_Controller">
            Beverage:<div id ="DisplaySelectionOne">Price:</div>        <!--This id Display is to show the price with tax without refreshing the page.-->
            <select  id="ComoBoxOne"  name="Beverage" onchange="ItemOne()">   <!-- ItemOne() is a function which shows the price from this category when selected from drop down-->
                <option value="0">Select Item</option> <!-- Each Select option is filled with different Categories from the menu database.-->
                <%
                    try {
                        Connection connection = DBConnection.getConnection();
                        Statement statement = connection.createStatement();
                        ResultSet rs = statement.executeQuery("SELECT * FROM menu where category = 'Beverage'");
                        while (rs.next()) {
                %>
                <option value="<%= rs.getInt(4)%>"><%= rs.getString(2)%></option>

                <%
                        }
                        connection.close();
                        rs.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select><br>
            Appetizer:<div id ="DisplaySelectionTwo">Price:</div>   
            <select id="ComoBoxTwo"  name="Appetizer" onchange="ItemTwo()">
                <option value="0">Select Item</option>

                <%
                    try {
                        Connection connection = DBConnection.getConnection();
                        Statement statement = connection.createStatement();
                        ResultSet rs = statement.executeQuery("SELECT * FROM menu where category = 'Appetizer'");
                        while (rs.next()) {
                %>
                <option value="<%= rs.getInt(4)%>"><%= rs.getString(2)%></option>

                <%
                        }
                        connection.close();
                        rs.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select><br>

            MainCourse:<div id ="DisplaySelectionThree">Price:</div>  
            <select id="ComoBoxThree"  name="MainCourse" onchange="ItemThree()">
                <option value="0">Select Item</option>

                <%
                    try {
                        Connection connection = DBConnection.getConnection();
                        Statement statement = connection.createStatement();
                        ResultSet rs = statement.executeQuery("SELECT * FROM menu where category = 'Main Course'");
                        while (rs.next()) {
                %>
                <option value="<%= rs.getInt(4)%>"><%= rs.getString(2)%></option>

                <%
                        }
                        connection.close();
                        rs.close();
                    } catch (Exception e) {

                        e.printStackTrace();
                    }
                %>
            </select><br>
            Dessert:<div id ="DisplaySelectionFour">Price:</div>  
            <select id="ComoBoxFour"  name="Dessert" onchange="ItemFour()">
                <option value="0">Select Item</option>

                <%
                    try {
                        Connection connection = DBConnection.getConnection();
                        Statement statement = connection.createStatement();
                        ResultSet rs = statement.executeQuery("SELECT * FROM menu where category = 'Dessert'");
                        while (rs.next()) {
                %>
                <option value="<%= rs.getInt(4)%>"><%= rs.getString(2)%></option>

                <%
                        }
                        connection.close();
                        rs.close();
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                %>
            </select>
            <input type="submit" value="submit"/>       <!--By submiting this from is to finalize the order which sends the request to the servlet -->

        </form>
        <h1 id="DisplayTotal"></h2>   <!-- The total price will be Display here.-->

        <button onclick="calculate()">Calculate</button><br>      <!-- By clicking this button will trigger the onclick function which will calculate and show the total sum.-->

        <p style="margin-bottom: 150px"></p> <!-- This paragraph is used to make a space at the bottom of the page fro scrolling purpose.-->
</body>
</html>