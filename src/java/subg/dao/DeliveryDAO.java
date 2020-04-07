/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package subg.dao;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import subg.dbutil.DBConnection;
import subg.dto.MembersDTO;

/**
 *
 * @author lenovo
 */
public class DeliveryDAO {
    private static PreparedStatement ps;
        private static PreparedStatement ps1;
        private static PreparedStatement ps2;

    static
    {
        try
        {
        ps=DBConnection.getConnection().prepareStatement("select * from delivery");
                ps1=DBConnection.getConnection().prepareStatement("insert into aloc_delivery(name,mob) values(?,?)");
                ps2=DBConnection.getConnection().prepareStatement("delete delivery where name=?");
        }
        catch(Exception ex)
        {
            System.out.println("Error in Query");
             ex.printStackTrace();
        }
    }
    static String s1="";
    static long i=0;
    public static String User()throws SQLException
    {   
        String str="";
        ResultSet rs=ps.executeQuery();
                
        while (rs.next()){
                s1=rs.getString(1);
                i=rs.getLong(2);
                str+=s1.toUpperCase()+" Contact no="+i;
                break;
        };
        ps1.setString(1, s1);
        ps1.setLong(2, i);
        ps1.execute();
        ps2.setString(1, s1);
        ps2.execute();
        return str;
    }
    
}
