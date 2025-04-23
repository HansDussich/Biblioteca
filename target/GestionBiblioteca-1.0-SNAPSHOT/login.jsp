<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #74ebd5 0%, #9face6 100%);
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .login-container {
            background-color: white;
            padding: 2rem 3rem;
            border-radius: 15px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.25);
            text-align: center;
            width: 350px;
        }

        h2 {
            margin-bottom: 1.5rem;
            color: #333;
        }

        label {
            display: block;
            text-align: left;
            margin-bottom: 0.5rem;
            font-weight: bold;
        }

        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 0.6rem;
            margin-bottom: 1rem;
            border: 1px solid #ccc;
            border-radius: 10px;
            transition: border-color 0.3s ease;
        }

        input:focus {
            border-color: #6a82fb;
            outline: none;
        }

        button {
            width: 100%;
            padding: 0.7rem;
            background-color: #6a82fb;
            color: white;
            border: none;
            border-radius: 10px;
            cursor: pointer;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #5a72e8;
        }

        p {
            margin-top: 1rem;
            font-size: 0.9rem;
        }

        a {
            color: #6a82fb;
            text-decoration: none;
        }

        a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>Iniciar Sesión</h2>
        <form action="${pageContext.request.contextPath}/UsuarioServlet" method="post">
            <input type="hidden" name="action" value="login" />

            <label for="email">Correo Electrónico</label>
            <input type="email" id="email" name="email" required />

            <label for="contrasena">Contraseña</label>
            <input type="password" id="contrasena" name="contrasena" required />

            <button type="submit">Entrar</button>
        </form>
        <p>¿No tienes una cuenta? <a href="registrarse.jsp">Regístrate aquí</a></p>
    </div>
</body>
</html>
