    /*
     * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
     * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
     */
    package com.mycompany.gestionbiblioteca.Servlet;

    import com.mycompany.gestionbiblioteca.Controller.ContLibro;
    import com.mycompany.gestionbiblioteca.Entity.Libro;
    import java.io.IOException;
    import java.io.PrintWriter;
    import java.util.List;
    import javax.servlet.ServletException;
    import javax.servlet.annotation.WebServlet;
    import javax.servlet.http.HttpServlet;
    import javax.servlet.http.HttpServletRequest;
    import javax.servlet.http.HttpServletResponse;

    /**
     *
     * @author hansd
     */
    @WebServlet(name = "LibroServlet", urlPatterns = {"/LibroServlet"})
    public class LibroServlet extends HttpServlet {

 private ContLibro controlador = new ContLibro();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("crearLibro.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        try {
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            int anio = Integer.parseInt(request.getParameter("anio"));
            String isbn = request.getParameter("isbn");
            String genero = request.getParameter("genero");
            boolean disponibilidad = Boolean.parseBoolean(request.getParameter("disponibilidad"));

            Libro libro = new Libro(null, titulo, autor, anio, isbn, genero, disponibilidad);
            controlador.crearLibro(libro);

            response.sendRedirect("listarLibros"); // Redireccionar a lista (ajusta según tu ruta)
        } catch (Exception e) {
            request.setAttribute("error", "Error al crear el libro: " + e.getMessage());
            request.getRequestDispatcher("crearLibro.jsp").forward(request, response);
        }
    }
    }
