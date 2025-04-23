package com.mycompany.gestionbiblioteca.Servlet;

import com.mycompany.gestionbiblioteca.Controller.ContLibro;
import com.mycompany.gestionbiblioteca.Entity.Libro;
import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "LibroServlet", urlPatterns = {"/LibroServlet"})
public class LibroServlet extends HttpServlet {

    private ContLibro controlador = new ContLibro();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        if (accion == null || accion.equals("listar")) {
            List<Libro> libros = controlador.listarLibros();
            request.setAttribute("libros", libros);
            request.getRequestDispatcher("listarLibros.jsp").forward(request, response);

        } else if (accion.equals("detalle")) {
            long id = Long.parseLong(request.getParameter("id"));
            Libro libro = controlador.buscarLibro(id);
            request.setAttribute("libro", libro);
            request.getRequestDispatcher("detalleLibro.jsp").forward(request, response);

        } else if (accion.equals("editar")) {
            long id = Long.parseLong(request.getParameter("id"));
            Libro libro = controlador.buscarLibro(id);
            request.setAttribute("libro", libro);
            request.getRequestDispatcher("editarLibro.jsp").forward(request, response);

        } else if (accion.equals("crear")) {
            request.getRequestDispatcher("crearLibro.jsp").forward(request, response);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String accion = request.getParameter("accion");

        try {
            String titulo = request.getParameter("titulo");
            String autor = request.getParameter("autor");
            int anio = Integer.parseInt(request.getParameter("anio"));
            String isbn = request.getParameter("isbn");
            String genero = request.getParameter("genero");
            boolean disponibilidad = Boolean.parseBoolean(request.getParameter("disponibilidad"));

            if (accion.equals("crear")) {
                Libro libro = new Libro(titulo, autor, anio, isbn, genero, disponibilidad);
                controlador.crearLibro(libro);

            } else if (accion.equals("editar")) {
                long id = Long.parseLong(request.getParameter("id"));
                Libro existingLibro = controlador.buscarLibro(id);
                if (existingLibro != null) {
                    existingLibro.setTitulo(titulo);
                    existingLibro.setAutor(autor);
                    existingLibro.setAnio(anio);
                    existingLibro.setIsbn(isbn);
                    existingLibro.setGenero(genero);
                    existingLibro.setDisponibilidad(disponibilidad);
                    // prestamoList is preserved
                    controlador.actualizarLibro(existingLibro);
                } else {
                    request.setAttribute("error", "No se pudo encontrar el libro con ID " + id);
                    request.getRequestDispatcher("listarLibros.jsp").forward(request, response);
                }
            }

            response.sendRedirect("LibroServlet?accion=listar");

        } catch (Exception e) {
            request.setAttribute("error", "Error al procesar el libro: " + e.getMessage());
            request.getRequestDispatcher("crearLibro.jsp").forward(request, response);
        }

    }
}
