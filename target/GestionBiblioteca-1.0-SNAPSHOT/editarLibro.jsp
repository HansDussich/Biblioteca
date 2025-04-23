<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Editar Libro</title></head>
<body>
    <h1>Editar Libro</h1>
    <form action="LibroServlet" method="post">
    <input type="hidden" name="accion" value="editar"/>
    <input type="hidden" name="id" value="${libro.id}"/>


        <label>Título:</label><br>
        <input type="text" name="titulo" value="${libro.titulo}" required><br><br>

        <label>Autor:</label><br>
        <input type="text" name="autor" value="${libro.autor}" required><br><br>

        <label>Año:</label><br>
        <input type="number" name="anio" value="${libro.anio}" required><br><br>

        <label>ISBN:</label><br>
        <input type="text" name="isbn" value="${libro.isbn}" required><br><br>

        <label>Género:</label><br>
        <input type="text" name="genero" value="${libro.genero}" required><br><br>

        <label>Disponible:</label><br>
        <select name="disponibilidad">
            <option value="true" ${libro.disponibilidad ? "selected" : ""}>Sí</option>
            <option value="false" ${!libro.disponibilidad ? "selected" : ""}>No</option>
        </select><br><br>

        <input type="submit" value="Guardar Cambios">
    </form>
    <p><a href="LibroServlet?accion=listar">Cancelar</a></p>
</body>
</html>
