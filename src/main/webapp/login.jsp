<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Login</title>
</head>
<body>
    <h2>Login</h2>
    <form action="${pageContext.request.contextPath}/UsuarioServlet" method="post">

        <input type="hidden" name="action" value="login" />
        <label for="email">Email:</label>
        <input type="email" id="email" name="email" required /><br /><br />
        
        <label for="contrasena">Contraseña:</label>
        <input type="password" id="contrasena" name="contrasena" required /><br /><br />
        
        <button type="submit">Iniciar sesión</button>
    </form>
    <p>¿No tienes una cuenta? <a href="registrarse.jsp">Regístrate aquí</a></p>
</body>
</html>
