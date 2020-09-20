
package WebApp_Restaurant;
//Name Zafar Iqbal
//Student ID 1671637

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;


public class Logout extends HttpServlet {
 
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
    }
 
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       HttpSession session = request.getSession();
       session.removeAttribute("WaiterValidate"); //This method is to terminate the entire session of WellCome Page session named as WaiterValidate
       session.invalidate();
       response.sendRedirect("index.jsp"); // After Loging out it should direct to Login Page
      
    }

}
