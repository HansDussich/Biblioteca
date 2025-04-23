package com.mycompany.gestionbiblioteca.servlets;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "SvLibro", urlPatterns = {"/SvLibro"})
public class SvLibro extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica para obtener libros
        try {
            // Aquí irá la lógica para obtener la lista de libros
            request.getRequestDispatcher("libros.jsp").forward(request, response);
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al obtener los libros: " + e.getMessage());
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Lógica para crear/actualizar libros
        try {
            String titulo = request.getParameter("titulo");
            String isbn = request.getParameter("isbn");
            String autor = request.getParameter("autor");
            int ejemplares = Integer.parseInt(request.getParameter("ejemplares"));
            
            // Aquí irá la lógica para guardar el libro
            
            response.sendRedirect("libros.jsp");
        } catch (Exception e) {
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR, "Error al procesar el libro: " + e.getMessage());
        }
    }

    @Override
    public String getServletInfo() {
        return "Servlet para la gestión de libros";
    }
} 