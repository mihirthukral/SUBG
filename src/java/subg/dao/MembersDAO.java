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
 * @author Om
 */
public class MembersDAO {
    private static PreparedStatement ps;
    static
    {
        try
        {
        ps=DBConnection.getConnection().prepareStatement("select * from members where username=? and password=? and usertype=?");
        }
        catch(Exception ex)
        {
            System.out.println("Error in Query");
             ex.printStackTrace();
        }
    }
    public static boolean findUser(MembersDTO member)throws SQLException
    {
        ps.setString(1,member.getUsername());
        ps.setString(2,member.getPassword());
        ps.setString(3, member.getUsertype());
        ResultSet rs=ps.executeQuery();
        return (rs.next());
    }
}
