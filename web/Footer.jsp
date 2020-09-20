<%-- 
    Document   : Footer
    Created on : Aug 27, 2019, 2:34:00 PM
    Author     : Zafar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!--StyleSheet connection link to Style.css class -->
        <link rel="stylesheet" type="text/css" href="StyleCss/Style.css"/>
        <title>Footer</title>

    </head>
    <body>

        <!--For the footer tags layout css is used in footer section.-->
        <!-- placed the copyRight text outside the ul tag-->
        <!--li contain hyper links to other pages.-->
        <!--The logout input form layout is modified using css-->

        <footer>

            <ul class="ul_Footer">
                <li ><a class="li_Footer" href="Menu">Menu</a></li>
                <li><a class="li_Footer" href="BillCalculator.jsp">MenuCalculator</a></li>
                <li><a class="li_Footer" href="CustomerReservations.jsp">Reserve Table</a></li>

                <li><form class="Logout-Footer" action="Logout" method="post">
                        <input type="submit" value="Logout" class="LogoutButton"/>
                    </form></li>
            </ul>
            <article class="offer-text">
                Special offers for students and for our regular customers.
                Upcoming events we will be offering our free new recipes and desserts to all our customers.
                <strong>Please Note</strong>.Our free new recipe offer only applies to those who comes with minimum 5 in Number in party.
            </article>

            <div class="CopyRight"> CopyRight &copy; 2018-19 All Rights Reserved.</div>

        </footer>
    </body>
</html>
