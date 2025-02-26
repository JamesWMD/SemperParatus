package Modelos;

public class Clientes {
    private String idCliente;  // Si 'noDocumento' es la clave, usa este nombre para mayor claridad
    private String tipoDocumento;
    private String nombreCliente;
    private String apellidoCliente;
    private String telefonoCliente;
    private String direccionCliente;

    public Clientes() {
    }

    public Clientes(String idCliente, String tipoDocumento, String nombreCliente, String apellidoCliente, String telefonoCliente, String direccionCliente) {
        this.idCliente = idCliente;
        this.tipoDocumento = tipoDocumento;
        this.nombreCliente = nombreCliente;
        this.apellidoCliente = apellidoCliente;
        this.telefonoCliente = telefonoCliente;
        this.direccionCliente = direccionCliente;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        /*if (idCliente == null || idCliente.trim().isEmpty()) {
            throw new IllegalArgumentException("El ID del cliente no puede estar vacío");
        }*/
        this.idCliente = idCliente;
    }

    public String getTipoDocumento() {
        return tipoDocumento;
    }

    public void setTipoDocumento(String tipoDocumento) {
        /*if (tipoDocumento == null || tipoDocumento.trim().isEmpty()) {
            throw new IllegalArgumentException("El tipo de documento no puede estar vacío");
        }*/
        this.tipoDocumento = tipoDocumento;
    }

    public String getNombreCliente() {
        return nombreCliente;
    }

    public void setNombreCliente(String nombreCliente) {
        /*if (nombreCliente == null || nombreCliente.trim().isEmpty()) {
            throw new IllegalArgumentException("El nombre del cliente no puede estar vacío");
        }*/
        this.nombreCliente = nombreCliente;
    }

    public String getApellidoCliente() {
        return apellidoCliente;
    }

    public void setApellidoCliente(String apellidoCliente) {
        /*if (apellidoCliente == null || apellidoCliente.trim().isEmpty()) {
            throw new IllegalArgumentException("El apellido del cliente no puede estar vacío");
        }*/
        this.apellidoCliente = apellidoCliente;
    }

    public String getTelefonoCliente() {
        return telefonoCliente;
    }

    public void setTelefonoCliente(String telefonoCliente) {
        /*if (telefonoCliente == null || telefonoCliente.trim().isEmpty()) {
            throw new IllegalArgumentException("El teléfono del cliente no puede estar vacío");
        }*/
        this.telefonoCliente = telefonoCliente;
    }

    public String getDireccionCliente() {
        return direccionCliente;
    }

    public void setDireccionCliente(String direccionCliente) {
        /*if (direccionCliente == null || direccionCliente.trim().isEmpty()) {
            throw new IllegalArgumentException("La dirección del cliente no puede estar vacía");
        }*/
        this.direccionCliente = direccionCliente;
    }
}
