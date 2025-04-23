/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package com.mycompany.gestionbiblioteca.Servlet;

import com.mycompany.gestionbiblioteca.Controller.ContUsuario;
import com.mycompany.gestionbiblioteca.Entity.Usuario;
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
@WebServlet(name = "UsuarioServlet", urlPatterns = {"/UsuarioServlet"})
public class UsuarioServlet extends HttpServlet {

    ContUsuario control = new ContUsuario();

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

    }
@Override
protected void doGet(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String tipo = request.getParameter("tipo");


    // Código existente (ver usuarios)
    String idParam = request.getParameter("id");
    if (idParam != null) {
        Long id = Long.valueOf(idParam);
        Usuario usuarioEditar = control.buscarUsuarioPorId(id);
        request.getSession().setAttribute("usuarioEditar", usuarioEditar);
    } else {
        request.getSession().removeAttribute("usuarioEditar");
    }

    List<Usuario> listaUsuarios = control.traerUsuarios();
    request.getSession().setAttribute("listaUsuarios", listaUsuarios);

    response.sendRedirect("verUsuarios.jsp");
}




@Override
protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {

    String action = request.getParameter("action");

    switch (action) {
        case "crear":
            crearUsuario(request, response);
            break;
        case "editar":
            editarUsuario(request, response);
            break;
        case "eliminar":
            eliminarUsuario(request, response);
            break;
        case "login":
            loginUsuario(request, response);
            break;
        case "actualizarPerfil":
            actualizarPerfil(request, response);
            break;
        case "cambiarContrasena":
            cambiarContrasena(request, response);
            break;
        default:
            response.sendError(HttpServletResponse.SC_BAD_REQUEST, "Acción no válida");
    }
}

private void actualizarPerfil(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
    // Obtener datos del usuario logueado desde la sesión
    Usuario usuarioLogueado = (Usuario) request.getSession().getAttribute("usuarioLogueado");

    // Obtener nuevos valores del formulario
    String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String email = request.getParameter("email");

    // Actualizar los datos del usuario
    usuarioLogueado.setNombre(nombre);
    usuarioLogueado.setApellido(apellido);
    usuarioLogueado.setEmail(email);

    // Guardar los cambios en la base de datos
    control.actualizarPerfil(usuarioLogueado);

    // Actualizar sesión
    request.getSession().setAttribute("usuarioLogueado", usuarioLogueado);

    // Redirigir de vuelta al perfil
    response.sendRedirect("perfil.jsp");
}

private void cambiarContrasena(HttpServletRequest request, HttpServletResponse response)
        throws IOException {
    // Obtener datos del usuario logueado desde la sesión
    Usuario usuarioLogueado = (Usuario) request.getSession().getAttribute("usuarioLogueado");

    // Obtener la contraseña actual y la nueva contraseña
    String contrasenaActual = request.getParameter("contrasenaActual");
    String nuevaContrasena = request.getParameter("nuevaContrasena");
    String confirmarContrasena = request.getParameter("confirmarContrasena");

    // Validar que la contraseña actual es correcta
    if (!control.verificarContrasenaActual(usuarioLogueado.getId(), contrasenaActual)) {
        response.sendRedirect("perfil.jsp?error=contrasenaIncorrecta");
        return;
    }

    // Validar que las contraseñas nuevas coinciden
    if (!nuevaContrasena.equals(confirmarContrasena)) {
        response.sendRedirect("perfil.jsp?error=contrasenasNoCoinciden");
        return;
    }

    // Cambiar la contraseña
    control.cambiarContrasena(usuarioLogueado.getId(), nuevaContrasena);

    // Redirigir de vuelta al perfil con mensaje de éxito
    response.sendRedirect("perfil.jsp?exito=cambioContrasena");
}



private void loginUsuario(HttpServletRequest request, HttpServletResponse response)
        throws IOException {

    String email = request.getParameter("email");
    String contrasena = request.getParameter("contrasena");

    Usuario usuario = control.buscarUsuarioPorEmail(email);

    if (usuario != null && usuario.getContrasena().equals(contrasena)) {
        // Guardar al usuario en la sesión
        request.getSession().setAttribute("usuarioLogueado", usuario);
        response.sendRedirect("dashboard.jsp"); // Página de inicio después de login
    } else {
        response.sendRedirect("login.jsp?error=true"); // Redirigir a login con error
    }
}


private void crearUsuario(HttpServletRequest request, HttpServletResponse response)
        throws IOException {

        String nombre = request.getParameter("nombre");
    String apellido = request.getParameter("apellido");
    String email = request.getParameter("email");
    String contrasena = request.getParameter("contrasena");
    String rol = request.getParameter("rol");


    boolean validacion = control.existeUsuario(email);

    if (validacion) {
        response.sendRedirect("crearUsuario.jsp");
    } else {
        Usuario usu = new Usuario();
                usu.setNombre(nombre);
        usu.setApellido(apellido);

        usu.setEmail(email);
        usu.setContrasena(contrasena);
        usu.setRol(rol);



        control.crearUsuario(usu);
        response.sendRedirect("UsuarioServlet");
    }
}


    private void editarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long id = Long.valueOf(request.getParameter("id"));
        String nombreUsu = request.getParameter("nombre_usuario");
        String contrasena = request.getParameter("contrasena");
        String rol = request.getParameter("rol");

        Usuario usu = control.buscarUsuarioPorId(id); 

        if (usu != null) {
            usu.setEmail(nombreUsu);
            usu.setContrasena(contrasena);
            usu.setRol(rol);

            control.editarUsuario(usu);
        }

       response.sendRedirect("UsuarioServlet");

    }

    private void eliminarUsuario(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Long id = Long.valueOf(request.getParameter("id"));

        control.eliminarUsuario(id); 
        
        response.sendRedirect("UsuarioServlet");

    }
    
}
