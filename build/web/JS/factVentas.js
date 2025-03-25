// Formato de número
/*function formatNumber(num) {
    return num.toLocaleString('en-ES', { minimumFractionDigits: 2, maximumFractionDigits: 2 });
}*/

// Selección del botón "Productos" y el formulario de gestión de productos
const botonFactVenta = document.querySelector('.main-menu__button--factura-venta');
const formularioFactVenta = document.querySelector('.form__facVenta');

// Evento para mostrar el formulario al hacer clic en el botón
botonFactVenta.addEventListener('click', (event) => {
    event.preventDefault(); // Evitar que la página se recargue
    formularioFactVenta.style.display = 'flex'; // Mostrar el formulario
});

// Función para cerrar el formulario
function cerrarFormularioFactVentas() {
    formularioFactVenta.style.display = 'none'; // Ocultar el formulario
}

let filaSeleccionada = null; // Variable para almacenar la fila seleccionada

document.getElementById('agregarProducto').addEventListener('click', function (event) {
    event.preventDefault();

    // Obtener valores del formulario
    const codigo = document.getElementById('fCodigo').value.trim();
    const nombreProducto = document.getElementById('fNombreProducto').value.trim();
    const categoria = document.getElementById('fCategoria').value.trim();
    const cantidad = parseFloat(document.getElementById('cantidad').value.replace(/,/g, '')) || 0;
    const precio = parseFloat(document.getElementById('fPrecio').value.replace(/,/g, '')) || 0;
    const descuento = parseFloat(document.getElementById('descuento').value.replace(/,/g, '')) || 0;

    // Calcular subtotal
    const subtotal = (cantidad * precio) - descuento;

    if (cantidad <= 0 || precio <= 0) {
        alert("Por favor, ingrese valores válidos para la cantidad y el precio.");
        return;
    }

    if (filaSeleccionada) {
        // Actualizar la fila seleccionada
        filaSeleccionada.querySelector('.factura__tabla-productos-codigo').textContent = codigo;
        filaSeleccionada.querySelector('.factura__tabla-productos-nombre').textContent = nombreProducto;
        filaSeleccionada.querySelector('.factura__tabla-productos-categoria').textContent = categoria;
        filaSeleccionada.querySelector('.factura__tabla-productos-cantidad').textContent = formatNumber(cantidad);
        filaSeleccionada.querySelector('.factura__tabla-productos-vunit').textContent = formatNumber(precio);
        filaSeleccionada.querySelector('.factura__tabla-productos-descuento').textContent = formatNumber(descuento);
        filaSeleccionada.querySelector('.factura__tabla-productos-subtotal').textContent = formatNumber(subtotal);

        filaSeleccionada.classList.remove('seleccionada'); // Quitar la selección
        filaSeleccionada = null; // Limpiar la variable
    } else {
        // Crear nueva fila
        const nuevaFila = document.createElement('tr');
        nuevaFila.innerHTML = `
            <td class="factura__tabla-productos-codigo">${codigo}</td>
            <td class="factura__tabla-productos-nombre">${nombreProducto}</td>
            <td class="factura__tabla-productos-categoria">${categoria}</td>
            <td class="factura__tabla-productos-cantidad">${formatNumber(cantidad)}</td>
            <td class="factura__tabla-productos-vunit">${formatNumber(precio)}</td>
            <td class="factura__tabla-productos-descuento">${formatNumber(descuento)}</td>
            <td class="factura__tabla-productos-subtotal">${formatNumber(subtotal)}</td>
        `;

        // Agregar evento de selección con un clic
        nuevaFila.addEventListener('click', function () {
            seleccionarProducto(this);
        });

        // Agregar la nueva fila a la tabla
        document.querySelector('#tabla-productos tbody').appendChild(nuevaFila);
    }

    // Actualizar los totales
    actualizarTotales();

    // Limpiar el formulario
    limpiarFormulario();
});

// Función para seleccionar un producto de la tabla
function seleccionarProducto(fila) {
    const codigo = fila.querySelector('.factura__tabla-productos-codigo').textContent.trim();
    const nombreProducto = fila.querySelector('.factura__tabla-productos-nombre').textContent.trim();
    const categoria = fila.querySelector('.factura__tabla-productos-categoria').textContent.trim();
    const cantidad = parseFloat(fila.querySelector('.factura__tabla-productos-cantidad').textContent.replace(/,/g, '')) || 0;
    const precio = parseFloat(fila.querySelector('.factura__tabla-productos-vunit').textContent.replace(/,/g, '')) || 0;

    // Pasar los valores seleccionados a los campos del formulario
    document.getElementById('fCodigo').value = codigo;
    document.getElementById('fNombreProducto').value = nombreProducto;
    document.getElementById('fCategoria').value = categoria;
    document.getElementById('cantidad').value = cantidad;
    document.getElementById('fPrecio').value = precio;

    // Marcar la fila como seleccionada
    if (filaSeleccionada) filaSeleccionada.classList.remove('seleccionada'); // Quitar selección previa
    filaSeleccionada = fila;
    filaSeleccionada.classList.add('seleccionada');
}

