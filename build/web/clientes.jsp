<%@page import="Modelos.Usuarios"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/panelPrincipal.css">
    <link rel="stylesheet" href="CSS/panelPrincipalClientes.css">
    <link rel="stylesheet" href="CSS/f_ventas.css">
    <link rel="stylesheet" href="CSS/productos.css">
    
    <title>Panel Pricipal</title>
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
                <a href="#" class="main-menu__link">
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

       <!-- FORMULARIO DE GESTION DE CLIENTES -->

        <form class="form__gestion-productos" action="ClientesServlet" method="post">
            <div class="tittle">
                <img src="IMG/Clientes.png" alt="" srcset="">
                <H2 class="form_tittle" >GESTION DE CLIENTE</H2>
            </div>
           
            
      
            <section>
                <fieldset class="form__actions form__actions--botones-gestionProductos">
                    <legend class="form__legend">Acciones del formulario</legend>
                    
                    <!-- Acción Buscar -->
                    <div class="button-container">
                        <p class="form__text" for="">Buscar Cliente</p>
                        <button type="submit" name="action" class="form__button" value="buscar">
                            <img src="IMG/buscarUsuarios.png" alt="Buscar Clientes">
                        </button>
                    </div>
                    
                    <!-- Acción Listar-->
                    <div class="button-container">
                        <p class="form__text" for="">Listar Clientes</p>
                        <button type="submit" name="action" class="form__button" value="listar">
                            <img src="IMG/ListarPersona.png" alt="Listar Clientes">
                        </button>
                    </div>
                    
                    <!-- Acción Limpiar -->
                    <div class="button-container">
                        <p class="form__text" for="">Limpiar</p>
                        <button type="submit" name="action" class="form__button" value="limpiar">
                            <img src="IMG/limpieza-de-datos.png" alt="Limpiar Formulario">
                        </button>
                    </div>
                    
                    <!-- Acción Modificar -->
                    <div class="button-container">
                        <p class="form__text" for="">Modificar</p>
                        <button type="submit" name="action" class="form__button" value="modificar">
                            <img src="IMG/modificar_usuario.png" alt="Modificar Cliente">
                        </button>
                    </div>
                    
                    <!-- Acción Guardar -->
                    <div class="button-container">
                        <p class="form__text" for="">Guardar</p>
                        <button type="submit" name="action" class="form__button" value="guardar">
                            <img src="IMG/crear_usuario.png" alt="Guardar Cliente">
                        </button>
                    </div>
                    
                    <!-- Acción Eliminar -->
                    <div class="button-container">
                        <p class="form__text" for="">Eliminar</p>
                        <button type="submit" name="action" class="form__button" value="eliminar">
                            <img src="IMG/eliminar_usuario.png" alt="Eliminar Cliente">
                        </button>
                    </div>
                    
                     <!-- Acción Cerrar Formulario -->
                    <div class="button-container">
                        <p class="form__text" for="">Cerrar Formulario</p>
                        <button type="submit" name="action" class="form__button form__button-cerrar" value="cerrar">
                            <img src="IMG/cerrar.png" alt="cerrar fomulario">
                        </button>
                    </div>
                </fieldset>
            </section>
             
            <jsp:include page="Components/mensaje.jsp"/>
            
            <fieldset class="form__fields form__fields--clientes">
                <legend class="form__legend">Datos del Cliente</legend>
                <div class="form__field--cliente">
                    <label for="tipoDocumento" class="form__label">T. Doc.</label>
                    <select name="tipoDocumento" id="tipoDocumento" class="">
                        <option value="CC" ${cliente.tipoDocumento == 'CC' ? 'selected' : ''}>CC</option>
                        <option value="CE" ${cliente.tipoDocumento == 'CE' ? 'selected' : ''}>CE</option>
                        <option value="NIT" ${cliente.tipoDocumento == 'NIT' ? 'selected' : ''}>NIT</option>
                        <option value="TI" ${cliente.tipoDocumento == 'TI' ? 'selected' : ''}>TI</option>
                        <option value="TE" ${cliente.tipoDocumento == 'TE' ? 'selected' : ''}>TE</option>
                        <option value="PPT" ${cliente.tipoDocumento == 'PPT' ? 'selected' : ''}>PPT</option>
                        <option value="RCN" ${cliente.tipoDocumento == 'RCN' ? 'selected' : ''}>RCN</option>
                        <option value="PEP" ${cliente.tipoDocumento == 'PEP' ? 'selected' : ''}>PEP</option>
                        <option value="PTP" ${cliente.tipoDocumento == 'PTP' ? 'selected' : ''}>PTP</option>
                        <option value="NIP" ${cliente.tipoDocumento == 'NIP' ? 'selected' : ''}>NIP</option>
                        <option value="RUT" ${cliente.tipoDocumento == 'RUT' ? 'selected' : ''}>RUT</option>
                    </select>  
                </div>
            
                <div class="form__field--cliente form__field--cliente-identificacion">
                    <label for="idCliente" class="form__label">No. Ident.</label>
                    <input type="text" name="idCliente" id="idCliente" class="form__input--cliente form__input--identificacion" value="${cliente.idCliente}">
                </div>
                <div class="form__field--cliente form__field--cliente-nombreRazonSocial">
                    <label for="nombreCliente" class="form__label">Nombres o Razon social</label>
                    <input type="text" name="nombreCliente" id="nombreCliente" class="form__input--cliente form__input--nombre-razon_social" value="${cliente.nombreCliente}">
                </div>
                <div class="form__field--cliente form__field--cliente-apellidosNombreComercial">
                    <label for="apellidoCliente" class="form__label">Apellidos o N. Comercial</label>
                    <input type="text" name="apellidoCliente" id="apellidoCliente" class="form__input--cliente form__input--apellidos-nombre_comercial" value="${cliente.apellidoCliente}">
                </div>
                <div class="form__field--cliente form__field--cliente-telefono">
                    <label for="telefonoCliente" class="form__label">Telefono</label>
                    <input type="text" name="telefonoCliente" id="telefonoCliente" class="form__input--cliente form__input--telefono" value="${cliente.telefonoCliente}">
                </div>
                <div class="form__field--cliente form__field--cliente-direccion">
                    <label for="direccionCliente" class="form__label">Direccion</label>
                    <input type="text" name="direccionCliente" id="direccionCliente" class="form__input--cliente form__input--direccion" value="${cliente.direccionCliente}">
                </div>
            </fieldset>
            <%-- Mostrar mensaje de error si existe --%>
            <c:if test="${not empty mensaje}">
                <h4 class="mensaje form_mensaje form_mensaje-producto">${mensaje}</h4>
            </c:if>
            
           <!-- Campo oculto para la acción -->
            <input type="hidden" name="action" value="buscar" id="actionField">
            <input type="hidden" name="idCliente" value="${cliente.idCliente}">
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
    <script src="JS/gProductos.js"></script>
    
</body>
</html>
