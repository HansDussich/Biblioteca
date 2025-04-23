<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head><title>Listado de Libros</title></head>
<body>
    <h1>Listado de Libros</h1>
    <form action="LibroServlet" method="get">
        <input type="hidden" name="accion" value="listar"/>
        <input type="text" name="busqueda" placeholder="Buscar por título, autor o género"/>
        <button type="submit">Buscar</button>
    </form>

    <table border="1">
        <tr>
            <th>Título</th><th>Autor</th><th>Género</th><th>Disponibilidad</th><th>Acciones</th>
        </tr>
        <c:forEach var="libro" items="${libros}">
            <tr>
                <td>${libro.titulo}</td>
                <td>${libro.autor}</td>
                <td>${libro.genero}</td>
                <td>${libro.disponibilidad ? "Sí" : "No"}</td>
                <td>
                    <a href="LibroServlet?accion=detalle&id=${libro.id}">Ver</a>
                    <a href="LibroServlet?accion=editar&id=${libro.id}">Editar</a>
                </td>
            </tr>
        </c:forEach>
    </table>

    <p><a href="LibroServlet?accion=crear">Agregar nuevo libro</a></p>
</body>
</html>
