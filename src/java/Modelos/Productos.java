
package Modelos;

import java.math.BigDecimal;


public class Productos {
    private String codigoProducto;
    private String nombreProducto;
    private String categoria;
    private BigDecimal precio;
    private int stock;
    private String estado;
    private String descripcion;
    
    // Nuevo atributo para el precio formateado
    private String precioFormateado;

    public Productos(String codigoProducto, String nombreProducto, String categoria, BigDecimal precio) {
        this.codigoProducto = codigoProducto;
        this.nombreProducto = nombreProducto;
        this.categoria = categoria;
        this.precio = precio;
    }

    

    public Productos() {
    }

    public Productos(String codigoProducto, String nombreProducto, String categoria, BigDecimal precio, int stock, String estado, String descripcion) {
        this.codigoProducto = codigoProducto;
        this.nombreProducto = nombreProducto;
        this.categoria = categoria;
        this.precio = precio;
        this.stock = stock;
        this.estado = estado;
        this.descripcion = descripcion;
    }

    public String getCodigoProducto() {
        return codigoProducto;
    }

    public void setCodigoProducto(String codigoProducto) {
        this.codigoProducto = codigoProducto;
    }

    public String getNombreProducto() {
        return nombreProducto;
    }

    public void setNombreProducto(String nombreProducto) {
        this.nombreProducto = nombreProducto;
    }

    public String getCategoria() {
        return categoria;
    }

    public void setCategoria(String categoria) {
        this.categoria = categoria;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }

    public String getPrecioFormateado() {
        return precioFormateado;
    }

    public void setPrecioFormateado(String precioFormateado) {
        this.precioFormateado = precioFormateado;
    }
    
}
