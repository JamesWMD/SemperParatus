//=============================================FORMULARIO DE GESTION DE USUARIO====================================================

// Seleccionar elementos
const botonMostrarUsuario = document.querySelector('.main-menu__button--usuarios'); // Botón para mostrar el formulario
const formularioUsuario = document.querySelector('.form__usuario'); // Formulario de usuario
const botonCerrarFormulario = formularioUsuario.querySelector('.form__button-cerrar'); // Botón de cerrar dentro del formulario
const mensajeError = formularioUsuario.querySelector('.form__error-message'); // Mensaje de error para contraseñas
const passwordInput = formularioUsuario.querySelector('#password'); // Campo de contraseña
const repeatPasswordInput = formularioUsuario.querySelector('#repet_password'); // Campo de repetir contraseña

// Mostrar el formulario
botonMostrarUsuario.addEventListener('click', (event) => {
  event.preventDefault(); // Evitar que la página se recargue
  formularioUsuario.style.display = 'flex'; // Mostrar el formulario
  botonMostrarUsuario.disabled = true; // Desactivar el botón para evitar múltiples clics
});

// Cerrar el formulario
botonCerrarFormulario.addEventListener('click', () => {
  formularioUsuario.style.display = 'none'; // Ocultar el formulario
  botonMostrarUsuario.disabled = false; // Reactivar el botón
  limpiarErrores(); // Limpiar mensajes de error
});

// Validar contraseñas
function validatePasswords() {
  if (repeatPasswordInput.value === "") {
    mensajeError.textContent = ""; // No mostrar mensaje si está vacío
    repeatPasswordInput.style.border = ""; // Restablecer el estilo del borde
  } else if (passwordInput.value !== repeatPasswordInput.value) {
    mensajeError.textContent = "La contraseña y su confirmación no coinciden."; // Mostrar mensaje de error
    repeatPasswordInput.style.border = "2px solid red"; // Resaltar el campo con borde rojo
  } else {
    mensajeError.textContent = ""; // Limpiar mensaje de error
    repeatPasswordInput.style.border = ""; // Restablecer el estilo del borde
  }
}

// Limpiar mensajes y estilos de error
function limpiarErrores() {
  mensajeError.textContent = ''; // Limpiar mensaje de error
  repeatPasswordInput.style.border = ''; // Restablecer el estilo del borde
  passwordInput.value = ''; // Limpiar campos de contraseña
  repeatPasswordInput.value = ''; // Limpiar campos de repetir contraseña
}

// Alternar visibilidad de las contraseñas
function togglePassword(event) {
  event.preventDefault(); // Evitar el comportamiento por defecto del botón
  const passwordIcon = formularioUsuario.querySelector('.form__icon'); // Icono de la contraseña
  const isPasswordVisible = passwordInput.type === 'password';

  passwordInput.type = isPasswordVisible ? 'text' : 'password'; // Alternar entre texto y contraseña
  repeatPasswordInput.type = isPasswordVisible ? 'text' : 'password';
  passwordIcon.src = isPasswordVisible ? 'IMG/ver.png' : 'IMG/ojo-cerrado (1).png'; // Cambiar icono
}

function buscarUsuario() {
    var idUsuario = document.getElementById("idUsuario").value;

    if (idUsuario.trim() !== "") {
        var xhr = new XMLHttpRequest();
        xhr.open("GET", "UsuariosServlet?action=buscar&idUsuario=" + encodeURIComponent(idUsuario), true);
        xhr.onreadystatechange = function () {
            if (xhr.readyState === 4 && xhr.status === 200) {
                var response = JSON.parse(xhr.responseText);

                if (response.success) {
                    document.getElementById("nombreUsuario").value = response.nombreUsuario;
                    document.getElementById("password").value = response.password;
                    document.getElementById("estado").value = response.estado;
                } else {
                    alert("Usuario no encontrado");
                }
            }
        };
        xhr.send();
    }
}

function limpiarFormulario() {
    document.querySelector('.form__usuario').reset(); // Reinicia los valores del formulario

    // Limpia manualmente los valores de los campos que usan expresiones JSP
    document.getElementById('idUsuario').value = '';
    document.getElementById('nombreUsuario').value = '';
    document.getElementById('password').value = '';
    document.getElementById('repet_password').value = '';
   
}


function buscarUsuario() {
    // Obtener el número de identificación del campo de entrada
    var noIdentificacion = document.getElementById("noIdentificacion").value;

    if (noIdentificacion) {
        // Realizar una solicitud AJAX al servlet
        fetch('UsuariosServlet?action=buscar&noIdentificacion=' + noIdentificacion)
            .then(response => response.json()) // Convertir la respuesta a JSON
            .then(data => {
                if (data.success) {
                    // Llenar los campos del formulario con los datos recibidos
                    document.getElementById("nombreUsuario").value = data.nombreUsuario;
                    document.getElementById("password").value = data.password;
                    document.getElementById("repet_password").value = data.password;
                    document.getElementById("estado").value = data.estado;
                } else {
                    alert("Usuario no encontrado");
                }
            })
            .catch(error => {
                console.error('Error:', error);
                alert("Ocurrió un error al buscar el usuario");
            });
    } else {
        alert("Por favor, ingrese un número de identificación");
    }
    
    document.addEventListener("DOMContentLoaded", function () {
        const tablaUsuarios = document.getElementById("tabla-usuarios");

        tablaUsuarios.addEventListener("click", function (event) {
            let fila = event.target.closest("tr");
            if (fila && fila.parentElement.tagName.toLowerCase() === "tbody") {
                let celdas = fila.getElementsByTagName("td");

                if (celdas.length >= 4) {
                    document.getElementById("noIdentificacion").value = celdas[0].textContent.trim();
                    document.getElementById("nombreUsuario").value = celdas[1].textContent.trim();
                    document.getElementById("password").value = celdas[2].textContent.trim();
                    document.getElementById("repet_password").value = celdas[2].textContent.trim();

                    let estadoSelect = document.querySelector(".form__field--usuario-estado select");
                    estadoSelect.value = celdas[3].textContent.trim();
                }
            }
        });
    });
}

