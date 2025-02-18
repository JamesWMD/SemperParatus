
package Modelos;

public class Usuarios {
    private int idUsuarios;
    private String noIdentificacion;
    private String nombreUsuario;
    private String password;
    private String estado;

    public Usuarios() {
    }

    public Usuarios(int idUsuarios, String noIdentificacion, String nombreUsuario, String password, String estado) {
        this.idUsuarios = idUsuarios;
        this.noIdentificacion = noIdentificacion;
        this.nombreUsuario = nombreUsuario;
        this.password = password;
        this.estado = estado;
    }

    public Usuarios(String noIdentificacion, String nombreUsuario, String password, String estado) {
        this.noIdentificacion = noIdentificacion;
        this.nombreUsuario = nombreUsuario;
        this.password = password;
        this.estado = estado;
    }

    public int getIdUsuarios() {
        return idUsuarios;
    }

    public void setIdUsuarios(int idUsuarios) {
        this.idUsuarios = idUsuarios;
    }

    public String getNoIdentificacion() {
        return noIdentificacion;
    }

    public void setNoIdentificacion(String noIdentificacion) {
        this.noIdentificacion = noIdentificacion;
    }

    public String getNombreUsuario() {
        return nombreUsuario;
    }

    public void setNombreUsuario(String nombreUsuario) {
        this.nombreUsuario = nombreUsuario;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
}
