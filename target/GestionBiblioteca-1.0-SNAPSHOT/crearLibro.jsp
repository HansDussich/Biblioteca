<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Crear Libro</title></head>
<body>
    <h1>Agregar Nuevo Libro</h1>

    <form action="LibroServlet" method="post">
        <input type="hidden" name="accion" value="crear"/>

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

        <label>Disponible:
    <input type="hidden" name="disponibilidad" value="false"/>
<input type="checkbox" name="disponibilidad" value="true"/>

</label><br><br>

        <input type="submit" value="Guardar Libro">
    </form>

    <p><a href="LibroServlet?accion=listar">Cancelar</a></p>
</body>
</html>
