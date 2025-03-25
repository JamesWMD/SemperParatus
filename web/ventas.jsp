<%@page import="Modelos.Usuarios"%>
<%@page import="javax.servlet.http.HttpSession" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="CSS/panelPrincipalVentas.css">
    <link rel="stylesheet" href="CSS/ventas.css">
    
    <title>Factura de ventas</title>
    
<!-- Estilos del Modal -->
<style>
    .modal {
        display: none;
        position: fixed;
        z-index: 1000;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0, 0, 0, 0.5);
        justify-content: center;
        align-items: center;
    }

    .modal-content {
        background-color: white;
        padding: 20px;
        border-radius: 10px;
        width: 80%;
        max-width: 800px;
        text-align: center;
        position: relative;
    }

    .close {
        position: absolute;
        top: 10px;
        right: 15px;
        font-size: 24px;
        cursor: pointer;
    }
    .tabla-clientes{
        width: 100%; /* Asegura que la tabla ocupe todo el ancho disponible */
        border-collapse: collapse; /* Elimina los espacios entre las celdas */
        margin: auto;
    }
    .tabla-clientes th, 
    .tabla-clientes td {
        text-align: center;
        border: 1px solid #ccc;
        padding: 2px 5px;
        height: 25px;
        font-size: 12px;
    }
    
    .tabla-clientes td {
        background-color: #fff;
    }
    
    .tabla-clientes thead th {
        position: sticky; /* Hace que los encabezados sean "pegajosos" */
        top: 0; /* Mantiene los encabezados en la parte superior durante el scroll */
        background-color: #f7ed9b; /* Color de fondo para el encabezado */
        z-index: 1; /* Asegura que los encabezados estén por encima de las filas */

    }
        
    .icon_button-tabla{
        width: 15px;
    }
    
    .tabla-contenedora-clientes {
        max-height: 350px; /* Define la altura máxima para la tabla */
        overflow-y: auto; /* Permite el desplazamiento vertical */

    }
    .tituloTabla{
        margin-bottom: 20px;
        font-size: 40px;
    }
    
/*    MODAL TABLA PRODUCTOS*/
.tabla-contenedora-productos {
    margin-top: 20px;
    max-height: 400px;
    overflow-y: auto;
}

.tabla-productos {
    width: 100%;
    border-collapse: collapse;
}

.tabla-productos th, .tabla-productos td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

.tabla-productos th {
    background-color: #4CAF50;
    color: white;
}

.tabla-productos tbody tr:hover {
    background-color: #f1f1f1;
    cursor: pointer;
}
/* Estilos para el modal */
.modal {
    display: none;
    position: fixed;
    z-index: 1000;
    left: 0;
    top: 0;
    width: 100%;
    height: 100%;
    background-color: rgba(0, 0, 0, 0.5);
    justify-content: center;
    align-items: center;
}

.modal-content {
    background-color: #fff;
    padding: 20px;
    border-radius: 10px;
    width: 60%;
    max-height: 80%;
    overflow-y: auto;
    text-align: center;
}

.close {
    color: #aaa;
    float: right;
    font-size: 28px;
    font-weight: bold;
    cursor: pointer;
}

.close:hover {
    color: black;
}

/* Tabla de productos */
.tabla-contenedora-productos {
    margin-top: 20px;
    max-height: 400px;
    overflow-y: auto;
}

.tabla-productos {
    width: 100%;
    border-collapse: collapse;
}

.tabla-productos th, .tabla-productos td {
    border: 1px solid #ddd;
    padding: 10px;
    text-align: center;
}

.tabla-productos th {
    background-color: #4CAF50;
    color: white;
}

.tabla-productos tbody tr:hover {
    background-color: #f1f1f1;
    cursor: pointer;
}
    
    

