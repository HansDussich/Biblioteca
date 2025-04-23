<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="com.mycompany.gestionbiblioteca.Entity.Usuario" %>
<%
    List<Usuario> listaUsuarios = (List<Usuario>) session.getAttribute("listaUsuarios");
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Ver Usuarios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <div class="container mt-5">
        <h2 class="mb-4">Lista de Usuarios</h2>

        <table class="table table-striped table-hover">
            <thead class="table-dark">
                <tr>
                    <th>ID</th>
                    <th>Nombre</th>
                    <th>Apellido</th>
                    <th>Email</th>
                    <th>Rol</th>
                    <th>Acciones</th>
                </tr>
            </thead>
            <tbody>
                <% if (listaUsuarios != null && !listaUsuarios.isEmpty()) {
                    for (Usuario usuario : listaUsuarios) { %>
                        <tr>
                            <td><%= usuario.getId() %></td>
                            <td><%= usuario.getNombre() %></td>
                            <td><%= usuario.getApellido() %></td>
                            <td><%= usuario.getEmail() %></td>
                            <td><%= usuario.getRol() %></td>
                            <td>
                                <a href="UsuarioServlet?id=<%= usuario.getId() %>" class="btn btn-warning btn-sm">Editar</a>
                                <a href="UsuarioServlet?action=eliminar&id=<%= usuario.getId() %>" class="btn btn-danger btn-sm" onclick="return confirm('¿Estás seguro que deseas eliminar este usuario?');">Eliminar</a>
                            </td>
                        </tr>
                <%  }
                } else { %>
                    <tr>
                        <td colspan="6" class="text-center">No hay usuarios registrados</td>
                    </tr>
                <% } %>
            </tbody>
        </table>
    </div>
</body>
</html>
