package Modelos;

import java.math.BigDecimal;


public class DetalleFacturasVentas {
    private int idDetalle;
    private int idFactura; // Relacionado con la tabla factura
    private int idProducto; // Relacionado con la tabla producto
    private int cantidad;
    private BigDecimal precio;
    private BigDecimal descuento;
    private BigDecimal subtotal;
    private String descripcion;

    public DetalleFacturasVentas() {
    }

    public DetalleFacturasVentas(int idDetalle, int idFactura, int idProducto, int cantidad, BigDecimal precio, BigDecimal descuento, BigDecimal subtotal, String descripcion) {
        this.idDetalle = idDetalle;
        this.idFactura = idFactura;
        this.idProducto = idProducto;
        this.cantidad = cantidad;
        this.precio = precio;
        this.descuento = descuento;
        this.subtotal = subtotal;
        this.descripcion = descripcion;
    }

    public int getIdDetalle() {
        return idDetalle;
    }

    public void setIdDetalle(int idDetalle) {
        this.idDetalle = idDetalle;
    }

    public int getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(int idFactura) {
        this.idFactura = idFactura;
    }

    public int getIdProducto() {
        return idProducto;
    }

    public void setIdProducto(int idProducto) {
        this.idProducto = idProducto;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public BigDecimal getPrecio() {
        return precio;
    }

    public void setPrecio(BigDecimal precio) {
        this.precio = precio;
    }

    public BigDecimal getDescuento() {
        return descuento;
    }

    public void setDescuento(BigDecimal descuento) {
        this.descuento = descuento;
    }

    public BigDecimal getSubtotal() {
        return subtotal;
    }

    public void setSubtotal(BigDecimal subtotal) {
        this.subtotal = subtotal;
    }

    public String getDescripcion() {
        return descripcion;
    }

    public void setDescripcion(String descripcion) {
        this.descripcion = descripcion;
    }
    
}