</style>
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
        <div class="main-menu__container main-menu__container-comercial" id="menu-container-comercial">
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

 <!-- FORMULARIO DE FACTURA DE VENTA -->

        <form class=" form form__ventas" action="VentasServlet" method="POST">
            <div class="tittle">
                <img src="IMG/factura.png" alt="" srcset="">
                <H2 class="form_tittle" >FACTURA DE VENTA</H2>
            </div>
            
            <input type="hidden" name="action" value="listarClientes">
            
            <c:if test="${not empty mensaje}">
                <h4 class="mensaje form_mensaje form_mensaje-usuario">${mensaje}</h4>
            </c:if>
            <section>
                <fieldset class="form__fields form__fields--factura">
                    <legend class="form__legend">Información de factura</legend>
                    <div class="form__field">
                        <label for="noFactura" class="form__label">No. Factura</label>
                        <input type="text" name="noFactura" id="noFactura" class="form__input form__input--noFactura">
                    </div>
                    <div class="form__field">
                        <label for="emision" class="form__label">Emisión</label>
                        <input type="date" name="emision" id="emision" class="form__input form__input--emision" value="<%= request.getAttribute("fechaEmision") %>" required>
                    </div>
                    <div class="form__field">
                        <label for="estado" class="form__label" id="estado-venta">Estado</label>
                        <select name="estado" id="estado" class="">
                            <option value="Pendiente" ${venta.estado == 'Pendiente' ? 'selected' : ''}>Pendiente</option>
                            <option value="Pagada" ${venta.estado == 'Pagada' ? 'selected' : ''}>Pagada</option>
                            <option value="Parcialmente " ${venta.estado == 'Parcialmente ' ? 'selected' : ''}>Parcialmente</option>
                            <option value="Vencida" ${venta.estado == 'Vencida' ? 'selected' : ''}>Vencida</option>
                            <option value="Anulada" ${venta.estado == 'Anulada' ? 'selected' : ''}>Anulada</option>
                            <option value="En Proceso" ${venta.estado == 'En Proceso' ? 'selected' : ''}>En Proceso</option>
                            <option value="Rechazada" ${venta.estado == 'Rechazada' ? 'selected' : ''}>Rechazada</option>
                            <option value="Emitida" ${venta.estado == 'Emitida' ? 'selected' : ''}>Emitida</option>
                            <option value="Devuelta" ${venta.estado == 'Devuelta' ? 'selected' : ''}>Devuelta</option>
                        </select>  
                    </div>
                </fieldset>


                <!-- Botones -->
                <fieldset class="form__actions form__actions--botones">
                    <legend class="form__legend">Botones</legend>
                    <div class="button-container">
                        <p class="form__text" for="">Listas de Productos</p>
                        <button type="button" class="form__button" id="openModalProducto" onclick="listarProductos()">
                            <img src="IMG/listarProductos.png" alt="Productos">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text">Lista de Clientes</p>
                        <button type="button" class="form__button" id="openModalCliente" onclick="listarClientes()">
                            <img src="IMG/ListarPersona.png" alt="listarClientes">
                        </button>
                    </div>

                    <div class="button-container">
                        <p class="form__text" for="">Nuevo</p>
                        <button type="submit" class="form__button">
                            <img src="IMG/nuevo-documento.png" alt="Nuevo Formulario">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Limpiar</p>
                        <button type="submit" class="form__button">
                            <img src="IMG/limpieza-de-datos.png" alt="Limpiar formulario">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Modificar</p>
                        <button type="submit" class="form__button">
                            <img src="IMG/Modificar.png" alt="Modificar Venta">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Guardar</p>
                        <button type="submit" id="btnGuardarVenta" class="form__button" name="action" value="insertarVenta">
                            <img src="IMG/guardar-datos.png" alt="Guardar Ventas">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Anular</p>
                        <button type="submit" class="form__button">
                            <img src="IMG/desactivar.png" alt="Anular Venta">
                        </button>
                    </div>
                    
                    <div class="button-container">
                        <p class="form__text" for="">Imprimir</p>
                        <button type="submit" class="form__button">
                            <img src="IMG/impresora.png" alt="Imprimir Factura">
                        </button>
                    </div>
                    <div class="button-container">
                        <p class="form__text" for="">Cerrar Formulario</p>
                        <button type="submit" name="action" class="form__button form__button-cerrar" value="cerrar">
                            <img src="IMG/cerrar.png" alt="cerrar fomulario">
                        </button>
                    </div>
                </fieldset>
            </section>
                 
            <!-- Datos del cliente -->
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
                <section class="form__field--cliente form__field--cliente-identificacion">
                    <label for="idCliente" class="form__label">No. Ident.</label>
                    <input type="text" name="idCliente" id="idCliente" class="form__input--cliente form__input--identificacion" value="${cliente.idCliente}" autocomplete="off">
                </section>
                
                <!-- Acción Buscar Cliente -->
                <section class="button-container button-container_buscarcliente">
                    <p class="form__text" for="">Buscar Cliente</p>
                    <button type="submit" name="action" class="form__button" id="buscarBtn" value="buscarCliente">
                        <img src="IMG/buscarUsuarios.png" alt="Buscar Clientes">
                    </button>
                </section>
                
                
                <div class="form__field--cliente form__field--cliente-nombreRazonSocial">
                    <label for="nombreCliente" class="form__label">Nombres o Razon social</label>
                    <input type="text" name="nombreCliente" id="nombreCliente" class="form__input--cliente form__input--nombre-razon_social" value="${cliente.nombreCliente}" autocomplete="off">
                </div>
                <div class="form__field--cliente form__field--cliente-apellidosNombreComercial">
                    <label for="apellidoCliente" class="form__label">Apellidos o N. Comercial</label>
                    <input type="text" name="apellidoCliente" id="apellidoCliente" class="form__input--cliente form__input--apellidos-nombre_comercial" value="${cliente.apellidoCliente}" autocomplete="off">
                </div>
                <div class="form__field--cliente form__field--cliente-telefono">
                    <label for="telefonoCliente" class="form__label">Telefono</label>
                    <input type="text" name="telefonoCliente" id="telefonoCliente" class="form__input--cliente form__input--telefono" value="${cliente.telefonoCliente}" autocomplete="off">
                </div>
                <div class="form__field--cliente form__field--cliente-direccion">
                    <label for="direccionCliente" class="form__label">Direccion</label>
                    <input type="text" name="direccionCliente" id="direccionCliente" class="form__input--cliente form__input--direccion" value="${cliente.direccionCliente}" autocomplete="off">
                </div>
            </fieldset>

            <!-- Informacion de ventas -->
            <fieldset class="form__fields form__fields--infoVentas">
                <legend class="form__legend">Información de la Venta</legend>
                <div class="form__field--infoVenta form__field--infoVenta-condicionPago">
                    <label for="condicionPago" class="form__label">Cond. de Pago</label>
                    <select name="condicionPago" id="condicionPago" class="">
                        <option value="Contado" ${venta.condicionPago == 'Contado' ? 'selected' : ''}>Contado</option>
                        <option value="Credito" ${venta.condicionPago == 'Credito' ? 'selected' : ''}>Credito</option>
                    </select>  
                </div>
            
                <div class="form__field--infoVenta form__field--infoVenta-metodoEntrega">
                    <label for="metodoEntrega" class="form__label">Metodo de entrega.</label>
                    <select name="metodoEntrega" id="metodoEntrega" class="">
                        <option value="Domicilio" ${venta.metodoEntrega == 'Domicilio' ? 'selected' : ''}>Domicilio</option>
                        <option value="Retiro en Tienda" ${venta.metodoEntrega == 'Retiro en Tienda' ? 'selected' : ''}>Retiro en Tienda</option>
                    </select>  
                </div>
                <div class="form__field--infoVenta form__field--infoVenta-metodoPago">
                    <label for="metodoPago" class="form__label">Medodo de pago</label>
                    <select name="metodoPago" id="metodoPago" class="">
                        <option value="Efectivo" ${venta.metodoPago == 'Efectivo' ? 'selected' : ''}>Efectivo</option>
                        <option value="Transferencia" ${venta.metodoPago == 'Transferencia' ? 'selected' : ''}>Transferencia</option>
                        <option value="Tarjeta" ${venta.metodoPago == 'Tarjeta' ? 'selected' : ''}>Tarjeta</option>
                    </select>  
                </div>
                <div class="form__field--infoVenta form__field--infoVenta-entidadPago">
                    <label for="entidadPago" class="form__label">Entidad de Pago</label>
                    <select name="entidadPago" id="entidadPago" class="">
                        <option value="Caja" ${venta.entidadPago == 'Caja' ? 'selected' : ''}>Caja</option>
                        <option value="Nequi" ${venta.entidadPago == 'Nequi' ? 'selected' : ''}>Nequi</option>
                        <option value="Daviplata" ${venta.entidadPago == 'Daviplata' ? 'selected' : ''}>Daviplata</option>
                        <option value="Bancolombia" ${venta.entidadPago == 'Bancolombia' ? 'selected' : ''}>Bancolombia</option>
                    </select>  
                </div>
            </fieldset>

            <!-- Detalle de Productos -->
            <fieldset class="form__fields form__fields--productos">
                <legend class="form__legend">Detalle de Productos</legend>
                <div class="form__field--producto form__field--producto-codigo">
                    <label for="codigoProducto" class="form__label">Cod. Prod</label>
                    <input type="text" name="codigoProducto" id="codigoProducto" class="form__input--producto form__input--codigo" value="${producto.codigoProducto}" autocomplete="off">
                </div>
                
                <!-- Acción Buscar Producto -->
                <div class="button-container button-container_buscarproducto">
                        <p class="form__text" for="">Buscar Producto</p>
                        <button type="summit" name="action"  id="buscarBtnP" class="form__button" value="buscarProducto">
                            <img src="IMG/caja-de-entrega.png" alt="Buscar Producto">
                        </button>
                    </div>
                
                <div class="form__field--producto form__field--producto-nombreProducto">
                    <label for="nombreProducto" class="form__label">Nombre del Producto</label>
                    <input type="text" name="nombreProducto" id="nombreProducto" class="form__input--producto form__input--nombreProducto" value="${producto.nombreProducto}" autocomplete="off">
                </div>
                <div class="form__field--producto form__field--producto-categoria">
                    <label for="categoria" class="form__label">Categoria</label>
                    <input type="text" name="categoria" id="categoria" class="form__input--producto form__input--categoria" value="${producto.categoria}" autocomplete="off">
                </div>
                <div class="form__field--producto form__field--producto-cantidad">
                    <label for="cantidad" class="form__label">Cant.</label>
                    <input type="text" name="cantidad" id="cantidad" class="form__input--producto formatear form__input--cantidad" autocomplete="off">
                </div>
                <div class="form__field--producto form__field--producto-precio">
                    <label for="precio" class="form__label">Precio</label>
                    <input type="text" name="precio" id="precio" class="form__input--producto formatear form__input--precio" value="${producto.precio}" autocomplete="off">
                </div>
                <div class="form__field--producto form__field--producto-descuento">
                    <label for="descuento" class="form__label">Descuento</label>
                    <input type="text" name="descuento" id="descuento" class="form__input--producto  formatear form__input--descuento" autocomplete="off">
                </div>
                <div class="form__field--producto form__field--producto-subtotal">
                    <label for="subtotal" class="form__label">Subtotal</label>
                    <input type="text" name="subtotal" id="subtotal" class="form__input--producto formatear form__input--subtotal" readonly>
                </div>
            </fieldset>
            <section class="factura">
                <div class="factura__productos">
                    <!-- Tabla de productos -->
                    <div class="tabla-contenedora">
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
                    <table class="tablaTotales" id="tabla-totales">
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
                      
                    <!-- Modal Lista de Clientes -->
                    <div id="modalClientes" class="modal">
                        <div class="modal-content">
                            <span class="close" id="closeModalCliente">&times;</span>
                            <h3 class="tituloTabla">Lista de Clientes</h3>

                            <div class="tabla-contenedora-clientes">
                                <table class="tabla-clientes">
                                    <thead>
                                        <tr>
                                            <th class="tabla-cliente-tipoDocumento">T. Doc</th>
                                            <th class="tabla-cliente-idCliente">No. Ident</th>
                                            <th class="tabla-cliente-nombreCliente">Nombres o Razon social</th>
                                            <th class="tabla-cliente-apellidoCliente">Apellidos o N. Comercial</th>
                                            <th class="tabla-cliente-telefonoCliente">Teléfono</th>
                                            <th class="tabla-cliente-codigoProducto">Dirección</th>
                                            <th class="tabla-cliente-direccionCliente">Seleccionar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${clientes}" var="item">
                                            <tr>
                                                <td>${item.tipoDocumento}</td>
                                                <td>${item.idCliente}</td>
                                                <td>${item.nombreCliente}</td>
                                                <td>${item.apellidoCliente}</td>
                                                <td>${item.telefonoCliente}</td>
                                                <td>${item.direccionCliente}</td>
                                                <td>
                                                    <button class="seleccionar-cliente" 
                                                            data-id="${item.idCliente}"
                                                            data-nombre="${item.nombreCliente}" 
                                                            data-apellido="${item.apellidoCliente}"
                                                            data-telefono="${item.telefonoCliente}" 
                                                            data-direccion="${item.direccionCliente}">
                                                        <img class="icon_button-tabla" src="IMG/marca-de-verificacion2.png" alt="Seleccionar Cliente">
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${clientes.size() == 0}">
                                            <tr>
                                                <td colspan="7">No hay Registros</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>
                    
                    <!-- Modal Lista de Productos -->
                    <div id="modalProductos" class="modal">
                        <div class="modal-content">
                            <span class="close" id="closeModalProducto">&times;</span>
                            <h3 class="tituloTabla">Lista de Productos</h3>

                            <form action="VentasServlet" method="POST">
                                <input type="hidden" name="action" value="filtrarProducto">

                                <label>Nombre:</label>
                                <input type="text" name="nombreProducto">

                                <label>Categoría:</label>
                                <select name="categoria">
                                    <option value="">Todas</option>
                                    <option value="Postres">Postres</option>
                                    <option value="Tortas">Tortas</option>
                                </select>

                                <label>Estado:</label>
                                <select name="estado">
                                    <option value="">Todos</option>
                                    <option value="Activo">Activo</option>
                                    <option value="Inactivo">Inactivo</option>
                                </select>

                                <button type="submit">Filtrar</button>
                            </form>

                            <div class="tabla-contenedora-productos">
                                <table class="tabla-productos">
                                    <thead>
                                        <tr>
                                            <th>Codigo</th>
                                            <th>Nombre</th>
                                            <th>Categoría</th>
                                            <th>Precio</th>
                                            <th>Stock</th>
                                            <th>Estado</th>
                                            <th>Seleccionar</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach items="${productos}" var="item">
                                            <tr>
                                                <td>${item.codigoProducto}</td>
                                                <td>${item.nombreProducto}</td>
                                                <td>${item.categoria}</td>
                                                <td>${item.precio}</td>
                                                <td>${item.stock}</td>
                                                <td>${item.estado}</td>
                                                <td>
                                                    <button class="seleccionar-producto" 
                                                            data-codigo="${item.codigoProducto}" 
                                                            data-nombre="${item.nombreProducto}" 
                                                            data-categoria="${item.categoria}" 
                                                            data-precio="${item.precio}">
                                                        <img class="icon_button-tabla" src="IMG/marca-de-verificacion2.png" alt="Seleccionar Producto">
                                                    </button>
                                                </td>
                                            </tr>
                                        </c:forEach>
                                        <c:if test="${productos.size() == 0}">
                                            <tr>
                                                <td colspan="7">No hay Registros</td>
                                            </tr>
                                        </c:if>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                    </div>

                    
                    
 

