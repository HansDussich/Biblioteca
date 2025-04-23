<%-- 
    Document   : navbar
    Created on : 23/04/2025, 11:50:20 a. m.
    Author     : hansd
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
<style>
    /* Navbar estilizado */
    .navbar {
        background-color: #343a40;
        font-family: 'Segoe UI', sans-serif;
        display: flex;
        justify-content: space-between;
        padding: 0 30px;
        align-items: center;
        height: 60px;
    }

    .navbar .logo {
        color: #fff;
        font-size: 20px;
        font-weight: bold;
        text-decoration: none;
    }

    .navbar .nav-links {
        display: flex;
        gap: 30px;
    }

    .navbar .nav-item {
        position: relative;
    }

    .navbar .nav-link {
        color: #fff;
        text-decoration: none;
        padding: 14px 0;
        display: inline-block;
        transition: color 0.3s;
    }

    .navbar .nav-link:hover {
        color: #00bcd4;
    }

    .navbar .dropdown-content {
        display: none;
        position: absolute;
        background-color: #fff;
        min-width: 160px;
        top: 100%;
        left: 0;
        box-shadow: 0 8px 16px rgba(0,0,0,0.15);
        z-index: 1;
    }

    .navbar .dropdown-content a {
        color: #333;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
    }

    .navbar .dropdown-content a:hover {
        background-color: #f1f1f1;
    }

    .navbar .nav-item:hover .dropdown-content {
        display: block;
    }

    /* Responsive básico */
    @media (max-width: 768px) {
        .navbar {
            flex-direction: column;
            align-items: flex-start;
            height: auto;
            padding: 10px 20px;
        }
        .navbar .nav-links {
            flex-direction: column;
            width: 100%;
        }
        .navbar .nav-item {
            width: 100%;
        }
    }
</style>

<div class="navbar">
    <a class="logo" href="index.jsp">Biblioteca</a>
    <div class="nav-links">
        <div class="nav-item">
            <a href="LibroServlet?accion=listar" class="nav-link">Libros</a>
           
            </div>
        </div>
        <div class="nav-item">
            <a href="dashboard.jsp" class="nav-link">Usuarios</a>
           
        </div>
        <div class="nav-item">
            <a href="PrestamoServlet?accion=listar" class="nav-link">Préstamos</a>
            
        </div>
    </div>
</div>

</html>
