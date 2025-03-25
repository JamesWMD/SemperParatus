//SCRIPT BUSCAR EL CLIENTE SI RECARGAR LA PAGINA
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

//SCRIPT PARA BUSCAR EL PRODUCTO SIN RECARGAR LA PAGINA
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

//SCRIPT PARA CARGAR EL NUMERO DE FACTURA DISPONIBLE
document.addEventListener("DOMContentLoaded", function () {
    fetch("VentasServlet?action=obtenerNumeroFactura")
            .then(response => response.json())
            .then(data => {
                document.getElementById("noFactura").value = data.noFactura;
            })
            .catch(error => console.error("Error al obtener el número de factura:", error));
});

//SCRIPT FECHA AUTOMATICA EN LA FACTURA
window.onload = function () {
    let hoy = new Date();
    hoy.setMinutes(hoy.getMinutes() - hoy.getTimezoneOffset()); // Ajusta la zona horaria

    let fechaActual = hoy.toISOString().split("T")[0]; // Formato YYYY-MM-DD
    document.getElementById("emision").value = fechaActual;
};

//SCRIPT PARA ABRIR Y CERRAR EL MODAL
document.addEventListener("DOMContentLoaded", function () {
    const modal = document.getElementById("modalClientes");
    const openModalBtn = document.getElementById("openModalCliente");
    const closeModalBtn = document.getElementById("closeModalCliente");

    // Abrir modal al hacer clic en el botón
    openModalBtn.addEventListener("click", function () {
        modal.style.display = "flex";
    });

    // Cerrar modal al hacer clic en la 'X'
    closeModalBtn.addEventListener("click", function () {
        modal.style.display = "none";
    });

    // Cerrar modal al hacer clic fuera de él
    window.addEventListener("click", function (event) {
        if (event.target === modal) {
            modal.style.display = "none";
        }
    });

    // Seleccionar cliente y enviarlo al formulario de ventas
    document.querySelectorAll(".seleccionar-cliente").forEach(button => {
        button.addEventListener("click", function () {
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

