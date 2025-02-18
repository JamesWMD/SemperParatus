package Modelos;

import java.math.BigDecimal;
import java.util.Date;

public class FacturasVentas {
    private int idFactura;
    private Date emisionFactura;
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
    private BigDecimal totalFactura;
    private BigDecimal totalDescuento;
    private BigDecimal totalPagar;
    private String observaciones;

    public FacturasVentas() {
    }

    public FacturasVentas(int idFactura, Date emisionFactura, String estado, String condicionPago, String metodoEntrega, String metodoPago, String entidadPago, BigDecimal totalSubtotal, BigDecimal iva, BigDecimal reteFuente, BigDecimal reteIca, BigDecimal anticipo, BigDecimal totalFactura, BigDecimal totalDescuento, BigDecimal totalPagar, String observaciones) {
        this.idFactura = idFactura;
        this.emisionFactura = emisionFactura;
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
        this.totalFactura = totalFactura;
        this.totalDescuento = totalDescuento;
        this.totalPagar = totalPagar;
        this.observaciones = observaciones;
    }

    public int getIdFactura() {
        return idFactura;
    }

    public void setIdFactura(int idFactura) {
        this.idFactura = idFactura;
    }

    public Date getEmisionFactura() {
        return emisionFactura;
    }

    public void setEmisionFactura(Date emisionFactura) {
        this.emisionFactura = emisionFactura;
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

    public BigDecimal getTotalFactura() {
        return totalFactura;
    }

    public void setTotalFactura(BigDecimal totalFactura) {
        this.totalFactura = totalFactura;
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