// Botón para eliminar producto
document.getElementById('eliminarProducto').addEventListener('click', function (event) {
    // Prevenir que la página se recargue
    event.preventDefault();

    if (filaSeleccionada) {
        // Eliminar la fila seleccionada
        filaSeleccionada.remove();
        // Actualizar los totales después de eliminar el producto
        actualizarTotales();
        filaSeleccionada = null; // Limpiar la selección
    } else {
        alert('Por favor, seleccione un producto para eliminar.');
    }
});

// Limpiar formulario
function limpiarFormulario() {
    document.getElementById('codigo').value = '';
    document.getElementById('nombreProducto').value = '';
    document.getElementById('categoria').value = '';
    document.getElementById('cantidad').value = '';
    document.getElementById('precio').value = '';
    document.getElementById('descuento').value = '';
    document.getElementById('subtotal').value = '';

    if (filaSeleccionada) {
        filaSeleccionada.classList.remove('seleccionada');
        filaSeleccionada = null;
    }
}

// Función para actualizar totales
function actualizarTotales() {
    const filas = document.querySelectorAll('#tabla-productos tbody tr');
    let totalSubtotal = 0;
    let totalDescuento = 0;//n
    

    filas.forEach(fila => {
        const descuento = parseFloat(fila.querySelector('.factura__tabla-productos-descuento').textContent.replace(/,/g, '')) || 0;
        const subtotal = parseFloat(fila.querySelector('.factura__tabla-productos-subtotal').textContent.replace(/,/g, '').replace('$', '')) || 0;
        totalSubtotal += (subtotal + descuento); // Agregar descuento al subtotal total n
        totalDescuento += descuento; // Acumular descuentos n
        // totalSubtotal += subtotal / 1.19;

    });

    const iva = totalSubtotal * 0.19;
    // const totalFactura = totalSubtotal + iva;
    const totalFactura = totalSubtotal - totalDescuento;
    const totalAPagar = totalFactura; //n
    

    document.querySelector('.tablaTotales tr:nth-child(1) td:nth-child(2)').textContent = `$${formatNumber(totalSubtotal)}`;
    // document.querySelector('.tablaTotales tr:nth-child(3) td:nth-child(2)').textContent = `$${formatNumber(iva)}`;
    document.querySelector('.tablaTotales tr:nth-child(7) td:nth-child(2)').textContent = `$${formatNumber(totalFactura)}`;
    document.querySelector('.tablaTotales tr:nth-child(2) td:nth-child(2)').textContent = `$${formatNumber(totalDescuento)}`;
    document.querySelector('.tablaTotales tr.total td:nth-child(2)').textContent = `$${formatNumber(totalAPagar)}`;
}


// FACTURA DE VENTAS (Calcular subtotal automáticamente al cambiar cantidad o precio)
document.getElementById('cantidad').addEventListener('input', calcularSubtotal);
document.getElementById('fPrecio').addEventListener('input', calcularSubtotal);
document.getElementById('descuento').addEventListener('input', calcularSubtotal);

function calcularSubtotal() {
    const cantidad = parseFloat(document.getElementById('cantidad').value.replace(/,/g, '')) || 0;
    const precio = parseFloat(document.getElementById('fPrecio').value.replace(/,/g, '')) || 0;
    const descuento = parseFloat(document.getElementById('descuento').value.replace(/,/g, '')) || 0;

    const subtotal = (cantidad * precio) - descuento;
    document.getElementById('subtotal').value = isNaN(subtotal) ? '' : subtotal.toLocaleString('en-US', {
        minimumFractionDigits: 2,
        maximumFractionDigits: 2
    });
}

//BUSCAR CLIENTE SIN RECARGAR LA PAGINA
$(document).ready(function () {
    $("#buscarBtn").click(function (event) {
        event.preventDefault(); // Evita la recarga de la página

        var idCliente = $("#idCliente").val(); // Obtener el valor del input

        if (idCliente.trim() === "") {
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

//BUSCAR PRODUCTO SIN RECARGAR LA PAGINA
$(document).ready(function () {
    $("#buscarBtnP").click(function (event) {
        event.preventDefault(); // Evita la recarga de la página

        var codigoProducto = $("#codigoProducto").val(); // Obtener el valor del input

        if (codigoProducto.trim() === "") {
            alert("Debe ingresar el Codigo del producto.");
            return;
        }

        $.ajax({
            url: "VentasServlet", // La URL del servlet
            type: "GET", // Método HTTP
            data: {action: "buscarProducto", codigoProducto: codigoProducto}, // Parámetros
            dataType: "json", // Esperamos JSON como respuesta
            success: function (response) {
                if (response.error) {
                    alert(response.error); // Mostrar error si no se encontró
                } else {
                    // Si el cliente existe, mostramos los datos en la página
                    $('#nombreProducto').val(response.nombreProducto);
                    $('#categoria').val(response.categoria);
                    $('#precio').val(response.precio);
                }
            },
            error: function () {
                alert("l producto no existe debe crearlo");
            }
        });
    });
});
