//FORMULARIO GESTION DE PRODUCTOS: Abrir y cerrar Formulario

// Selección del botón "Productos" y el formulario de gestión de productos
const botonProductos = document.querySelector('.main-menu__button--productos');
const formularioProductos = document.querySelector('.form__gestion-productos');

// Evento para mostrar el formulario al hacer clic en el botón
botonProductos.addEventListener('click', (event) => {
    event.preventDefault(); // Evitar que la página se recargue
    formularioProductos.style.display = 'flex'; // Mostrar el formulario
});

// Función para cerrar el formulario
function cerrarFormularioProducto() {
    formularioProductos.style.display = 'none'; // Ocultar el formulario
}

