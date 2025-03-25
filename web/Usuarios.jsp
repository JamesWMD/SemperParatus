<%@page import="Modelos.Usuarios"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    HttpSession sessionUser = request.getSession(false);
    Usuarios vusuario = (sessionUser != null) ? (Usuarios) sessionUser.getAttribute("usuario") : null;

    if (vusuario == null) {
        response.sendRedirect("index.jsp?error=noAutorizado");
        return;
    }
%>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/panelPrincipal.css">
    <link rel="stylesheet" href="CSS/panelPrincipalUsuario.css">
    <link rel="stylesheet" href="CSS/f_ventas.css">
    <link rel="stylesheet" href="CSS/usuario.css">
    
    <title>Gestion de Usuario</title>
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
                    <li><a href="index.jsp">Cerrar Sesión</a></li>
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
             <!-- Submenu del modulos Comercial -->
        <div class="main-menu__container" id="menu-container-comercial">
            <div class="main-menu__item" id="menu-item-factura-venta">
                <a href="ventas.jsp" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--factura-venta">Factura de Venta</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-factura-compra">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--factura-compra" disabled>Factura de Compra</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-cotizacion">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--cotizacion" disabled>Cotización</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-pedido">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--pedido" disabled>Pedido</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-recibo-caja">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--recibo-caja" disabled>Recibo de Caja</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-egreso">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--egreso" disabled>Egreso</button>
                </a>
            </div>
        </div>
        
        <!-- Submenu del modulos Administrativo -->
        <div class="main-menu__container" id="menu-container-administrativo">
            <div class="main-menu__item" id="menu-item-informe">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--factura-venta" disabled>Informe</button>
                </a>
            </div>
        </div>

        <!-- Submenu del modulos Produccion -->
        <div class="main-menu__container" id="menu-container-produccion">
            <div class="main-menu__item" id="menu-item--traslado-ajustes">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--traslados-ajustes" disabled>Traslados y Ajustes</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item--productos-insumos">
                <a href="productos.jsp" class="">
                    <button class="main-menu__button main-menu__button--productos">Productos</button>
                </a>
            </div>
        </div>

       <!-- Submenu del modulos Soporte y Registro -->
        <div class="main-menu__container main-menu__container_soporte-registro" id="menu-container-soporte-registro">
            <div class="main-menu__item"id="menu-item-clientes">
                <a href="clientes.jsp" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--clientes">Clientes</button>
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
                <a href="Usuarios.jsp" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--usuarios">Usuarios</button>
                </a>
            </div>
        </div>

        

        <!-- FORMULARIO DE USUARIO -->

        <form class="form form__usuario" action="UsuariosServlet" method="POST">
            
            <div class="tittle">
                <img src="IMG/acceso.png" alt="" srcset="">
                <h2 class="form_tittle">GESTION DE USUARIO</h2>
            </div>
            <h3 class="tittle" >Nuevo Usuario</h3>
           
            <fieldset class="form__actions form__actions--botones-usuario">
                <legend class="form__legend">Acciones de Usuario</legend>
                
                <!-- Acción Buscar -->
                <div class="button-container">
                    <p class="form__text" for="">Buscar Usuario</p>
                    <button type="submit" name="action" class="form__button btn-buscar" value="buscar">
                        <img src="IMG/buscarUsuarios.png" alt="Buscar Usuario">
                    </button>
                </div>
                
                <!-- Acción Listar-->
                <div class="button-container">
                    <p class="form__text" for="">Listar Usuarios</p>
                    <button type="submit" name="action" class="form__button btn-listar" value="listar">
                        <img src="IMG/ListarPersona.png" alt="Lista Usuarios">
                    </button>
                </div>
                
                <!-- Acción Limpiar -->
                <div class="button-container">
                    <p class="form__text" for="">Limpiar Formulario</p>
                    <button type="submit" name="action" class="form__button" value="limpiar">
                        <img src="IMG/limpieza-de-datos.png" alt="Limpiar formulario">
                    </button>
                </div>
                
                <!-- Acción Modificar -->
                <div class="button-container">
                    <p class="form__text" for="">Modificar Usuario</p>
                    <button type="submit" class="form__button btn-modificar" name="action" value="modificar">
                        <img src="IMG/modificar_usuario.png" alt="Modificar usuario">
                    </button>
                </div>
                
                <!-- Acción Guardar -->
                <div class="button-container">
                    <p class="form__text form__test-guardar" for="">Crear Usuario</p>
                    <button type="submit" class="form__button btn-guardar" name="action" value="guardar">
                        <img src="IMG/crear_usuario.png" alt="Crear Usuario">
                    </button>
                </div>
                
                <!-- Acción Eliminar -->
                <div class="button-container">
                    <p class="form__text" for="">Eliminar Usuario</p>
                    <button type="submit" class="form__button btn-eliminar" name="action" value="eliminar">
                        <img src="IMG/eliminar_usuario.png" alt="Eliminar Usuario">
                    </button>
                </div>
                
                <!-- Acción Cerrar Formulario -->
                <div class="button-container">
                    <p class="form__text" for="">Cerrar Formulario</p>
                    <button type="summit" class="form__button form__button-cerrar" name="action" value="cerrar">
                        <img src="IMG/cerrar.png" alt="Guardar datos">
                    </button>
                </div>
            </fieldset>
            <Section class="container__fields-table">

                <fieldset class="form__field-usuarios">
                    <legend class="form__legend">informacion de Usuario</legend>
                    
                    <div class="form__field-usuario form__field--usuario-idUsuario">
                        <label for="noIdentificacion" class="form__label">Usuario</label>
                        <input type="text" name="noIdentificacion" id="noIdentificacion" class="form__input form__input--idUsuario" value="${usuario.noIdentificacion}">
                    </div>
                    
                    <div class="form__field-usuario form__field--usuario-nombreUsuario">
                        <label for="nombreUsuario" class="form__label">Nombres Usuario</label>
                        <input type="text" name="nombreUsuario" id="nombreUsuario" class="form__input form__input--nombreUsuario" value="${usuario.nombreUsuario}">
                    </div>
                    
                    <div class="container__password">
                        
                        <div class="container__password-form__field">
                            
                            <div class="form__field-usuario form__field--usuario-password">
                                <label for="password" class="form__label">Contraseña</label>
                                <div class="form__input-container">
                                    <input type="password" name="password" id="password" class="form__input form__input--password" oninput="validatePasswords()" value="${usuario.password}">
                                </div>
                            </div>
                                
                            <div class="form__field-usuario form__field--usuario-repet_password">
                                <label for="repet_password" class="form__label">Repetir Contraseña</label>
                                <div class="form__input-container">
                                    <input type="password" name="repet_password" id="repet_password" class="form__input form__input--repet_password" oninput="validatePasswords()" value="${usuario.password}">
                                </div>
                            </div>
                         </div>
                         <p class="form__error-message"></p>   
                    </div>
                    <div class="containerBtnVer">
                        <label for="">Ver</label>
                        <button type="button" class="botonVer"  onclick="togglePassword(event)">
                            <img src="IMG/ojo-cerrado (1).png" alt="Ver contraseña" class="form__icon">
                        </button>
                    </div>
                    <div class="form__field-usuario form__field--usuario-estado">
                        <label for="estado" class="form__label">Estado</label>
                        <select name="estado" id="estado" class="form__input">
                            <option class="opt_activo" value="Activo" ${usuario.estado == 'Activo' ? 'selected' : ''}>Activo</option>
                            <option class="opt_inactivo" value="Inactivo" ${usuario.estado == 'Inactivo' ? 'selected' : ''}>Inactivo</option>
                        </select>  
                    </div>
                    
                </fieldset>
            </Section>
                        
            <!-- Campo oculto para la acción -->
            <input type="hidden" name="action" value="buscar" id="actionField">
            <input type="hidden" name="noIdentificacion" value="${vusuario.noIdentificacion}">
            
            <%-- Mostrar mensaje de error si existe --%>
            <c:if test="${not empty mensaje}">
                <div class="container-mensaje">
                    <h4 class="mensaje form_mensaje form_mensaje-usuario">${mensaje}</h4>
                </div>
            </c:if>
            
        </form>

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
    
</body>
</html>
