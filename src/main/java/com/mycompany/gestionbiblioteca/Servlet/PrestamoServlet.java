package com.mycompany.gestionbiblioteca.Servlet;

import com.mycompany.gestionbiblioteca.Controller.ContPrestamo;
import com.mycompany.gestionbiblioteca.Controller.ContLibro;
import com.mycompany.gestionbiblioteca.Controller.ContUsuario;
import com.mycompany.gestionbiblioteca.Entity.Libro;
import com.mycompany.gestionbiblioteca.Entity.Prestamo;
import com.mycompany.gestionbiblioteca.Entity.Usuario;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet(name = "PrestamoServlet", urlPatterns = {"/PrestamoServlet"})
public class PrestamoServlet extends HttpServlet {

    private ContPrestamo controlador = new ContPrestamo();
    private ContUsuario controladorUsuario = new ContUsuario();
    private ContLibro controladorLibro = new ContLibro();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String accion = request.getParameter("accion");

        if (accion == null || accion.equals("listar")) {
            List<Prestamo> prestamos = controlador.listarPrestamos();
            request.setAttribute("prestamos", prestamos);
            request.getRequestDispatcher("listarPrestamos.jsp").forward(request, response);

        } else if (accion.equals("devolver")) {
            Long id = Long.parseLong(request.getParameter("id"));
            controlador.devolverPrestamo(id);
            response.sendRedirect("PrestamoServlet?accion=listar");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        Long idUsuario = Long.parseLong(request.getParameter("usuario"));
        Long idLibro = Long.parseLong(request.getParameter("libro"));
        Usuario usuario = controladorUsuario.buscarUsuarioPorId(idUsuario);
        Libro libro = controladorLibro.buscarLibro(idLibro);
        controlador.solicitarPrestamo(usuario, libro);
        response.sendRedirect("PrestamoServlet?accion=listar");
    }
}
