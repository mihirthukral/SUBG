/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package subg.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import subg.dbutil.DBConnection;

/**
 *
 * @author lenovo
 */
public class Realloc extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, SQLException {
         String name=(String)request.getAttribute("name");
         String product=(String)request.getAttribute("product");
         float quantity=(float)request.getAttribute("quantity");
         float p=(float)request.getAttribute("p");
        PreparedStatement ps2=DBConnection.getConnection().prepareStatement("select name from realloc where Product_name=? and Quantity=? and Price_per_kg=?");
            ps2.setString(1, product);
            ps2.setFloat(2, quantity);
            ps2.setFloat(3, p);
            ResultSet rs=ps2.executeQuery();
          //  System.out.println((int)(price/quantity));
             String n="";
            while(rs.next()){
           n=rs.getString(1);
            break;
            }
            
            PreparedStatement ps3=DBConnection.getConnection().prepareStatement("select Quantity from "+n+" where Product_name=? and Price_per_kg=?");
            ps3.setString(1,product);
            ps3.setFloat(2, p);
            ResultSet rs1=ps3.executeQuery();
            Float q=0.0f;
            while(rs1.next()){
             q=rs1.getFloat(1);
             break;
            }
            PreparedStatement ps1=DBConnection.getConnection().prepareStatement("update "+n+" set Quantity=? where Product_name=? and Price_per_kg=?");
            ps1.setFloat(1,(q+quantity));
            ps1.setString(2, product);
            ps1.setFloat(3, p);
            ps1.executeUpdate();
            
            PreparedStatement ps4=DBConnection.getConnection().prepareStatement("delete realloc where Product_name=? and Quantity=? and Price_per_kg=? and name=?");
            ps4.setString(1,product);
            ps4.setFloat(2, quantity);
            ps4.setFloat(3,p);
            ps4.setString(4, n);
            ps4.execute();
                        response.getWriter().write("Product Removed from Cart");

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
            Logger.getLogger(Realloc.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Realloc.class.getName()).log(Level.SEVERE, null, ex);
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
