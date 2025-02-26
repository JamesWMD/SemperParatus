//--FORMATO DE SEPARACION DE MILES--
const inputs = document.querySelectorAll('.formatear');

inputs.forEach(input => {
    input.addEventListener('input', () => {
        // Eliminar caracteres no numéricos
        let valor = input.value.replace(/[^0-9.]/g, '').replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ",");

        // Asegurarse de que solo hay un punto decimal
        if (valor.split(',').length > 2) {
            valor = valor.replace(/\.+$/, ''); // Elimina puntos adicionales al final
        }

        // Separar la parte entera y la decimal
        let [entero, decimal] = valor.split('.');

        // Formatear la parte entera con separadores de miles
        if (entero) {
            entero = entero.replace(/\B(?=(\d{3})+(?!\d)\.?)/g, ".");
        }

        // Limitar los decimales a dos dígitos
        if (decimal) {
            decimal = decimal.substring(0, 2);
        }

        // Reconstruir el valor formateado
        input.value = decimal !== undefined ? `${entero}.${decimal}` : entero;
    
    });

});

