package DAO;

import Modelos.Clientes;
import Modelos.Productos;
import Modelos.Ventas;
import Utilidades.ConexionDB;
import static Utilidades.ConexionDB.getConnection;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

/**
 *
 * @author JAMES
 */
public class VentasDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    
    
    public int obtenerSiguienteIdVentas() {
    int siguienteId = 1; // Valor por defecto si no hay registros
    String sql = "SELECT COALESCE(MAX(idVenta), 0) + 1 FROM ventas";

    try (Connection cn = ConexionDB.getConnection();
         PreparedStatement ps = cn.prepareStatement(sql);
         ResultSet rs = ps.executeQuery()) {

        if (rs.next()) {
            siguienteId = rs.getInt(1); // Obtener el siguiente ID
        }

    } catch (SQLException ex) {
        ex.printStackTrace(); // Puedes cambiar esto por logs adecuados
    }

    return siguienteId;
}


    
    public Clientes buscarCliente(String idCliente) {
        Clientes cliente = null;
        String query = "SELECT * FROM clientes WHERE idCliente = ?";

        // Obtener la conexión a la base de datos
        try (Connection connection = getConnection(); // Llama a tu método de conexión
            PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, idCliente);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Crear un nuevo objeto Clientes con los datos obtenidos
                cliente = new Clientes(
                        idCliente,
                        rs.getString("tipoDocumento"),
                        rs.getString("nombreCliente"),
                        rs.getString("apellidoCliente"),
                        rs.getString("telefonoCliente"),
                        rs.getString("direccionCliente")
                );
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de excepciones, puedes mejorarlo según tus necesidades
        }

        return cliente; // Retorna el cliente encontrado o null si no se encontró
    }
    
    public Productos buscarProducto(String codigoProducto) {
        Productos producto = null;
        String query = "SELECT * FROM productos WHERE codigoProducto = ?";

        // Obtener la conexión a la base de datos
        try (Connection connection = getConnection(); // Llama a tu método de conexión
            PreparedStatement stmt = connection.prepareStatement(query)) {
            stmt.setString(1, codigoProducto);
            ResultSet rs = stmt.executeQuery();

            if (rs.next()) {
                // Crear un nuevo objeto Peoducto con los datos obtenidos
                producto = new Productos(
                        codigoProducto,
                        rs.getString("nombreProducto"),
                        rs.getString("categoria"),
                        rs.getBigDecimal("precio")
                        
                );
            }
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de excepciones, puedes mejorarlo según tus necesidades
        }

        return producto; // Retorna el cliente encontrado o null si no se encontró
    }
    
    public boolean insertarVenta(Ventas venta) {
        String sql = "INSERT INTO ventas (emisionVenta, estado, condicionPago, metodoEntrega, metodoPago, entidadPago, " +
                     "totalSubtotal, iva, reteFuente, reteIca, anticipo, totalVenta, totalDescuento, totalPagar, observaciones, idCliente) " +
                     "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection cn = ConexionDB.getConnection(); 
             PreparedStatement stmt = cn.prepareStatement(sql)) {
             
            stmt.setDate(1, new java.sql.Date(venta.getEmisionVenta().getTime())); // Convertir Date a SQL Date
            stmt.setString(2, venta.getEstado());
            stmt.setString(3, venta.getCondicionPago());
            stmt.setString(4, venta.getMetodoEntrega());
            stmt.setString(5, venta.getMetodoPago());
            stmt.setString(6, venta.getEntidadPago());
            stmt.setBigDecimal(7, venta.getTotalSubtotal());
            stmt.setBigDecimal(8, venta.getIva());
            stmt.setBigDecimal(9, venta.getReteFuente());
            stmt.setBigDecimal(10, venta.getReteIca());
            stmt.setBigDecimal(11, venta.getAnticipo());
            stmt.setBigDecimal(12, venta.getTotalVenta());
            stmt.setBigDecimal(13, venta.getTotalDescuento());
            stmt.setBigDecimal(14, venta.getTotalPagar());
            stmt.setString(15, venta.getObservaciones());
            stmt.setString(16, venta.getIdCliente());

            int filasAfectadas = stmt.executeUpdate();
            return filasAfectadas > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
    
    public void guardarVenta(Ventas venta) {
        String sql = "INSERT INTO ventas (idVenta, emisionVenta, estado, condicionPago, metodoEntrega, metodoPago, entidadPago, totalSubtotal, iva, reteFuente, reteIca, anticipo, totalVenta, totalDescuento, totalPagar, observaciones, idCliente) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";

        try (Connection connection = getConnection(); PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, venta.getIdVenta());
            stmt.setDate(2, new java.sql.Date(venta.getEmisionVenta().getTime()));
            stmt.setString(3, venta.getEstado());
            stmt.setString(4, venta.getCondicionPago());
            stmt.setString(5, venta.getMetodoEntrega());
            stmt.setString(6, venta.getMetodoPago());
            stmt.setString(7, venta.getEntidadPago());
            stmt.setBigDecimal(8, venta.getTotalSubtotal());
            stmt.setBigDecimal(9, venta.getIva());
            stmt.setBigDecimal(10, venta.getReteFuente());
            stmt.setBigDecimal(11, venta.getReteIca());
            stmt.setBigDecimal(12, venta.getAnticipo());
            stmt.setBigDecimal(13, venta.getTotalVenta());
            stmt.setBigDecimal(14, venta.getTotalDescuento());
            stmt.setBigDecimal(15, venta.getTotalPagar());
            stmt.setString(16, venta.getObservaciones());
            stmt.setString(17, venta.getIdCliente()); // Asegúrate de incluir el idCliente

            stmt.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace(); // Manejo de excepciones
        }
    }
}

