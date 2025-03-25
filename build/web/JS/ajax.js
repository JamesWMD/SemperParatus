document.addEventListener("DOMContentLoaded", function () {
    const btnAgregar = document.getElementById("agregarProducto");
    const btnEliminar = document.getElementById("eliminarProducto");
    const tablaProductos = document.getElementById("tabla-productos").getElementsByTagName("tbody")[0];

    btnAgregar.addEventListener("click", function (event) {
        event.preventDefault();
        agregarProducto();
    });

    btnEliminar.addEventListener("click", function (event) {
        event.preventDefault();
        eliminarProductos();
    });

    function agregarProducto() {
        let codigo = document.getElementById("codigoProducto").value;
        let nombre = document.getElementById("nombreProducto").value;
        let categoria = document.getElementById("categoria").value;
        let cantidad = parseFloat(document.getElementById("cantidad").value) || 0;
        let precio = parseFloat(document.getElementById("precio").value) || 0;
        let descuento = parseFloat(document.getElementById("descuento").value) || 0;
        let subtotal = (cantidad * precio) - descuento;

        if (!codigo || cantidad <= 0 || precio <= 0) {
            alert("Por favor ingrese un producto válido con cantidad y precio.");
            return;
        }

        let row = tablaProductos.insertRow();
        row.innerHTML = `
            <td>${codigo}</td>
            <td>${nombre}</td>
            <td>${categoria}</td>
            <td>${cantidad}</td>
            <td>${precio.toFixed(2)}</td>
            <td>${descuento.toFixed(2)}</td>
            <td>${subtotal.toFixed(2)}</td>
            <td><input type='checkbox' class='select-product'></td>
        `;

        actualizarTotales();
    }

    function eliminarProductos() {
        let checkboxes = document.querySelectorAll(".select-product:checked");
        checkboxes.forEach(checkbox => {
            let row = checkbox.closest("tr");
            row.remove();
        });
        actualizarTotales();
    }

    function actualizarTotales() {
        let subtotal = 0, descuentoTotal = 0;
        document.querySelectorAll("#tabla-productos tbody tr").forEach(row => {
            let cantidad = parseFloat(row.cells[3].innerText) || 0;
            let precio = parseFloat(row.cells[4].innerText) || 0;
            let descuento = parseFloat(row.cells[5].innerText) || 0;
            subtotal += (cantidad * precio) - descuento;
            descuentoTotal += descuento;
        });

        //let iva = subtotal * 0.19;
        //let reteFuente = subtotal * 0.015;
        //let reteICA = subtotal * 0.01;
        //let anticipo = 0;
        //let totalFactura = subtotal + iva - (reteFuente + reteICA + anticipo);
        let totalFactura = subtotal;

        document.getElementById("subtotal-total").innerText = `$${subtotal.toFixed(2)}`;
        document.getElementById("descuento-total").innerText = `$${descuentoTotal.toFixed(2)}`;
        //document.getElementById("iva-total").innerText = `$${iva.toFixed(2)}`;
        //document.getElementById("rete-fuente-total").innerText = `$${reteFuente.toFixed(2)}`;
        //document.getElementById("rete-ica-total").innerText = `$${reteICA.toFixed(2)}`;
        //document.getElementById("anticipo-total").innerText = `$${anticipo.toFixed(2)}`;
        document.getElementById("total-factura").innerText = `$${totalFactura.toFixed(2)}`;
        document.getElementById("total-pagar").innerText = `$${totalFactura.toFixed(2)}`;
    }
});
