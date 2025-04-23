<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Crear Libro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h1 class="mb-4">Agregar Nuevo Libro</h1>

    <form action="LibroServlet" method="post" class="row g-3">
        <input type="hidden" name="accion" value="crear"/>

        <div class="col-md-6">
            <label class="form-label">Título:</label>
            <input type="text" name="titulo" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Autor:</label>
            <input type="text" name="autor" class="form-control" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">Año:</label>
            <input type="number" name="anio" class="form-control" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">ISBN:</label>
            <input type="text" name="isbn" class="form-control" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">Género:</label>
            <input type="text" name="genero" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-check-label">¿Disponible?</label><br>
            <input type="hidden" name="disponibilidad" value="false"/>
            <input type="checkbox" name="disponibilidad" value="true" class="form-check-input">
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-primary">Guardar Libro</button>
            <a href="LibroServlet?accion=listar" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</body>
</html>
