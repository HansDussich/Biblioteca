<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.gestionbiblioteca.Entity.Prestamo" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%
    List<Prestamo> prestamos = (List<Prestamo>) request.getAttribute("prestamos");
    SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
%>
<html>
<head>
    <title>Listado de Préstamos</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 40px;
            background-color: #f5f5f5;
        }
        h1 {
            color: #333;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            background-color: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        th, td {
            padding: 10px;
            border: 1px solid #ddd;
            text-align: center;
        }
        th {
            background-color: #007BFF;
            color: white;
        }
        tr:hover {
            background-color: #f1f1f1;
        }
        a {
            color: #007BFF;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
        .links {
            margin-top: 20px;
        }
    </style>
</head>
<body>
    <h1>Listado de Préstamos</h1>
    <table>
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
            <td><%= p.getFechaPrestamo() != null ? sdf.format(p.getFechaPrestamo()) : "No disponible" %></td>
            <td><%= p.getFechaDevolucion() != null ? sdf.format(p.getFechaDevolucion()) : "No disponible" %></td>
            <td>
                <% if (p.getFechaDevolucion() == null) { %>
                    <a href="PrestamoServlet?accion=devolver&id=<%= p.getId() %>">Devolver</a>
                <% } else { %>
                    <%= sdf.format(p.getFechaDevolucion()) %>
                <% } %>
            </td>
            <td>
                <% if (p.getFechaDevolucion() == null) { %>
                    <a href="PrestamoServlet?accion=devolver&id=<%= p.getId() %>">Registrar devolución</a>
                <% } else { %>
                    Devuelto
                <% } %>
            </td>
        </tr>
        <% } %>
    </table>

    <div class="links">
        <p><a href="crearPrestamo.jsp">Solicitar nuevo préstamo</a></p>
        <p><a href="index.jsp">Volver al inicio</a></p>
    </div>
</body>
</html>
