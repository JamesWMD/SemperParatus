<%@page import="Modelos.Usuarios"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<%
    HttpSession sessionUser = request.getSession(false);
    Usuarios usuario = (sessionUser != null) ? (Usuarios) sessionUser.getAttribute("usuario") : null;

    if (usuario == null) {
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
    <link rel="stylesheet" href="CSS/f_ventas.css">
    <link rel="stylesheet" href="CSS/productos.css">
    <link rel="stylesheet" href="CSS/usuario.css">
    <title>Panel Pricipal</title>
</head>
<body class="grid">
    <header class="header">
        <div class="header__logo">
            <img class="header__logo-image" src="IMG/LogoNombre SP.png" alt="Logo Semper Paratus">
        </div>

        <div class="header__dropdown-container">
            <h2>Bienvenido(a), <span id="nombre-usuario"><%= usuario.getNombreUsuario() %></span></h2>
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
        
        <h1> ESTAS EN EL PANEL PRINCIPAL</h1>

             <!-- Submenu del modulos Comercial -->
        <div class="main-menu__container" id="menu-container-comercial">
            <div class="main-menu__item" id="menu-item-factura-venta">
                <a href="ventas.jsp" class="main-menu__link">
                    <button class="main-menu__button main-menu__button--factura-venta">Factura de Venta</button>
                </a>
            </div>
            <div class="main-menu__item" id="menu-item-factura-compra">
                <a href="ventas.jsp" class="main-menu__link">
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
        
        <!-- FORMULARIO DE FACTURA DE VENTA -->
<!--
        <form class=" form form__facVenta" action="" method="">
            <div class="tittle">
                <img src="IMG/factura.png" alt="" srcset="">
                <H2 class="form_tittle" >FACTURA DE VENTA</H2>
            </div>
            
            <h4 class="form_mensaje form_mensaje-facVentas">Gestiona el formulario</h4>
            <section>
                <fieldset class="form__fields form__fields--factura">
                    <legend class="form__legend">Información de factura</legend>
                    <div class="form__field">
                        <label for="noFactura" class="form__label">No. Factura</label>
                        <input type="text" name="noFactura" id="noFactura" class="form__input form__input--noFactura">
                    </div>
                    <div class="form__field">
                        <label for="emision" class="form__label">Emisión</label>
                        <input type="date" name="emision" id="emision" class="form__input form__input--emision">
                    </div>
                    <div class="form__field">
                        <label for="estado" class="form__label">Estado</label>
                        <input type="text" name="estado" id="estado" class="form__input form__input--estado">
                    </div>
                </fieldset>


                <!-- Botones -->
               <!-- <fieldset class="form__actions form__actions--botones">
                    <legend class="form__legend">Botones</legend>
                    <div class="button-container">
                        <p class="form__text" for="">Producto</p>
                        <button onclick="" class="form__button">
                            <img src="IMG/caja-de-entrega.png" alt="Guardar datos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Clientes</p>
                        <button onclick="" class="form__button">
                            <img src="IMG/cliente.png" alt="Guardar datos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Nuevo</p>
                        <button onclick="" class="form__button">
                            <img src="IMG/nuevo-documento.png" alt="Guardar datos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Limpiar</p>
                        <button onclick="" class="form__button">
                            <img src="IMG/limpieza-de-datos.png" alt="Guardar datos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Modificar</p>
                        <button onclick="" class="form__button">
                            <img src="IMG/Modificar.png" alt="Guardar datos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Guardar</p>
                        <button onclick="" class="form__button">
                            <img src="IMG/guardar-datos.png" alt="Guardar datos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Anular</p>
                        <button onclick="" class="form__button">
                            <img src="IMG/desactivar.png" alt="Guardar datos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Eliminar</p>
                        <button onclick="" class="form__button">
                            <img src="IMG/basura.png" alt="Guardar datos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Imprimir</p>
                        <button onclick="" class="form__button">
                            <img src="IMG/impresora.png" alt="Guardar datos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Cerrar</p>
                        <button class="form__button form__button-cerrar" onclick="cerrarFormularioFactVentas()">
                            <img src="IMG/cerrar.png" alt="Guardar datos">
                        </button>
                    </div>
                </fieldset>
            </section>

            <!-- Datos del cliente -->
           <!-- <fieldset class="form__fields form__fields--clientes">
                <legend class="form__legend">Datos del Cliente</legend>
                <div class="form__field--cliente">
                    <label for="identificacion" class="form__label">T. Doc.</label>
                    <select name="" id="" class="">
                        <option value1="">CC</option>
                        <option value2="">CE</option>
                        <option value3="">NIT</option>
                        <option value3="">TI</option>
                        <option value5="">TE</option>
                        <option value6="">PPT</option>
                        <option value7="">RCN</option>
                        <option value8="">PEP</option>
                        <option value9="">PTP</option>
                        <option value10="">NIP</option>
                        <option value11="">RUT</option>
                    </select>  
                </div>
            
                <div class="form__field--cliente form__field--cliente-identificacion">
                    <label for="identificacion" class="form__label">No. Ident.</label>
                    <input type="text" name="identificacion" id="identificacion" class="form__input--cliente formatear form__input--identificacion">
                </div>
                <div class="form__field--cliente form__field--cliente-nombreRazonSocial">
                    <label for="nombreRazonSocial" class="form__label">Nombres o Razon social</label>
                    <input type="text" name="nombreRazonSocial" id="nombreRazonSocial" class="form__input--cliente form__input--nombre-razon_social">
                </div>
                <div class="form__field--cliente form__field--cliente-apellidosNombreComercial">
                    <label for="apellidosNombreComercial" class="form__label">Apellidos o N. Comercial</label>
                    <input type="text" name="apellidosNombreComercial" id="apellidosNombreComercial" class="form__input--cliente form__input--apellidos-nombre_comercial">
                </div>
                <div class="form__field--cliente form__field--cliente-telefono">
                    <label for="telefono" class="form__label">Telefono</label>
                    <input type="text" name="telefono" id="telefono" class="form__input--cliente form__input--telefono">
                </div>
                <div class="form__field--cliente form__field--cliente-direccion">
                    <label for="direccion" class="form__label">Direccion</label>
                    <input type="text" name="direccion" id="direccion" class="form__input--cliente form__input--direccion">
                </div>
            </fieldset>

            <!-- Informacion de ventas -->
            <!--<fieldset class="form__fields form__fields--infoVentas">
                <legend class="form__legend">Información de la Venta</legend>
                <div class="form__field--infoVenta form__field--infoVenta-condicionPago">
                    <label for="identificacion" class="form__label">Cond. de Pago</label>
                    <select name="" id="" class="">
                        <option value1="">Contado</option>
                        <option value2="">Credito</option>
                    </select>  
                </div>
            
                <div class="form__field--infoVenta form__field--infoVenta-metodoEntrega">
                    <label for="identificacion" class="form__label">Metodo de entrega.</label>
                    <select name="" id="" class="">
                        <option value1="">Domicilio</option>
                        <option value2="">Retiro en Tienda</option>
                    </select>  
                </div>
                <div class="form__field--infoVenta form__field--infoVenta-metodoPago">
                    <label for="nombreRazonSocial" class="form__label">Medodo de pago</label>
                    <select name="" id="" class="">
                        <option value1="">Efectivo</option>
                        <option value2="">Transferencia</option>
                        <option value3="">Tarjeta</option>
                    </select>  
                </div>
                <div class="form__field--infoVenta form__field--infoVenta-entidadPago">
                    <label for="apellidosNombreComercial" class="form__label">Entidad de Pago</label>
                    <select name="" id="" class="">
                        <option value1="">Caja</option>
                        <option value2="">Nequi</option>
                        <option value3="">Daviplata</option>
                        <option value4="">Bancolombia</option>
                    </select>  
                </div>
            </fieldset>

            <!-- Detalle de Productos -->
           <!-- <fieldset class="form__fields form__fields--productos">
                <legend class="form__legend">Detalle de Productos</legend>
                <div class="form__field--producto form__field--producto-codigo">
                    <label for="codigo" class="form__label">Cod. Prod</label>
                    <input type="text" name="codigo" id="fCodigo" class="form__input--producto form__input--codigo">
                </div>
                <div class="form__field--producto form__field--producto-nombreProducto">
                    <label for="nombreProducto" class="form__label">Nombre del Producto</label>
                    <input type="text" name="nombreProducto" id="fNombreProducto" class="form__input--producto form__input--nombreProducto">
                </div>
                <div class="form__field--producto form__field--producto-categoria">
                    <label for="categoria" class="form__label">Categoria</label>
                    <input type="text" name="categoria" id="fCategoria" class="form__input--producto form__input--categoria">
                </div>
                <div class="form__field--producto form__field--producto-cantidad">
                    <label for="cantidad" class="form__label">Cant.</label>
                    <input type="text" name="cantidad" id="cantidad" class="form__input--producto formatear form__input--cantidad" >
                </div>
                <div class="form__field--producto form__field--producto-precio">
                    <label for="precio" class="form__label">Precio</label>
                    <input type="text" name="precio" id="fPrecio" class="form__input--producto formatear form__input--precio">
                </div>
                <div class="form__field--producto form__field--producto-descuento">
                    <label for="descuento" class="form__label">Descuento</label>
                    <input type="text" name="descuento" id="descuento" class="form__input--producto formatear  form__input--descuento">
                </div>
                <div class="form__field--producto form__field--producto-subtotal">
                    <label for="subtotal" class="form__label">Subtotal</label>
                    <input type="text" name="subtotal" id="subtotal" class="form__input--producto formatear form__input--subtotal" readonly>
                </div>
            </fieldset>
            <section class="factura">
                <div class="factura__productos">
                    <!-- Tabla de productos -->
                    <!--<div class="tabla-contenedora">
                        <table class="factura__tabla-productos" id="tabla-productos">
                            <thead>
                                <tr>
                                    <th class="factura__tabla-productos-codigo">Código</th>
                                    <th class="factura__tabla-productos-nombre">Productos</th>
                                    <th class="factura__tabla-productos-categoria">Categorías</th>
                                    <th class="factura__tabla-productos-cantidad">Cant.</th>
                                    <th class="factura__tabla-productos-vunit">V. Unid.</th>
                                    <th class="factura__tabla-productos-descuento">Desc.</th>
                                    <th class="factura__tabla-productos-subtotal">Subtotal</th>
                                </tr>
                            </thead>
                            <tbody>
    
                            </tbody>
                        </table>
                    </div>
                    <div class="factura__observaciones">
                        <label for="observaciones" class="factura__label">Observaciones</label>
                        <textarea name="observaciones" id="observaciones" class="factura__textarea"></textarea>
                    </div>
                </div>
                <div class="factura__botones">
                    <fieldset class="factura__fieldset">
                        <legend class="form__legend">Botones</legend>
                        <div class="button-container">
                            <p class="form__text" for="">Agregar Producto</p>
                            <button class="form__button" id="agregarProducto">
                                <img src="IMG/agregar-producto.png" alt="">
                            </button>
                        </div>
                        <div class="button-container">
                            <p class="form__text" for="">Eliminar Productos</p>
                            <button  class="form__button" id="eliminarProducto">
                                <img src="IMG/eliminar-producto.png" alt="">
                            </button>
                        </div>
                    </fieldset>

                    <!-- Tabla de Totales -->
                   <!-- <table class="tablaTotales" id="tabla-totales">
                        <tr id="fila-subtotal" class="fila-totales">
                            <td><strong>Subtotal:</strong></td>
                            <td id="subtotal-total">$0.00</td>
                        </tr>
                        <tr id="fila-descuento" class="fila-totales">
                            <td><strong>Descuento:</strong></td>
                            <td id="descuento-total">$0.00</td>
                        </tr>
                        <tr id="fila-iva" class="fila-totales">
                            <td><strong>IVA (19%):</strong></td>
                            <td id="iva-total">$0.00</td>
                        </tr>
                        <tr id="fila-rete-fuente" class="fila-totales">
                            <td><strong>Rete-Fuente:</strong></td>
                            <td id="rete-fuente-total">$0.00</td>
                        </tr>
                        <tr id="fila-rete-ica" class="fila-totales">
                            <td><strong>Rete-ICA:</strong></td>
                            <td id="rete-ica-total">$0.00</td>
                        </tr>
                        <tr id="fila-anticipo" class="fila-totales">
                            <td><strong>Anticipo:</strong></td>
                            <td id="anticipo-total">$0.00</td>
                        </tr>
                        <tr id="fila-total-factura" class="fila-totales">
                            <td><strong>Total Factura:</strong></td>
                            <td id="total-factura">$0.00</td>
                        </tr>
                        <tr id="fila-total-pagar" class="fila-totales total">
                            <td><strong>Total a pagar:</strong></td>
                            <td id="total-pagar">$0.00</td>
                        </tr>
                    </table>
                    
                </div>
            </section>            
        </form> -->

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
