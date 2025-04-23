<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.gestionbiblioteca.Entity.Prestamo" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    List<Prestamo> prestamos = (List<Prestamo>) request.getAttribute("prestamos");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>
<html>
<head><title>Listado de Préstamos</title></head>
<body>
<h1>Listado de Préstamos</h1>
<table border="1">
    <tr>
        <th>Usuario</th>
        <th>Libro</th>
        <th>Fecha Préstamo</th>
        <th>Fecha Prevista Devolución</th>
        <th>Fecha Devolución Real</th>
        <th>Acción</th>
    </tr>
    <% for (Prestamo p : prestamos) { %>
    <tr>
        <td><%= p.getUsuario().getNombre() %></td>
        <td><%= p.getLibro().getTitulo() %></td>
        <td><%= sdf.format(p.getFechaPrestamo()) %></td>
        <td><%= sdf.format(p.getFechaDevolucion()) %></td>
        <td>
            <% if (p.getFechaDevolucion()== null) { %>
                <a href="PrestamoServlet?accion=devolver&id=<%= p.getId() %>">Devolver</a>
            <% } else { %>
                Devuelto
            <% } %>
        </td>
    </tr>
    <% } %>
</table>
<p><a href="crearPrestamo.jsp">Solicitar nuevo préstamo</a></p>
<p><a href="index.jsp">Volver al inicio</a></p>
</body>
</html>
