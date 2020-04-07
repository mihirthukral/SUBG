/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package subg.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
//import static subg.controller.SignUpSellerController.st;
import subg.dbutil.DBConnection;

/**
 *
 * @author lenovo
 */
public class SignUpSellerCustomerController extends HttpServlet {
 protected static PreparedStatement ps;
   protected static Statement st;
 
 protected static PreparedStatement ps1;
  protected static PreparedStatement ps2;
   
    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     * @throws java.sql.SQLException
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
       
      String name= request.getParameter("name");
        ps1= DBConnection.getConnection(). prepareStatement("insert into members(username,password,usertype) values(?,?,?)");
              ps= DBConnection.getConnection(). prepareStatement("insert into members_info(name,username,contact_no,password,usertype) values(?,?,?,?,?)");
           ps.setString(1,name);
           String email=request.getParameter("email");
           String s[]=email.split("@");
           email=email.toUpperCase();
           ps.setString(2, email);
           ps1.setString(1, email);
           ps.setDouble(3, Double.parseDouble(request.getParameter("phone")));
           String password=request.getParameter("password");
           ps.setString(4, password);
           ps1.setString(2, password);
           String type=request.getParameter("type");
           ps.setString(5,type);
           ps1.setString(3, type);
               String sql="create table "+s[0]+"(Product_name varchar2(25) NOT NULL,Quantity float NOT NULL,Price_per_kg float NOT NULL)";        
               ps2= DBConnection.getConnection(). prepareStatement(sql);
               ps2.execute();
           ps.execute();
           ps1.execute();
          response.setContentType("text/plain");
		response.getWriter().write("Successfully Signed Up!!!!");
       
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     try {
         processRequest(request, response);
     } catch (SQLException ex) {
         Logger.getLogger(SignUpSellerCustomerController.class.getName()).log(Level.SEVERE, null, ex);
     }
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
     try {
         processRequest(request, response);
     } catch (SQLException ex) {
         Logger.getLogger(SignUpSellerCustomerController.class.getName()).log(Level.SEVERE, null, ex);
     }
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