<!--    <script src="JS/FetchAPI.js"></script>-->
<!--    <script src="JS/usuarios.js"></script>-->
    <script src="JS/ajax.js"></script> 
    <script src="JS/scripts.js"></script>
    <script src="https://code.jquery.com/jquery-3.7.1.min.js"></script>
    <script src="JS/factVentas.js"></script>
    
    <!--    SCRIPT BUSCAR EL CLIENTE SI RECARGAR LA PAGINA-->
    <script>
        $(document).ready(function(){
            $("#buscarBtn").click(function(event){
                event.preventDefault(); // Evita la recarga de la página

                var idCliente = $("#idCliente").val(); // Obtener el valor del input

                if(idCliente.trim() === ""){
                    alert("Debe ingresar el ID del Cliente 2.");
                    return;
                }

                $.ajax({
                    url: "VentasServlet", // La URL del servlet
                    type: "GET", // Método HTTP
                    data: {action: "buscarCliente", idCliente: idCliente}, // Parámetros
                    dataType: "json", // Esperamos JSON como respuesta
                    success: function (response) {
                        if (response.error) {
                            alert(response.error); // Mostrar error si no se encontró
                        } else {
                            // Si el cliente existe, mostramos los datos en la página
                            $('#nombreCliente').val(response.nombreCliente);
                            $('#apellidoCliente').val(response.apellidoCliente);
                            $('#telefonoCliente').val(response.telefonoCliente);
                            $('#direccionCliente').val(response.direccionCliente);
                        }
                    },
                    error: function () {
                        alert("El cliente no exite debe crearlo.");
                    }
                });
            });
        });
    </script>
    <!--    SCRIPT PARA BUSCAR EL PRODUCTO SIN RECARGAR LA PAGINA-->
    <script>
        $(document).ready(function(){
            $("#buscarBtnP").click(function(event){
                event.preventDefault(); // Evita la recarga de la página

                var codigoProducto = $("#codigoProducto").val(); // Obtener el valor del input

                if(codigoProducto.trim() === ""){
                    alert("Debe ingresar el Codigo del producto.");
                    return;
                }

                $.ajax({
                    url: "VentasServlet", // La URL del servlet
                    type: "GET", // Método HTTP
                    data: {action: "buscarProducto", codigoProducto: codigoProducto}, // Parámetros
                    dataType: "json", // Esperamos JSON como respuesta
                    success: function (response) {
                        if (codigoProducto.trim() === null) {
                            alert(response.error); // Mostrar error si no se encontró
                        } else {
                            // Si el producto existe, mostramos los datos en la página
                            $('#nombreProducto').val(response.nombreProducto);
                            $('#categoria').val(response.categoria);
                            $('#precio').val(response.precio);
                        }
                    },
                    error: function () {
                        alert("El producto no existe debe crearlo");
                    }
                });
            });
        });
    </script>
    <!--    SCRIPT PARA CARGAR EL NUMERO DE FACTURA DISPONIBLE-->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            fetch("VentasServlet?action=obtenerNumeroFactura")
                .then(response => response.json())
                .then(data => {
                    document.getElementById("noFactura").value = data.noFactura;
                })
                .catch(error => console.error("Error al obtener el número de factura:", error));
        });
    </script>
    <!--    SCRIPT FECHA AUTOMATICA EN LA FACTURA-->
    <script>
        window.onload = function () {
            let hoy = new Date();
            hoy.setMinutes(hoy.getMinutes() - hoy.getTimezoneOffset()); // Ajusta la zona horaria

            let fechaActual = hoy.toISOString().split("T")[0]; // Formato YYYY-MM-DD
            document.getElementById("emision").value = fechaActual;
        };
    </script>
    <!--    SCRIPT PARA ABRIR Y CERRAR EL MODAL CLIENTES-->
    <script>

        document.addEventListener("DOMContentLoaded", function() {
            const modal = document.getElementById("modalClientes");
            const openModalBtn = document.getElementById("openModalCliente");
            const closeModalBtn = document.getElementById("closeModalCliente");

            // Abrir modal al hacer clic en el botón
            openModalBtn.addEventListener("click", function() {
                modal.style.display = "flex";
            });

            // Cerrar modal al hacer clic en la 'X'
            closeModalBtn.addEventListener("click", function() {
                modal.style.display = "none";
            });

            // Cerrar modal al hacer clic fuera de él
            window.addEventListener("click", function(event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            });

            // Seleccionar cliente y enviarlo al formulario de ventas
            document.querySelectorAll(".seleccionar-cliente").forEach(button => {
                button.addEventListener("click", function() {
                    const idCliente = this.getAttribute("data-id");
                    const nombre = this.getAttribute("data-nombre");
                    const apellido = this.getAttribute("data-apellido");
                    const telefono = this.getAttribute("data-telefono");
                    const direccion = this.getAttribute("data-direccion");

                    // Aquí puedes llenar los campos en tu formulario de ventas
                    document.getElementById("idCliente").value = idCliente;
                    document.getElementById("nombreCliente").value = nombre;
                    document.getElementById("apellidoCliente").value = apellido;
                    document.getElementById("telefonoCliente").value = telefono;
                    document.getElementById("direccionCliente").value = direccion;

                    // Cerrar modal después de seleccionar
                    modal.style.display = "none";
                });
            });
        });
    </script>
    <!--    SCRIPT PARA ABRIR Y CERRAR EL MODAL PRODUSTO-->
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            const modal = document.getElementById("modalProductos");
            const openModalBtn = document.getElementById("openModalProducto");
            const closeModalBtn = document.getElementById("closeModalProducto");

            // Abrir modal al hacer clic en el botón
            openModalBtn.addEventListener("click", function() {
                modal.style.display = "flex";
            });

            // Cerrar modal al hacer clic en la 'X'
            closeModalBtn.addEventListener("click", function() {
                modal.style.display = "none";
            });

            // Cerrar modal al hacer clic fuera de él
            window.addEventListener("click", function(event) {
                if (event.target === modal) {
                    modal.style.display = "none";
                }
            });

            // Seleccionar producto y enviarlo al formulario de ventas
            document.querySelectorAll(".seleccionar-producto").forEach(button => {
                button.addEventListener("click", function() {
                    const codigoProducto = this.getAttribute("data-codigo");
                    const nombreProducto = this.getAttribute("data-nombre");
                    const categoriaProducto = this.getAttribute("data-categoria");
                    const precioProducto = this.getAttribute("data-precio");

                    // Llenar los campos en el formulario de ventas
                    document.getElementById("codigoProducto").value = codigoProducto;
                    document.getElementById("nombreProducto").value = nombreProducto;
                    document.getElementById("categoria").value = categoriaProducto;
                    document.getElementById("precio").value = precioProducto;

                    // Cerrar modal después de seleccionar
                    modal.style.display = "none";
                });
            });
        });
    </script>
