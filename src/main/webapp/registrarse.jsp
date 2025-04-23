<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Registrarse</title>
    <style>
        body {
            font-family: 'Segoe UI', sans-serif;
            background: linear-gradient(to right, #6a11cb, #2575fc);
            height: 100vh;
            margin: 0;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        .register-container {
            background: #fff;
            padding: 2rem 3rem;
            border-radius: 15px;
            box-shadow: 0 10px 25px rgba(0,0,0,0.2);
            width: 400px;
        }
        h2 {
            text-align: center;
            color: #333;
        }
        label {
            display: block;
            margin-top: 1rem;
            font-weight: bold;
        }
        input, select {
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
            background-color: #2575fc;
            color: white;
            border: none;
            border-radius: 10px;
            font-size: 1rem;
            cursor: pointer;
        }
        button:hover {
            background-color: #1a5fd0;
        }
        p {
            margin-top: 1rem;
            text-align: center;
        }
        a {
            color: #2575fc;
            text-decoration: none;
        }
        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
<div class="register-container">
    <h2>Registrarse</h2>
    <form action="UsuarioServlet" method="post">
        <input type="hidden" name="action" value="crear" />

        <label for="nombre">Nombre</label>
        <input type="text" id="nombre" name="nombre" required />

        <label for="apellido">Apellido</label>
        <input type="text" id="apellido" name="apellido" required />

        <label for="email">Email</label>
        <input type="email" id="email" name="email" required />

        <label for="contrasena">Contraseña</label>
        <input type="password" id="contrasena" name="contrasena" required />

        <label for="rol">Rol</label>
        <select id="rol" name="rol">
            <option value="admin">Admin</option>
            <option value="usuario">Usuario</option>
        </select>

        <button type="submit">Registrarse</button>
    </form>
    <p>¿Ya tienes una cuenta? <a href="login.jsp">Inicia sesión aquí</a></p>
</div>
</body>
</html>
