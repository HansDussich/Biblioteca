<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Perfil</title>
</head>
<body>
    <h2>Perfil de Usuario</h2>

    <!-- Mostrar el perfil actual -->
    <form action="UsuarioServlet"  method="post">
        <input type="hidden" name="action" value="actualizarPerfil" />

        <label for="nombre">Nombre:</label>
        <input type="text" id="nombre" name="nombre" value="${usuarioLogueado.nombre}" required /><br /><br />

        <label for="apellido">Apellido:</label>
        <input type="text" id="apellido" name="apellido" value="${usuarioLogueado.apellido}" required /><br /><br />

        <label for="email">Email:</label>
        <input type="email" id="email" name="email" value="${usuarioLogueado.email}" required /><br /><br />

        <button type="submit">Actualizar Perfil</button>
    </form>

    <!-- Cambiar la contraseña -->
    <h3>Cambiar Contraseña</h3>
    <form action="UsuarioServlet" method="post">
        <input type="hidden" name="action" value="cambiarContrasena" />
        
        <label for="contrasenaActual">Contraseña Actual:</label>
        <input type="password" id="contrasenaActual" name="contrasenaActual" required /><br /><br />
        
        <label for="nuevaContrasena">Nueva Contraseña:</label>
        <input type="password" id="nuevaContrasena" name="nuevaContrasena" required /><br /><br />

        <label for="confirmarContrasena">Confirmar Nueva Contraseña:</label>
        <input type="password" id="confirmarContrasena" name="confirmarContrasena" required /><br /><br />
        
        <button type="submit">Cambiar Contraseña</button>
    </form>

</body>
</html>
    