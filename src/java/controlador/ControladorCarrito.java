/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controlador;

import DAO.CarritoDAO;
import DAO.ProductoDAO;
import DAO.RegistroDAO;
import beens.BeensCarrito;
import beens.BeensProducto;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 *
 * @author varga
 */
@WebServlet(name = "ControladorCarrito", urlPatterns = {"/ControladorCarrito"})
public class ControladorCarrito extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    List<BeensCarrito> Listacarrito = new ArrayList<>();
    ProductoDAO DAO = new ProductoDAO();
    RegistroDAO RDAO = new RegistroDAO();
    int IdU;
    int IdPro;
    int item;
    int cantidad = 1;
    double totalpagar = 0.0;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String acc = request.getParameter("accion");
        String Men = request.getParameter("menu");
        if (acc.equals("carrito")) {
            request.getRequestDispatcher("Produc_Usu.jsp").forward(request, response);
        }
        if (acc.equals("Carr")) {
            switch (Men) {
                case "Agregar":
                    IdPro = Integer.parseInt(request.getParameter("id"));
                    IdU = Integer.parseInt(request.getParameter("idU"));
                    BeensProducto P = DAO.listarId(IdPro);
                    P.setId_categoria(P.getId_categoria());
                    P.setId_prducto(P.getId_producto());
                    P.setId_registro(IdU);
                    
                    DAO.insertar(P);
                    IdU = Integer.parseInt(request.getParameter("id"));
                    List list = new CarritoDAO().getAll(IdU);
                    /*item = item + 1;
                    BeensCarrito car = new BeensCarrito();
                    car.setItem(item);
                    car.setId_producto(P.getId_producto());
                    car.setNombre(P.getNombres());
                    car.setDescrip(P.getDescrip());
                    car.setPrecioFinal(P.getCosto());
                    car.setCantidad(cantidad);
                    car.setSubToatal(cantidad * P.getCosto());
                    Listacarrito.add(car);*/
                    request.setAttribute("contador", Listacarrito.size());
                    request.getRequestDispatcher("ControladorCarrito?accion=carrito").forward(request, response);
                    break;
                case "Carrito":
                    totalpagar = 0.0;
                    request.setAttribute("car", Listacarrito);
                    request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                    break;
                case "Eliminar":
                    int id_producto = Integer.parseInt(request.getParameter("id"));
                    for (int i = 0; i < Listacarrito.size(); i++) {
                        if (Listacarrito.get(i).getId_producto() == id_producto) {
                            Listacarrito.remove(i);
                        }
                    }
                    request.setAttribute("car", Listacarrito);
                    request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                    break;
                case "Pagar":
                    int id = Integer.parseInt(request.getParameter("id"));
                    for (int i = 0; i < Listacarrito.size(); i++) {
                        if (Listacarrito.get(i).getId_producto() == id) {
                            Listacarrito.clear();
                        }
                    }
                    request.setAttribute("car", Listacarrito);
                    request.getRequestDispatcher("Carrito.jsp").forward(request, response);
                    break;
            }

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
