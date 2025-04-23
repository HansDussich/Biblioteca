<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Dashboard</title>
</head>
<body>
    <h2>Bienvenido, ${usuarioLogueado.nombre}</h2>
    <p>Acciones disponibles para ti:</p>
    <ul>
        <li><a href="verUsuarios.jsp">Ver Usuarios</a></li>
        <li><a href="perfil.jsp">Perfil</a></li>
        <li><a href="UsuarioServlet?action=logout">Cerrar sesión</a></li>
    </ul>
</body>
</html>
