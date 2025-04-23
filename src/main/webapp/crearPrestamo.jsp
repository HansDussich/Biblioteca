<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.gestionbiblioteca.Entity.Libro" %>
<%@ page import="com.mycompany.gestionbiblioteca.Entity.Usuario" %>
<%@ page import="com.mycompany.gestionbiblioteca.Controller.ContLibro" %>
<%@ page import="com.mycompany.gestionbiblioteca.Controller.ContUsuario" %>
<%
    ContLibro cl = new ContLibro();
    ContUsuario cu = new ContUsuario();
    List<Libro> libros = cl.listarLibros();
    List<Usuario> usuarios = cu.traerUsuarios();
%>
<html>
<head><title>Solicitar Préstamo</title></head>
<body>
<h1>Solicitar Préstamo</h1>
<form method="post" action="PrestamoServlet">
    <label>Usuario:</label><br>
    <select name="usuario">
        <% for (Usuario u : usuarios) { %>
            <option value="<%= u.getId() %>"><%= u.getNombre() %></option>
        <% } %>
    </select><br><br>

    <label>Libro:</label><br>
    <select name="libro">
        <% for (Libro l : libros) {
            if (l.isDisponibilidad()) { %>
            <option value="<%= l.getId() %>"><%= l.getTitulo() %></option>
        <% } } %>
    </select><br><br>

    <input type="submit" value="Solicitar Préstamo">
</form>
</body>
</html>