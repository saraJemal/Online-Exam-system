/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package newpackage;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author new
 */
public class connectionOfDB {
    private static Connection con;
    
    public static Connection getConnection() throws SQLException{
       
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/userdetails","root","root");
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(connectionOfDB.class.getName()).log(Level.SEVERE, null, ex);
        }
              
      return con;
    }
}
