<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Perfil</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: #f0f2f5;
            margin: 0;
            padding: 2rem;
            display: flex;
            flex-direction: column;
            align-items: center;
        }

        .perfil-container {
            background-color: white;
            padding: 2rem 3rem;
            border-radius: 15px;
            box-shadow: 0 10px 20px rgba(0,0,0,0.15);
            width: 450px;
        }

        h2, h3 {
            text-align: center;
            color: #333;
        }

        form {
            margin-top: 1rem;
        }

        label {
            font-weight: bold;
            display: block;
            margin-top: 1rem;
        }

        input {
            width: 100%;
            padding: 0.6rem;
            margin-top: 0.3rem;
            border: 1px solid #ccc;
            border-radius: 8px;
        }

        button {
            margin-top: 1.5rem;
            width: 100%;
            padding: 0.7rem;
            background-color: #6a11cb;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            cursor: pointer;
        }

        button:hover {
            background-color: #5b0eb2;
        }
    </style>
</head>
<body>

<div class="perfil-container">
    <h2>Perfil de Usuario</h2>

    <!-- Actualizar perfil -->
    <form action="UsuarioServlet" method="post">
        <input type="hidden" name="action" value="actualizarPerfil" />

        <label for="nombre">Nombre</label>
        <input type="text" id="nombre" name="nombre" value="${usuarioLogueado.nombre}" required />

        <label for="apellido">Apellido</label>
        <input type="text" id="apellido" name="apellido" value="${usuarioLogueado.apellido}" required />

        <label for="email">Email</label>
        <input type="email" id="email" name="email" value="${usuarioLogueado.email}" required />

        <button type="submit">Actualizar Perfil</button>
    </form>

    <!-- Cambiar contraseña -->
    <h3>Cambiar Contraseña</h3>
    <form action="UsuarioServlet" method="post">
        <input type="hidden" name="action" value="cambiarContrasena" />

        <label for="contrasenaActual">Contraseña Actual</label>
        <input type="password" id="contrasenaActual" name="contrasenaActual" required />

        <label for="nuevaContrasena">Nueva Contraseña</label>
        <input type="password" id="nuevaContrasena" name="nuevaContrasena" required />

        <label for="confirmarContrasena">Confirmar Nueva Contraseña</label>
        <input type="password" id="confirmarContrasena" name="confirmarContrasena" required />

        <button type="submit">Cambiar Contraseña</button>
    </form>
</div>

</body>
</html>
