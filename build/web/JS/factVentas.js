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