<!--    <script>
        function listarClientes() {
            fetch("ClientesServlet?action=listarClientes")
            .then(response => response.text())
            .then(html => {
                document.getElementById("tabla-clientes-body").innerHTML = html;
                document.getElementById("modalClientes").style.display = "flex";
            })
            .catch(error => console.error("Error al cargar los clientes:", error));
        }
    </script>-->

<script>
    document.getElementById("btnGuardarVenta").addEventListener("click", function () {
        
        // Función para limpiar los valores numéricos y convertir comas a puntos
        function limpiarNumero(valor) {
        if (!valor) return "0"; // Si el valor es null o vacío, devolver "0"
        return valor.replace(/[^0-9,.]/g, "") // Eliminar cualquier carácter no numérico excepto punto y coma
                   .replace(".", ",") // Reemplazar coma por punto
                   .trim() || "0"; // Si queda vacío después de limpiar, devolver "0"
    }
        // Obtener valores de la tabla
        let subtotal = document.getElementById("subtotal-total")?.innerText.replace("$", "").trim() || "0";
        let descuento = document.getElementById("descuento-total")?.innerText.replace("$", "").trim() || "0";
        let iva = document.getElementById("iva-total")?.innerText.replace("$", "").trim() || "0";
        let reteFuente = document.getElementById("rete-fuente-total")?.innerText.replace("$", "").trim() || "0";
        let reteIca = document.getElementById("rete-ica-total")?.innerText.replace("$", "").trim() || "0";
        let anticipo = document.getElementById("anticipo-total")?.innerText.replace("$", "").trim() || "0";
        let totalVenta = document.getElementById("total-factura")?.innerText.replace("$", "").trim() || "0";
        let totalPagar = document.getElementById("total-pagar")?.innerText.replace("$", "").trim() || "0";

        // Datos adicionales
        let emision = document.getElementById("emision")?.value || "";
        let estado = document.getElementById("estado")?.value || "";
        let condicionPago = document.getElementById("condicionPago")?.value || "";
        let metodoEntrega = document.getElementById("metodoEntrega")?.value || "";
        let metodoPago = document.getElementById("metodoPago")?.value || "";
        let entidadPago = document.getElementById("entidadPago")?.value || "";
        let observaciones = document.getElementById("observaciones")?.value || "";
        let idCliente = document.getElementById("idCliente")?.value || "";

        // Construir los datos a enviar
        let datos = new URLSearchParams();
        datos.append("emision", emision);
        datos.append("estado", estado);
        datos.append("condicionPago", condicionPago);
        datos.append("metodoEntrega", metodoEntrega);
        datos.append("metodoPago", metodoPago);
        datos.append("entidadPago", entidadPago);
        datos.append("totalSubtotal", subtotal);
        datos.append("iva", iva);
        datos.append("reteFuente", reteFuente);
        datos.append("reteIca", reteIca);
        datos.append("anticipo", anticipo);
        datos.append("totalVenta", totalVenta);
        datos.append("totalDescuento", descuento);
        datos.append("totalPagar", totalPagar);
        datos.append("observaciones", observaciones);
        datos.append("idCliente", idCliente);

        // Verificar qué datos se están enviando
        console.log("Datos enviados:", datos.toString());

        // Enviar la solicitud al Servlet
        fetch("http://localhost:8088/SemperParatus/VentasServlet?action=insertarVenta", { 
            method: "POST",
            headers: { "Content-Type": "application/x-www-form-urlencoded" },
            body: datos
        })
        .then(response => response.json())
        .then(data => {
            alert(data.mensaje); // Muestra el mensaje del Servlet
        })
        .catch(error => console.error("Error al enviar la venta:", error));
    });
    </script>

</body>
</html>