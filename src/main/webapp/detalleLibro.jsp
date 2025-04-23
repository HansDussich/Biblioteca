<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head><title>Detalle del Libro</title></head>
<body>
    <h1>Detalle del Libro</h1>
    <p><strong>Título:</strong> ${libro.titulo}</p>
    <p><strong>Autor:</strong> ${libro.autor}</p>
    <p><strong>Año:</strong> ${libro.anio}</p>
    <p><strong>ISBN:</strong> ${libro.isbn}</p>
    <p><strong>Género:</strong> ${libro.genero}</p>
    <p><strong>Disponible:</strong> ${libro.disponibilidad ? "Sí" : "No"}</p>
    <p><a href="LibroServlet?accion=listar">Volver</a></p>
</body>
</html>
