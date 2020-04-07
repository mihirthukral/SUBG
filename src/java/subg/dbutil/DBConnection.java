/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package subg.dbutil;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Om
 */
public class DBConnection {
    private static Connection conn;
    static
    {
        try
        {
            Class.forName("oracle.jdbc.OracleDriver");
            conn=DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "subgproject","project");
            
        }
         catch(Exception ex)
         {
             System.out.println("Error in connection");
             ex.printStackTrace();
         }
    }
    public static Connection getConnection()
    {
        return conn;
    }
    public static void closeConnection()
    {
        try
        {
            conn.close();
        }
        catch(Exception ex)
        {
              System.out.println("Error in connection");
              ex.printStackTrace();
            
        }
    }
}
