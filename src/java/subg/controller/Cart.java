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
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import subg.dbutil.DBConnection;
import subg.dto.AddCartDTO;

/**
 *
 * @author lenovo
 */
public class Cart extends HttpServlet {

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
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
           String str=request.getParameter("name");
            String st=request.getParameter("username");
            String s=request.getParameter("product");
            float f=Float.parseFloat(request.getParameter("quantity"));
            float t=Float.parseFloat(request.getParameter("price"));
           float o_price= Float.parseFloat(request.getParameter("o_price"));
           float o_quant=Float.parseFloat(request.getParameter("o_quant"));
          
        PreparedStatement ps3=DBConnection.getConnection().prepareStatement("select * from "+str+" where Product_Name=? and Quantity=? and Price_per_kg=?");
        ps3.setString(1,s);
        ps3.setFloat(2,f);
        ps3.setFloat(3,t);
        ResultSet rs=ps3.executeQuery();
        if(rs.next()==false){
            PreparedStatement ps=DBConnection.getConnection().prepareStatement("insert into "+str+"(Product_Name,Quantity,Price_per_kg) values(?,?,?)");
            ps.setString(1, s);
            ps.setFloat(2, f);
            ps.setFloat(3,t);
            ps.execute();
            PreparedStatement ps1=DBConnection.getConnection().prepareStatement("update "+st+" set quantity='"+(o_quant-f)+"' where Product_name='"+s+"' and price_per_kg='"+o_price+"'");
            ps1.execute();
            PreparedStatement ps2=DBConnection.getConnection().prepareStatement("insert into realloc(Product_name,Quantity,Price_per_kg,Name) values(?,?,?,?)");
            ps2.setString(1, s);
            ps2.setFloat(2, f);
            ps2.setFloat(3, o_price);
            ps2.setString(4,st);
            ps2.execute();
            PreparedStatement ps5=DBConnection.getConnection().prepareStatement("delete "+st+" where Quantity=0.0");
            ps5.executeUpdate();
        out.write("Product Added to Cart");
        }
        else{
            out.write("Product Already Added to Cart");
                    };
        }
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
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
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
            Logger.getLogger(Cart.class.getName()).log(Level.SEVERE, null, ex);
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
