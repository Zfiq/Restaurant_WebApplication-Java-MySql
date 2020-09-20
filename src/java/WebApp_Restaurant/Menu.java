package WebApp_Restaurant;
//Name Zafar Iqbal
//Student ID 1671637

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class Menu extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();

        Connection connection = null;
        ResultSet resultSet = null;
        PreparedStatement preparedStatement = null;

        connection = DBConnection.getConnection(); // Get Connection DBConnection class and getConnection method
        // prepare sql query using Prepared Statement

        try {

            preparedStatement = connection.prepareStatement("SELECT * FROM MENU ");
            response.setHeader("refresh", "120");// Re-query the database and update the web page at 2 minute intervals. 
            resultSet = preparedStatement.executeQuery();
            // use of html table to display the menu and for coloring will use css internaly.
            response.setContentType("text/html");
            out.println("<!Doctype html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<head>");
            out.println("<TITLE>Menu</TITLE>");
            out.println("<style>");                      //Css Style for coloring each head columns
            //Set menu text size to 5px bold and italic and coloed green.
            out.println("body{background-color:#B8860B}");
            out.println(".menu{color:green;font-size:50px;font-weight:bold;font-style:italic;}");
            out.println(".ItemId{color:red}");          //set Item ID column color to red.
            out.println(".ItemName{color:blue}");      //Set Item Name column color to Blue.
            out.println(".Category{color:green}");    //Set Category column color to green.
            out.println(".Price{color:#CC064C;padding-left:400px}"); //Set Price column to the right and colored.
            out.println(".Price-Text{padding-left:400px}"); // Set all prices that shows to the right of the Page.
            out.println("</style>");  // close Style

            out.println("</head>");

            out.println("<body>");
            out.println("<div class='menu'>Menu</div>");
            //Hyper links to WellCome page and Bill Calcuator using unorder list.
            out.println("<ul>");
            out.println("<li><a href='WellCome.jsp'>Home</a></li><br>");
            out.println("<li><a href='BillCalculator.jsp'>BillCalculator</a></li>");
            out.println("</ul>");
            out.println("<table border='1'cellpadding='10'bgcolor='lightblue'>"); //Set table border,cell padding and background color as Light Blue
            // Set table row Categorys name
            out.println("<tr><td class='ItemId'>ItemID</td><td class='ItemName'>Item Name</td><td class='Category'>Category</td><td class='Price'>Price</></tr>");
            while (resultSet.next()) {        // While loop to fetch data in table from database
                out.println("<tr><td>" + resultSet.getInt(1) + "</td><td>"
                        + resultSet.getString(2) + "</td><td bgcolor='gray'>" + resultSet.getString(3)
                        + "</td><td class='Price-Text'>" + resultSet.getDouble(4) + "</td></tr>");

            }
            out.println("</table>");
            out.println("</body>");
            out.println("</html>");

            // Close connection
            connection.close();
        } catch (SQLException ex) {
            Logger.getLogger(Menu.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
