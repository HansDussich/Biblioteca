<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
    <title>Nombre de la Página</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
<div class="container mt-5">
    <h1 class="mb-4">Listado de Libros</h1>

    <form class="mb-3" action="LibroServlet" method="get">
        <input type="hidden" name="accion" value="listar"/>
        <div class="input-group">
            <input type="text" class="form-control" name="busqueda" placeholder="Buscar por título, autor o género"/>
            <button class="btn btn-outline-secondary" type="submit">Buscar</button>
        </div>
    </form>

    <table class="table table-bordered table-striped">
        <thead class="table-dark">
        <tr>
            <th>Título</th><th>Autor</th><th>Género</th><th>Disponible</th><th>Acciones</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach var="libro" items="${libros}">
            <tr>
                <td>${libro.titulo}</td>
                <td>${libro.autor}</td>
                <td>${libro.genero}</td>
                <td>${libro.disponibilidad ? "Sí" : "No"}</td>
                <td>
                    <a href="LibroServlet?accion=detalle&id=${libro.id}" class="btn btn-sm btn-info">Ver</a>
                    <a href="LibroServlet?accion=editar&id=${libro.id}" class="btn btn-sm btn-warning">Editar</a>
                </td>
            </tr>
        </c:forEach>
        </tbody>
    </table>

    <a href="LibroServlet?accion=crear" class="btn btn-success">Agregar nuevo libro</a>
</div>

</body>
</html>
