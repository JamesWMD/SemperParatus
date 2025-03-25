fetch("http://localhost:8080/SemperParatus/ventas/siguiente-id")
    .then(response => response.json())
    .then(data => {
        document.getElementById("idVentasInput").value = data.siguienteId;
    })
    .catch(error => console.error("Error al obtener el ID de ventas:", error));



