<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Libro</title>
</head>
<body>
    <h1>Registrar Nuevo Libro</h1>

    <form action="crearLibro" method="post">
        <label>Título:</label><br>
        <input type="text" name="titulo" required><br><br>

        <label>Autor:</label><br>
        <input type="text" name="autor" required><br><br>

        <label>Año:</label><br>
        <input type="number" name="anio" required><br><br>

        <label>ISBN:</label><br>
        <input type="text" name="isbn" required><br><br>

        <label>Género:</label><br>
        <input type="text" name="genero" required><br><br>

        <label>Disponible:</label><br>
        <select name="disponibilidad">
            <option value="true">Sí</option>
            <option value="false">No</option>
        </select><br><br>

        <input type="submit" value="Guardar Libro">
    </form>

    <%
        if (request.getAttribute("error") != null) {
            out.println("<p style='color:red;'>" + request.getAttribute("error") + "</p>");
        }
    %>

    <p><a href="listarLibros">Volver a la lista</a></p>
</body>
</html>
