<%-- 
    Document   : prueba
    Created on : 26 feb. 2025, 16:56:35
    Author     : JAMES
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="CSS/panelPrincipalVentas.css">
        <link rel="stylesheet" href="CSS/f_ventas.css">
    </head>
    <body>
        <!-- FORMULARIO DE FACTURA DE VENTA -->

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
                <fieldset class="form__actions form__actions--botones">
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
            <fieldset class="form__fields form__fields--clientes">
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
            <fieldset class="form__fields form__fields--infoVentas">
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
            <fieldset class="form__fields form__fields--productos">
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
    </body>
</html>
