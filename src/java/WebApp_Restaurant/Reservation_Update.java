package WebApp_Restaurant;
//Name Zafar Iqbal
//Student ID 1671637

/*This servelt class is use for two purposes one is to upadate any reserved Table by Table Number and 
Secondly update any reservation from DisplayAllReservation.jsp by clicking (update) */
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
public class Reservation_Update extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        PrintWriter out = response.getWriter();
       //Get all variables from index.jsp
        String firstname = request.getParameter("FirstName");
        String lastname = request.getParameter("LastName");
        String address = request.getParameter("Address");
        String telephone = request.getParameter("Telephone");
        String date = request.getParameter("Date");
        String numberinparty = request.getParameter("NumberInParty");
        String table = request.getParameter("Table");

        Connection connection = null;
        Statement statement = null;

        try {
           // Connection from DBConnection class 
            connection = DBConnection.getConnection();
            // Query to update any reservation from database.
            String sql = "Update reservations set FirstName='" + firstname + "',LastName='" + lastname + "',Address='" + address + "',Telephone='" + telephone + "',Date='" + date + "',NumberInParty='" + numberinparty + "' where TableNumber = '" + table + "'";
            statement = connection.createStatement();
            int i = statement.executeUpdate(sql);
            // If Integer i is grater than 0 after executing an update we set an alert message through request set attribut as Update and a String message.
            if (i > 0) {

                request.setAttribute("Updated", "Reservation table " + table + " updated successfully");
                // The above statement is to pass the content which is Update to DisplayAllReservation.jsp.
                getServletContext().getRequestDispatcher("/DisplayAllReservations.jsp").forward(request, response);
            }

        } catch (SQLException ex) {
            out.println("There is problem in updating this reservation");

        }
    }
}
