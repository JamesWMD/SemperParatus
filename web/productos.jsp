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
    <link rel="stylesheet" href="CSS/panelPrincipalProducto.css">
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
                    <button class="main-menu__button main-menu__button--factura-compra">Factura de Compra</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-cotizacion">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--cotizacion">Cotización</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-pedido">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--pedido">Pedido</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-recibo-caja">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--recibo-caja">Recibo de Caja</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-egreso">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--egreso">Egreso</button>
                </a>
            </div>
        </div>
        
        <!-- Submenu del modulos Administrativo -->
        <div class="main-menu__container" id="menu-container-administrativo">
            <div class="main-menu__item" id="menu-item-informe">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--factura-venta">Informe</button>
                </a>
            </div>
        </div>

        <!-- Submenu del modulos Produccion -->
        <div class="main-menu__container main-menu__container_produccion" id="menu-container-produccion">
            <div class="main-menu__item" id="menu-item--traslado-ajustes">
                <a href="gestionProductos.jsp" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--traslados-ajustes">Traslados y Ajustes</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item--productos-insumos">
                <a href="gestionProductos.jsp" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--productos">Productos</button>
                </a>
            </div>
        </div>

       <!-- Submenu del modulos Soporte y Registro -->
        <div class="main-menu__container main-menu__container_soporte-registro" id="menu-container-soporte-registro">
            <div class="main-menu__item"id="menu-item-clientes">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--clientes">Clientes</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-proveedores">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--proveedores">Proveedores</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-empleados">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--empleados">Empleados</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item--puntos-ventas">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--puntos-ventas">Puntos de ventas</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item--formas-pago">
                <a href="#" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--formas-pago">Formas de Pago</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-usuario">
                <a href="Usuarios.jsp" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--usuarios">Usuarios</button>
                </a>
            </div>
        </div>

       <!-- FORMULARIO DE GESTION DE PRODUCTOS -->

        <form class="form__gestion-productos" action="ProductosServlet" method="post">
            <div class="tittle">
                <img src="IMG/ajustra_producto.png" alt="" srcset="">
                <H2 class="form_tittle" >GESTION DE PRODUCTOS</H2>
            </div>
            
        
            <section>
                <fieldset class="form__actions form__actions--botones-gestionProductos">
                    <legend class="form__legend">Acciones del formulario</legend>
                    
                    <!-- Acción Buscar -->
                    <div class="button-container">
                        <p class="form__text" for="">Buscar Producto</p>
                        <button type="summit" name="action" class="form__button" value="buscar">
                            <img src="IMG/caja-de-entrega.png" alt="Buscar Producto">
                        </button>
                    </div>
                    
                    <!-- Acción Listar-->
                    <div class="button-container">
                        <p class="form__text" for="">Listar Productos</p>
                        <button type="summit" name="action" class="form__button" value="listar">
                            <img src="IMG/listarProductos.png" alt="Listar Productos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Limpiar</p>
                        <button type="summit" name="action" class="form__button" value="limpiar">
                            <img src="IMG/limpieza-de-datos.png" alt="Guardar datos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Modificar</p>
                        <button type="summit" name="action" class="form__button" value="modificar">
                            <img src="IMG/modificarProducto.png" alt="Modificar productos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Guardar</p>
                        <button type="summit" name="action" class="form__button" value="guardar">
                            <img src="IMG/agregar-producto.png" alt="Guardar Producto">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Eliminar</p>
                        <button type="summit" name="action" class="form__button" value="eliminar">
                            <img src="IMG/eliminar-producto.png" alt="Guardar datos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Cerrar Formulario</p>
                        <button type="summit" name="action" class="form__button form__button-cerrar" value="cerrar">
                            <img src="IMG/cerrar.png" alt="cerrar fomulario">
                        </button>
                    </div>
                </fieldset>
            </section>
            <jsp:include page="Components/mensaje.jsp"/>
            
            <fieldset class="form__fields form__fields--gestion-productos_DatosProductos">
                <legend class="form__legend">Datos del producto</legend>
                <div class="form__field--container_gestion-productos_DatosProductos">
                    <div class="form__field--producto form__field--producto-codigo">
                        <label for="codigoProducto" class="form__label">Cod</label>
                        <input type="text" name="codigoProducto" id="codigoProducto" class="form__input--producto form__input--codigo" value="${producto.codigoProducto}">
                    </div>
                    <div class="form__field--producto form__field--producto-nombreProducto">
                        <label for="nombreProducto" class="form__label">Nombre del Producto</label>
                        <input type="text" name="nombreProducto" id="nombreProducto" class="form__input--producto form__input--nombreProducto" value="${producto.nombreProducto}">
                    </div>
                    <div class="form__field--producto form__field--producto-categoria">
                        <label for="categoria" class="form__label">Categoria</label>
                        <input type="text" name="categoria" id="categoria" class="form__input--producto form__input--categoria" value="${producto.categoria}">
                    </div>
                    <div class="form__field--producto form__field--producto-precio">
                        <label for="precio" class="form__label">Precio</label>
                        <input type="text" name="precio" id="precio" class="form__input--producto formatear form__input--precio" value="${producto.precio}">
                    </div>
                    <div class="form__field--producto form__field--producto-descuento">
                        <label for="stock" class="form__label">Stock</label>
                        <input type="text" name="stock" id="stock" class="form__input--producto formatear  form__input--descuento" value="${producto.stock}">
                    </div>
                    <div class="form__field--producto form__field--producto-subtotal">
                        <label for="subtotal" class="form__label">Estado</label>
                        <select name="estado" id="estado" class="form__input">
                            <option value="Activo" ${producto.estado == 'Activo' ? 'selected' : ''}>Activo</option>
                            <option value="Inactivo" ${producto.estado == 'Inactivo' ? 'selected' : ''}>Inactivo</option>
                        </select>  
                    </div>
                </div>
                <div class="form__fields--gestion-productos_datosProductos-descripcion">
                    <label for="descripcion">Descripcion del producto</label>
                    <textarea name="descripcion" id="descripcion">${producto.descripcion}</textarea>
                </div>
                
            </fieldset>
            <c:if test="${not empty mensaje}">
                <h4 class="mensaje form_mensaje form_mensaje-producto">${mensaje}</h4>
            </c:if>
            
           <!-- Campo oculto para la acción -->
            <input type="hidden" name="action" value="buscar" id="actionField">
            <input type="hidden" name="codigoProducto" value="${producto.codigoProducto}">
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
    <script src="JS/gProductos.js"></script>
    
</body>
</html>
