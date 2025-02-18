<%-- 
    Document   : UsuarioLista
    Created on : 17 feb. 2025, 22:39:57
    Author     : JAMES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page import="Modelos.Usuarios"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Este es un Software ERP desarrollado por aprendices SENA de Curso Tecnologo en análisis y desarrollo de software Ficha 2758277">
    <meta name="keywords" content="Factura de Ventas, Factura de Compra, Pedido, cotización, Recibo de Caja, Egresos, Informes, Gestión de Clientes, Gestión de Proveedores, Gestión de empleados, Gestión de puntos de venta, Gestión de Usuarios">
    <meta name="author" content="James William Montenegro Daza y Laura Yoana Medina Gonzales">
    <meta name="robots" content="nosnipper, noarchive">
    <link rel="icon" href="/IMG/Icon Semper Paratus Oscuro.png">
    <link rel="stylesheet" href="CSS/panelPrincipalUsuario.css">
    <link rel="stylesheet" href="CSS/f_ventas.css">
    <link rel="stylesheet" href="CSS/usuario.css">
    
    <title>Lista de Usuarios</title>
</head>
<body class="grid">
    <header class="header">
        <div class="header__logo">
            <img class="header__logo-image" src="IMG/LogoNombre SP.png" alt="Logo Semper Paratus">
        </div>

        <div class="header__dropdown-container">
            <h2>Bienvenido(a), <span id="nombre-usuario">${usuario.nombreUsuario}</span></h2>
            <div class="dropdown">
                <!-- Checkbox oculto para manejar el estado -->
                <input type="checkbox" id="toggle-menu" class="toggle-menu">
                <!-- Imagen como disparador -->
                <label for="toggle-menu" class="dropdown__label" aria-label="Menú de usuario">
                    <img src="IMG/perfil-del-usuario (1).png" alt="Menu" class="dropdown__icon">
                </label>
                <!-- Menú desplegable -->
                <ul class="dropdown__menu">
                    <li><a href="#">Manuel de Usuario</a></li>
                    <li><a href="#">Soporte</a></li>
                    <li><a href="/index.jsp">Cerrar Sesión</a></li>
                </ul>
            </div>
        </div>  
    </header>

    <!-- Botones de los modulos -->
    <nav class="navigation">
        <h2 class="navigation__title">MODULOS</h2>
        <div class="navigation__button-container">
            <div class="navigation__button-item" id="button-comercial">
                <a href="#">
                    <button class="navigation__button navigation__button--comercial">Comercial</button>
                </a>
            </div>
            <div class="navigation__button-item" id="button-administrativo">
                <a href="#">
                    <button class="navigation__button navigation__button--administrativo">Administrativo</button>
                </a>
            </div>
            <div class="navigation__button-item" id="button-produccion">
                <a href="#">
                    <button class="navigation__button navigation__button--produccion">Produccion</button>
                </a>
            </div>
            <div class="navigation__button-item" id="button-soporte-registro">
                <a href="#">
                    <button class="navigation__button navigation__button--soporte-registro">Soporte y Registro</button>
                </a>
            </div>
        </div>
    </nav>

    <main class="main-menu">

        <!-- Submenu del modulos Soporte y Registro -->
        <div class="main-menu__container" id="menu-container-soporte-registro">
            <div class="main-menu__item"id="menu-item-clientes">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--clientes" disabled>Clientes</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-proveedores">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--proveedores" disabled>Proveedores</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-empleados">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--empleados" disabled>Empleados</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item--puntos-ventas">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--puntos-ventas" disabled>Puntos de ventas</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item--formas-pago">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--formas-pago" disabled>Formas de Pago</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-usuario">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--usuarios">Usuarios</button>
                </a>
            </div>
        </div>
        <div class="container__tabla-listaUsuarios">
            <h3 class="titulo__tabla titulo__tabla-usuarios">LISTA DE USUARIOS</h3>
            
            <jsp:include page="Components/mensaje.jsp"/>
            
            <div class="button-container">
                <p class="form__text" for="">Nuevo Usuario</p>
                <a class="btnNuevo" href="UsuariosServlet?action=nuevo">
                    <img src="IMG/nueva-cuenta (1).png" alt="alt"/>
                </a>
            </div>
            
            <div class="tabla-contenedora-usuarios">
                <table class="tabla-usuarios" id="tabla-usuarios">
                    <thead>
                        <tr>
                            <th class="tabla-usuario-noIdentificacion">No. Identificacion</th>
                            <th class="tabla-usuario-nombreUsuario">Nombres y Apellidos</th>
                            <th class="tabla-usuario-password">Password</th>
                            <th class="tabla-usuario-estado">Estado.</th>
                            <th class="tabla-usuario-selecionar">Seleccionar</th>

                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${usuarios}" var="item">
                        <tr>
                            <td>${item.noIdentificacion}</td>
                            <td>${item.nombreUsuario}</td>
                            <td>${item.password}</td>
                            <td>${item.estado}</td>
                            <td>
                                <a href="UsuariosServlet?action=seleccionar&noIdentificacion=${item.noIdentificacion}">
                                    <img class="icon_button-tabla" src="IMG/marca-de-verificacion2.png" alt="Modificar usuario">
                                </a>
                            </td>
                        </tr>
                        </c:forEach>
                        <c:if test="${usuarios.size() == 0}">
                        <tr>
                            <td colspan="4">No hay Registros</td>
                        </tr>
                        </c:if>
                    </tbody>
                </table>
            </div>
        </div>

    </main>

    <footer class="footer">
        <div>
            <p class="footer__text">© 2024 SEMPER PARATUS.</p>
            <p class="footer__text">Todos los derechos reservados.</p>
        </div>
        
        <p class="footer__text">Semper Paratus v1.0.0</p>
        <p class="footer__links"> 
            <a class="footer__link" href="#">Política de Privacidad</a>
        </p>
    </footer>

    <script src="JS/scripts.js"></script>
    <script src="JS/usuarios.js"></script>
    <script src="JS/factVentas.js"></script> 
    <script src="JS/gProductos.js"></script>
    
</body>
</html>

