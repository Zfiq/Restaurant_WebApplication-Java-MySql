package WebApp_Restaurant;
//Name Zafar Iqbal
//Student ID 1671637

/* This is a conroller class that will take the selected price values from combo box which is from BillCalculator.jsp and to set the variables 
of Menu_Model class e.g Item id,Item name Category and the price.Four Different ResultSets Statements and SQL queries 
is used to retrive the price values from the database by Categories.After getting the price values 
setting request setAttributes of these four as category names along with Menu_Model objects.Lastly Request Dispacher 
is used to send all the objects values to Menu_TotalCost.jsp to print the values and to add Tax values to it.
 */
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import javax.servlet.RequestDispatcher;

public class Menu_Controller extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        Connection connection = null;
        Statement statement = null;
        ResultSet rs = null;

        String Beverage = request.getParameter("Beverage");
        String Appetizer = request.getParameter("Appetizer");
        String MainCourse = request.getParameter("MainCourse");
        String Dessert = request.getParameter("Dessert");

        Menu_Model menuModel = new Menu_Model();
        Menu_Model menuModel2 = new Menu_Model();
        Menu_Model menuModel3 = new Menu_Model();
        Menu_Model menuModel4 = new Menu_Model();
        try {
            connection = DBConnection.getConnection();
            statement = connection.createStatement();
            rs = statement.executeQuery("select * from menu where price = " + Beverage);

            if (rs.next()) {
                menuModel.setItemId(rs.getInt("itemID"));
                menuModel.setCategory(rs.getString("category"));
                menuModel.setName(rs.getString("name"));
                menuModel.setPrice(rs.getDouble("price"));
                request.setAttribute("Beverage", menuModel);

                RequestDispatcher rd = request.getRequestDispatcher("Menu_TotalCost.jsp");
                rd.forward(request, response);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        }
        try {
            statement = connection.createStatement();
            rs = statement.executeQuery("select * from menu where price = " + Appetizer);
            if (rs.next()) {
                menuModel2.setItemId(rs.getInt("itemID"));
                menuModel2.setCategory(rs.getString("category"));
                menuModel2.setName(rs.getString("name"));
                menuModel2.setPrice(rs.getDouble("price"));
                request.setAttribute("Appetizer", menuModel2);

                RequestDispatcher rd = request.getRequestDispatcher("Menu_TotalCost.jsp");
                rd.forward(request, response);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        }
        try {

            statement = connection.createStatement();
            rs = statement.executeQuery("select * from menu where price = " + MainCourse);

            if (rs.next()) {
                menuModel3.setItemId(rs.getInt("itemID"));
                menuModel3.setCategory(rs.getString("category"));
                menuModel3.setName(rs.getString("name"));
                menuModel3.setPrice(rs.getDouble("price"));
                request.setAttribute("MainCourse", menuModel3);

                RequestDispatcher rd = request.getRequestDispatcher("Menu_TotalCost.jsp");
                rd.forward(request, response);
            }
            rs.close();
            statement.close();
        } catch (Exception e) {
        }
        try {
            statement = connection.createStatement();
            rs = statement.executeQuery("select * from menu where price = " + Dessert);

            if (rs.next()) {
                menuModel4.setItemId(rs.getInt("itemID"));
                menuModel4.setCategory(rs.getString("category"));
                menuModel4.setName(rs.getString("name"));
                menuModel4.setPrice(rs.getDouble("price"));

                request.setAttribute("Dessert", menuModel4);
                RequestDispatcher rd = request.getRequestDispatcher("Menu_TotalCost.jsp");
                rd.forward(request, response);
            }
            connection.close();
            rs.close();
            statement.close();
        } catch (Exception e) {

        }
    }
}
