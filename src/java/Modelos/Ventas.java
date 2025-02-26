package Modelos;

import java.math.BigDecimal;
import java.util.Date;

public class Ventas {
    private int idVenta;// numero de la factura
    private String idCliente; // No. de isnedftificacion del Cliente y llave foranea del la tabla Clientes
    private Date emisionVenta;
    private String estado;
    private String condicionPago;
    private String metodoEntrega;
    private String metodoPago;
    private String entidadPago;
    private BigDecimal totalSubtotal;
    private BigDecimal iva;
    private BigDecimal reteFuente;
    private BigDecimal reteIca;
    private BigDecimal anticipo;
    private BigDecimal totalVenta;
    private BigDecimal totalDescuento;
    private BigDecimal totalPagar;
    private String observaciones;

    public Ventas() {
    }

    public Ventas(int idVenta, String idCliente, Date emisionVenta, String estado, String condicionPago, String metodoEntrega, String metodoPago, String entidadPago, BigDecimal totalSubtotal, BigDecimal iva, BigDecimal reteFuente, BigDecimal reteIca, BigDecimal anticipo, BigDecimal totalVenta, BigDecimal totalDescuento, BigDecimal totalPagar, String observaciones) {
        this.idVenta = idVenta;
        this.idCliente = idCliente;
        this.emisionVenta = emisionVenta;
        this.estado = estado;
        this.condicionPago = condicionPago;
        this.metodoEntrega = metodoEntrega;
        this.metodoPago = metodoPago;
        this.entidadPago = entidadPago;
        this.totalSubtotal = totalSubtotal;
        this.iva = iva;
        this.reteFuente = reteFuente;
        this.reteIca = reteIca;
        this.anticipo = anticipo;
        this.totalVenta = totalVenta;
        this.totalDescuento = totalDescuento;
        this.totalPagar = totalPagar;
        this.observaciones = observaciones;
    }

    public int getIdVenta() {
        return idVenta;
    }

    public void setIdVenta(int idVenta) {
        this.idVenta = idVenta;
    }

    public String getIdCliente() {
        return idCliente;
    }

    public void setIdCliente(String idCliente) {
        this.idCliente = idCliente;
    }

    public Date getEmisionVenta() {
        return emisionVenta;
    }

    public void setEmisionVenta(Date emisionVenta) {
        this.emisionVenta = emisionVenta;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public String getCondicionPago() {
        return condicionPago;
    }

    public void setCondicionPago(String condicionPago) {
        this.condicionPago = condicionPago;
    }

    public String getMetodoEntrega() {
        return metodoEntrega;
    }

    public void setMetodoEntrega(String metodoEntrega) {
        this.metodoEntrega = metodoEntrega;
    }

    public String getMetodoPago() {
        return metodoPago;
    }

    public void setMetodoPago(String metodoPago) {
        this.metodoPago = metodoPago;
    }

    public String getEntidadPago() {
        return entidadPago;
    }

    public void setEntidadPago(String entidadPago) {
        this.entidadPago = entidadPago;
    }

    public BigDecimal getTotalSubtotal() {
        return totalSubtotal;
    }

    public void setTotalSubtotal(BigDecimal totalSubtotal) {
        this.totalSubtotal = totalSubtotal;
    }

    public BigDecimal getIva() {
        return iva;
    }

    public void setIva(BigDecimal iva) {
        this.iva = iva;
    }

    public BigDecimal getReteFuente() {
        return reteFuente;
    }

    public void setReteFuente(BigDecimal reteFuente) {
        this.reteFuente = reteFuente;
    }

    public BigDecimal getReteIca() {
        return reteIca;
    }

    public void setReteIca(BigDecimal reteIca) {
        this.reteIca = reteIca;
    }

    public BigDecimal getAnticipo() {
        return anticipo;
    }

    public void setAnticipo(BigDecimal anticipo) {
        this.anticipo = anticipo;
    }

    public BigDecimal getTotalVenta() {
        return totalVenta;
    }

    public void setTotalVenta(BigDecimal totalVenta) {
        this.totalVenta = totalVenta;
    }

    public BigDecimal getTotalDescuento() {
        return totalDescuento;
    }

    public void setTotalDescuento(BigDecimal totalDescuento) {
        this.totalDescuento = totalDescuento;
    }

    public BigDecimal getTotalPagar() {
        return totalPagar;
    }

    public void setTotalPagar(BigDecimal totalPagar) {
        this.totalPagar = totalPagar;
    }

    public String getObservaciones() {
        return observaciones;
    }

    public void setObservaciones(String observaciones) {
        this.observaciones = observaciones;
    }
}
