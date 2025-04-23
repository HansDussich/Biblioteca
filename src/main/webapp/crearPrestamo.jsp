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
<head>
    <title>Nombre de la Página</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>

<body>
<div class="container mt-5">
    <h1 class="mb-4">Agregar Nuevo Libro</h1>

    <form action="LibroServlet" method="post" class="row g-3">
        <input type="hidden" name="accion" value="crear"/>

        <div class="col-md-6">
            <label class="form-label">Título:</label>
            <input type="text" class="form-control" name="titulo" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Autor:</label>
            <input type="text" class="form-control" name="autor" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">Año:</label>
            <input type="number" class="form-control" name="anio" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">ISBN:</label>
            <input type="text" class="form-control" name="isbn" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">Género:</label>
            <input type="text" class="form-control" name="genero" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Disponible:</label><br>
            <input type="hidden" name="disponibilidad" value="false"/>
            <div class="form-check form-switch">
                <input class="form-check-input" type="checkbox" name="disponibilidad" value="true">
                <label class="form-check-label">Sí</label>
            </div>
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-primary">Guardar Libro</button>
            <a href="LibroServlet?accion=listar" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</div>

</body>
</html>