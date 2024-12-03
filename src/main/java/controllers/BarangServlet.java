/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package controllers;

import classes.JDBC;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import models.Barang;

/**
 *
 * @author lesskind
 */
@WebServlet(name = "BarangServlet", urlPatterns = {"/BarangServlet"})
public class BarangServlet extends HttpServlet {

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
            throws ServletException, IOException {
        JDBC db = new JDBC();
        String id = request.getParameter("id");
        String nama = request.getParameter("name");
        String stock = request.getParameter("stock");
        Barang br = new Barang(id, nama, stock);
        if(db.isConnected){
            String menu = request.getParameter("m");
            if ("del".equals(menu)) {
                db.runQuery("delete from barang where id = '" + br.getId() + "'");
            } else if ("upd".equals(menu)) {
                db.runQuery("update barang set name = '" + br.getNama() + "', stock = '" + br.getJumlah() + "' where id = '" + br.getId() + "'");
            } else {
                db.runQuery("insert into barang (name, stock) values ('" + br.getNama() + "', '"+ br.getJumlah() +"');");
            }
            db.disconnect();
        }
        response.sendRedirect("daftarBarang.jsp");
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
        processRequest(request, response);
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
        processRequest(request, response);
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
