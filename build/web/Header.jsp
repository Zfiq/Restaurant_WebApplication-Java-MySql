<%-- 
    Document   : Reservation_Header_Footer
    Created on : Aug 27, 2019, 11:17:15 AM
    Author     : Zafar
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>

        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <!-- Link connection to Style.css -->
        <link rel="stylesheet" type="text/css" href="StyleCss/Style.css"/> 
        <title>Header</title>

    </head>
    <body>

        <header>
            <!-- Header text layout is modified in Style.css class -->
            <!-- Restaurant image from Image folder and Large text for restaurant name -->
            <!-- For the image file width and height set in Style.css class which is used for the name MyRestuarant background-image as Logo.-->
            <!-- Class Logo is the Restaurant name for styling in Style.css class.-->
            <div class="Logo">MyRestaurant</div>
            <!--Layout is in Style.css class for ul and li.-->
          
                <ul class="ul_Header">
                    <li ><a class="li_Header" href="WellCome.jsp">Home</a></li>
                    <li><a class="li_Header" href="index.jsp">Login Differnt User</a></li>
                    <li><a class="li_Header" href="Menu">Menu</a></li>
                    <li><a class="li_Header" href="ContactUs.jsp">Contact Us</a></li>
                </ul>

           
        </header>

    </body>



</html>
