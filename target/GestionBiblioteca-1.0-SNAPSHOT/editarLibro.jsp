<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Editar Libro</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="container mt-5">
    <h1 class="mb-4">Editar Libro</h1>

    <form action="LibroServlet" method="post" class="row g-3">
        <input type="hidden" name="accion" value="editar"/>
        <input type="hidden" name="id" value="${libro.id}"/>

        <div class="col-md-6">
            <label class="form-label">Título:</label>
            <input type="text" name="titulo" value="${libro.titulo}" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Autor:</label>
            <input type="text" name="autor" value="${libro.autor}" class="form-control" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">Año:</label>
            <input type="number" name="anio" value="${libro.anio}" class="form-control" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">ISBN:</label>
            <input type="text" name="isbn" value="${libro.isbn}" class="form-control" required>
        </div>

        <div class="col-md-4">
            <label class="form-label">Género:</label>
            <input type="text" name="genero" value="${libro.genero}" class="form-control" required>
        </div>

        <div class="col-md-6">
            <label class="form-label">Disponible:</label>
            <select name="disponibilidad" class="form-select">
                <option value="true" ${libro.disponibilidad ? "selected" : ""}>Sí</option>
                <option value="false" ${!libro.disponibilidad ? "selected" : ""}>No</option>
            </select>
        </div>

        <div class="col-12">
            <button type="submit" class="btn btn-success">Guardar Cambios</button>
            <a href="LibroServlet?accion=listar" class="btn btn-secondary">Cancelar</a>
        </div>
    </form>
</body>
</html>
