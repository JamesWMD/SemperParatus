<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Este es un Software ERP desarrollado por aprendices SENA de Curso Tecnologo en análisis y desarrollo de software Ficha 2758277">
    <meta name="keywords" content="Factura de Ventas, Factura de Compra, Pedido, cotización, Recibo de Caja, Egresos, Informes, Gestión de Clientes, Gestión de Proveedores, Gestión de empleados, Gestión de puntos de venta, Gestión de Usuarios">
    <meta name="author" content="James William Montenegro Daza y Laura Yoana Medina Gonzales">
    <meta name="robots" content="nosnipper, noarchive">
    <link rel="stylesheet" href="CSS/login.css">
    <link rel="stylesheet" href="CSS/usuario.css">
    <title>Semper Paratus</title>
    <link rel="icon" href="/IMG/Icon Semper Paratus Oscuro.png">
</head>
<body>
    <div class="page">
        <header class="header">
            <div class="header__logo">
                <img class="header__logo-image" src="IMG/LogoNombre SP.png" alt="Logo Semper Paratus">
            </div>
            <nav class="header__nav">
                <!-- <a class="header__link header__link--home" href="index.html">Home</a> -->
                <!-- <a class="header__link header__link--register" href="#">Regístrate</a> -->
            </nav>
        </header>
        <main class="main-content">

            <!-- INICIO DE SESION -->
            <div class="login">
                <img class="login__logo" src="IMG/Logo Semper Paratus Oscuro.png" alt="Logo Semper Paratus">
                <h2 class="login__title">SEMPER PARATUS</h2>
                <p class="login__text">¿No te has registrado? 
                    <a class="login__link" href="#">Regístrate</a>
                </p>
                <form class="login__form" action="AccesoRegistroServlet" method="POST" autocomplete="off">
                    <!-- Campo oculto para especificar la acción -->
                    <input type="hidden" name="action" value="login">
                    
                    <div class="login__field login__field--user">
                        <div class="login__icon login__icon--user">
                            <img class="login__icon-image login__icon-image--user" src="IMG/carne-de-identidad.png" alt="">
                        </div>
                        <input class="login__input login__input--user" type="text" name="usuario" placeholder="No. Identificacion">
                    </div>
                    <div class="login__field login__field--password">
                        <div class="login__icon login__icon--password">
                            <img class="login__icon-image login__icon-image--password" src="IMG/llave-de-casa.png" alt="">
                        </div>
                        <div>
                            <input class="login__input login__input--password" id="password" type="password" name="password" placeholder="Contraseña">
                            <img src="IMG/ojo-cerrado (1).png" alt="Ver contraseña" class="form__icon" onclick="togglePassword()">
                        </div>                        
                    </div>
                    
                    
                    <button type="submit" class="login__button">Inicia Sesion</button>
                        <%-- Mostrar mensaje de error si existe --%>
                        <% String mensaje = (String) request.getAttribute("mensaje"); %>
                        <% if (mensaje != null) { %>
                        <div class="contenedor-mensaje">
            
                            <h4 class="mensaje">Usuario no autorizado</h4>
                            
                        </div>
                        <% } %>
                    
                </form>                
            </div>  
            
            <!-- REGISTRO -->
            <div class="registro">
                <img class="registro__logo" src="IMG/Logo Semper Paratus Oscuro.png" alt="Logo Semper Paratus">
                <h2 class="registro__title">SEMPER PARATUS</h2>
                <p class="registro__text">¿Ya estas registrado? 
                    <a class="registro__link" href="#">Inicia Sesion</a>
                </p>
                <div>
                </div>
                <form class="registro__form" action="AccesoRegistroServlet" method="POST" autocomplete="off">
                    <!-- Campo oculto para especificar la acción -->
                    <input type="hidden" name="action" value="registro">
                    
                    <div class="registro__field registro__field--noIdentificacion">
                        <div class="registro__icon registro__icon--noIdentificacion">
                            <img class="registro__icon-image registro__icon-image--noIdentificacion" src="IMG/carne-de-identidad.png" alt="">
                        </div>
                        <input class="registro__input registro__input--noIdentificacion" id="noIdentificacion" type="text" name="noIdentificacion" placeholder="No. Identificacion">
                    </div>

                    <div class="registro__field registro__field--nombreUsuario">
                        <div class="registro__icon login__icon--nombreUsuario">
                            <img class="registro__icon-image resgitro__icon-image--nombreUsuario" src="IMG/perfil.png" alt="">
                        </div>
                        <input class="registro__input registro__input--nombreUsuario"  type="text" name="nombreUsuario" placeholder="Nombres y Apellidos">
                    </div>

                    <div class="registro__field registro__field--password">
                        <div class="registro__icon registro__icon--password">
                            <img class="registro__icon-image registro__icon-image--password" src="IMG/llave-de-casa.png" alt="">
                        </div>
                        <input class="registro__input registro__input--password" id="password" type="password" name="passwordRegistro" placeholder="Contraseña" >
                        <img src="IMG/ojo-cerrado (1).png" alt="Ver contraseña" class="form__icon-registro" onclick="">
                    </div>
                    
                    <div class="registro__field registro__field--repet-password">
                        <div class="registro__icon registro__icon--repet-password">
                            <img class="registro__icon-image registro__icon-image--password" src="IMG/llave-de-la-puerta.png" alt="">
                        </div>
                        <input class="registro__input registro__input--repet-password" id="repet-password" type="password" name="repetPassword" placeholder="Confirma la contraseña" >
                        <img src="IMG/ojo-cerrado (1).png" alt="Ver contraseña" class="form__icon-registro" onclick="">
                    </div>
                    
                    <button type="submit" class="registro__button">Registrarse</button>
                </form>                
            </div>  
        </main>
        <footer class="footer">
            <div>
                <p class="footer__text">© 2024 SEMPER PARATUS.</p>
                <p class="footer__text">Todos los derechos reservados.</p>
            </div>
            
            <p class="footer__text">Semper Paratus v1.0.0</p>
            <p class="footer__links">
                <a class="footer__link" href="#">Soporte</a> | 
                <a class="footer__link" href="#">Manual de Usuario</a> | 
                <a class="footer__link" href="#">Política de Privacidad</a>
            </p>
        </footer>
    </div>

    <script src="JS/scripts.js"></script>
    <script src="JS/registro.js"></script>
</body>
</html>
