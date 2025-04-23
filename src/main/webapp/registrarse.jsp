<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrarse</title>
</head>
<body>
    <h2>Registrarse</h2>
    <form action="UsuarioServlet" method="post">
        <input type="hidden" name="action" value="crear" />
        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" required /><br /><br />

        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" required /><br /><br />

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required /><br /><br />

        <label for="contrasena">Contraseña:</label>
        <input type="password" id="contrasena" name="contrasena" required /><br /><br />

        <label for="rol">Rol:</label>
        <select id="rol" name="rol">
            <option value="admin">Admin</option>
            <option value="usuario">Usuario</option>
        </select><br /><br />

        <button type="submit">Registrarse</button>
    </form>
    <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión aquí</a></p>
</body>
</html>
