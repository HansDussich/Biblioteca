<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Detalle del Libro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h1>Detalle del Libro</h1>
    <ul class="list-group mb-4">
        <li class="list-group-item"><strong>Título:</strong> ${libro.titulo}</li>
        <li class="list-group-item"><strong>Autor:</strong> ${libro.autor}</li>
        <li class="list-group-item"><strong>Año:</strong> ${libro.anio}</li>
        <li class="list-group-item"><strong>ISBN:</strong> ${libro.isbn}</li>
        <li class="list-group-item"><strong>Género:</strong> ${libro.genero}</li>
        <li class="list-group-item"><strong>Disponible:</strong> ${libro.disponibilidad ? "Sí" : "No"}</li>
    </ul>
    <a href="LibroServlet?accion=listar" class="btn btn-secondary">Volver</a>
</body>
</html>
