document.addEventListener('DOMContentLoaded', () => {
    // Obtener todos los botones de navegación y sus contenedores asociados
    const navigationButtons = document.querySelectorAll('.navigation__button');
    const menuContainers = document.querySelectorAll('.main-menu__container');
    const mainMenuButtons = document.querySelectorAll('.main-menu__button');

    // Función para manejar clics en los botones de navegación
    const handleNavigationClick = (event) => {
        // Deshabilitar todos los botones de navegación y restablecer el color
        navigationButtons.forEach(button => {
            button.disabled = false;
            button.style.backgroundColor = ''; // Restablece el color por defecto
            button.style.fontWeight = ''; // Restablece el peso de la fuente
        });

        // Ocultar todos los contenedores
        menuContainers.forEach(container => {
            container.style.display = 'none';
        });

        // Cambiar el color y deshabilitar el botón clickeado
        const clickedButton = event.target;
        clickedButton.style.backgroundColor = '#D6F5A8';
        clickedButton.style.fontWeight = 'bold'; // Cambia a negrita
        clickedButton.disabled = true;

        // Mostrar el contenedor correspondiente al botón clickeado
        const buttonId = clickedButton.closest('.navigation__button-item').id;
        const correspondingContainerId = buttonId.replace('button-', 'menu-container-');
        const correspondingContainer = document.getElementById(correspondingContainerId);
        if (correspondingContainer) {
            correspondingContainer.style.display = 'flex';
        }
    };

    // Función para manejar clics en los botones del menú principal
    const handleMainMenuClick = (event) => {
        // Restablecer el color de todos los botones del menú principal
        mainMenuButtons.forEach(button => {
            button.style.backgroundColor = ''; // Restablece el color por defecto
        });

        // Cambiar el color del botón clickeado
        const clickedButton = event.target;
        clickedButton.style.backgroundColor = '#D6F5A8';
        clickedButton.style.fontWeight = 'bold'; // Cambia a negrita
    };

    // Agregar eventos de clic a los botones de navegación
    navigationButtons.forEach(button => {
        button.addEventListener('click', handleNavigationClick);
    });

    // Agregar eventos de clic a los botones del menú principal
    mainMenuButtons.forEach(button => {
        button.addEventListener('click', handleMainMenuClick);
    });
});


