package WebApp_Restaurant;
//Name Zafar Iqbal
//Student ID 1671637

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
// In This class we will return a Connection object everytime we need to connect to MySql Database we will use this method from DBCoonection class

public class DBConnection {

    public static Connection getConnection() { // Name of the method is getConnection
        Connection connection = null;  // Connection variable asign to null 
        try {                             // it will require try catch block it might throw an Exception
            Class.forName("com.mysql.jdbc.Driver"); // We need to import Driver name and retrive our connection asign it to Driver Manager
            connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/restaurant?useSSL=false", "root", "123456"); // It takes 3 parameters url database name second is the user and third is the password

        } catch (Exception e) {
            e.printStackTrace();
            if (connection != null) { // After testing the connection we need to close the connection to prevent it from memory leak
                try {
                    connection.close();
                } catch (SQLException ex) {
                    Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
                }
            }
        }

        return connection;
    }

}
