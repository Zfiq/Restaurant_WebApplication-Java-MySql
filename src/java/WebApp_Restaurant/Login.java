package WebApp_Restaurant;
//Name Zafar Iqbal
//Student ID 1671637

import java.io.IOException;
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
import javax.servlet.http.HttpSession;

public class Login extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String WaiterName = request.getParameter("UserName");      // Fetch Data from index.jsp which is  UserName
        String UserPassword = request.getParameter("Password");    // Fetch Data from index.jsp which is Password
        if (WaiterName.equals("")) {                             //If WaiterName is empty it will show the NoEntry message on the same page.
            request.setAttribute("NoEntryError", "*The feild is empty");
            getServletContext().getRequestDispatcher("/index.jsp").forward(request, response);
        }

        // Database Connectivity
        Connection connection = null;
        ResultSet resultSet = null;
        try {
            // Import Connection and Driver Manager to connect to the Database 

            connection = DBConnection.getConnection(); // connect to DBConnection class.

            // PreparedStatement to proccess the SQL Query 
            PreparedStatement preparedStatement = connection.prepareStatement("SELECT * FROM WAITERS WHERE WaiterName = ? AND Password = ?;");

            // Set preparedStatement Parameters
            preparedStatement.setString(1, WaiterName);
            preparedStatement.setString(2, UserPassword);
            // ResultSet to execute the Query
            resultSet = preparedStatement.executeQuery();
            // If the next row in the Database is not null
            // Check if the Waiter Name and password exsits in the DataBase through Conditional Statement 

            if (resultSet.next()) {

                // Set the Http session to send the data to Display the user name on wellCome page Named as WaiterValitade
                HttpSession session = request.getSession();
                //Set Session for Waiter's Name

                // Set Session to prevent WellCome page from Invalid login User in WellCome.jsp page  
                // Session for Valid User Name
                session.setAttribute("WaiterValidate", WaiterName); //Set Session Label name as WaiterValidate and send Data name as WaiterName
                response.sendRedirect("WellCome.jsp");             // Forward session data to WellCome.jsp Page

            } else {
                //1). If the Waiter Name doesn't exists in the Database User Directed to index.jsp.
                //2).Set a request Attribute to set an Error message named as InvalidUser. 
                //3).Forward the Error message through getServletContext() and getRequestDispacher.
                request.setAttribute("InvalidUser", "*Invalid User and Password"); // Session Name InvalidUser and an error message
                getServletContext().getRequestDispatcher("/index.jsp").forward(request, response); //If invalid user direct it to login page 
            }
        } catch (SQLException ex) {

        } finally {
            if (connection != null) {    // If Connection is not null then Close Connection
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }
    }
}
