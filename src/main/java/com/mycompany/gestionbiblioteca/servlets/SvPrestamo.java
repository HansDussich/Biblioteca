package com.mycompany.gestionbiblioteca.servlets;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvPrestamo", urlPatterns = {"/SvPrestamo"})
public class SvPrestamo extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica para obtener préstamos
        try {
            // Aquí irá la lógica para obtener la lista de préstamos
            request.getRequestDispatcher("prestamos.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener los préstamos: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica para crear/actualizar préstamos
        try {
            int idLibro = Integer.parseInt(request.getParameter("idLibro"));
            int idUsuario = Integer.parseInt(request.getParameter("idUsuario"));
            String fechaPrestamo = request.getParameter("fechaPrestamo");
            String fechaDevolucion = request.getParameter("fechaDevolucion");
            
            SimpleDateFormat dateFormat = new SimpleDateFormat("yyyy-MM-dd");
            Date fechaPrestamoDate = dateFormat.parse(fechaPrestamo);
            Date fechaDevolucionDate = dateFormat.parse(fechaDevolucion);
            
            // Aquí irá la lógica para guardar el préstamo
            
            response.sendRedirect("prestamos.jsp");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar el préstamo: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para la gestión de préstamos";
    }
} 