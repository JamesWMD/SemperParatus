package DAO;

import Modelos.Productos;
import Utilidades.ConexionDB;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;
import javax.servlet.ServletException;


public class ProductosDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
     public boolean existeCodigoProducto(String codigoProducto) {
        boolean existe = false;
        try {
            cn = ConexionDB.getConnection();
            String sql = "SELECT COUNT(*) FROM productos WHERE codigoProducto = ?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, codigoProducto);
            rs = ps.executeQuery();

            if (rs.next()) {
                existe = rs.getInt(1) > 0; // Si devuelve más de 0, significa que el código ya existe
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (ps != null) {
                    ps.close();
                }
                if (cn != null) {
                    cn.close();
                }
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }
        return existe;
    }
        
    public ArrayList<Productos> ListarTodosProductos(){
        ArrayList<Productos> lista = new ArrayList<>(); // Se crea una lista varia
        
        // Se cre la conexion dentro de un try-catch
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "SELECT * FROM productos"; // La sentencia SQL para traer toota la tabla Productos
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
            rs = ps.executeQuery(); // ps retorla la informacion y la guardamos el rs
            
            // Como rs retotna un conjundo de fils los voy a iterar con un WHILE usando .next()
            while(rs.next()){ 
                Productos obj = new Productos(); // Por cada iteracion se va crear una nueva clase tipo Usuarios
                obj.setCodigoProducto(rs.getString("codigoProducto"));
                obj.setNombreProducto(rs.getString("nombreProducto"));
                obj.setCategoria(rs.getString("categoria"));
                obj.setPrecio(rs.getBigDecimal("precio")); // Cambio aquí
                obj.setStock(rs.getInt("stock")); // Cambio aquí
                /*obj.setPrecio(BigDecimal.valueOf(Double.parseDouble(rs.getString("precio")))); // POR COMPROBAR SI FUNCIONA*/
                /*String precioStr = rs.getString("precio");
                if (precioStr != null && !precioStr.trim().isEmpty()) {
                    obj.setPrecio(new BigDecimal(precioStr.trim()));
                } else {
                    obj.setPrecio(BigDecimal.ZERO); // Valor por defecto si está vacío
                }
                //obj.setPrecio(new BigDecimal(rs.getString("precio").trim()));
                obj.setStock(Integer.parseInt(rs.getString("stock")));*/
                obj.setEstado(rs.getString("estado"));
                obj.setDescripcion(rs.getString("descripcion"));
                
                lista.add(obj); // aqui se agregan cada fila se se iterada en la clase obj;
                
            }
            
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{ // Cerramos la conexion
            try{
                if(cn != null){
                    cn.close();
                }
                if(rs != null){
                    rs.close();
                }
                if(ps != null){
                    ps.close();
                }
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        return lista;
    }
    
    
    public int registrarProducto(Productos obj){
        int result = 0;
        
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            
            // Verificar si el producto ya está registrado
            String checkSql = "SELECT COUNT(*) FROM productos WHERE codigoProducto = ?";
            ps = cn.prepareStatement(checkSql);
            ps.setString(1, obj.getCodigoProducto());
            ResultSet rs = ps.executeQuery();

            if (rs.next() && rs.getInt(1) > 0) {
                // El producto ya está registrado
                return -1; // Puedes usar un código específico para indicar que el producto ya existe
            }
            
            String sql = "INSERT INTO productos (codigoProducto, nombreProducto, categoria, precio, stock, estado, descripcion) VALUES (?,?,?,?,?,?,?)"; // La sentencia SQL para crear un nuevo producto
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
            ps.setString(1,obj.getCodigoProducto());
            ps.setString(2,obj.getNombreProducto());
            ps.setString(3,obj.getCategoria());
            ps.setBigDecimal(4,obj.getPrecio()); //es in BigDecimal
            ps.setInt(5,obj.getStock());
            ps.setString(6,obj.getEstado());
            ps.setString(7,obj.getDescripcion());
            
            
            result = ps.executeUpdate();   
            
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{ // Cerramos la conexion
            try{
                if(cn != null){
                    cn.close();
                }
                if(ps != null){
                    ps.close();
                }
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        return result;
    }
    
    public Productos buscarProducto(String codigoProducto){
        Productos obj = null;
        
        
        // Se cre la conexion dentro de un try-catch
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "SELECT * FROM productos WHERE codigoProducto = ?"; // La sentencia SQL para traer toota la tabla Productos
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
            ps.setString(1, codigoProducto);
            rs = ps.executeQuery();
            
            
            if(rs.next()){ 
                obj = new Productos(); // Por cada iteracion se va crear una nueva clase tipo Productos
                obj.setCodigoProducto(rs.getString("codigoProducto"));
                obj.setNombreProducto(rs.getString("nombreProducto"));
                obj.setCategoria(rs.getString("categoria"));
                
                // Formatear el precio con separaciones de miles
                BigDecimal precio = rs.getBigDecimal("precio");
                NumberFormat formato = NumberFormat.getInstance(new Locale("es", "CO")); // Formato de Colombia
                formato.setMinimumFractionDigits(2); // Mínimo 2 decimales
                formato.setMaximumFractionDigits(2); // Máximo 2 decimales
                String precioFormateado = formato.format(precio);

                obj.setPrecioFormateado(precioFormateado); // Usar un nuevo atributo formateado
                obj.setPrecio(precio); // Guardar el precio original también
                obj.setStock(rs.getInt("stock"));
                obj.setEstado(rs.getString("estado"));
                obj.setDescripcion(rs.getString("descripcion"));
                
                obj.setPrecio(new BigDecimal(rs.getString("precio")));
                obj.setStock(rs.getInt("stock"));
                obj.setEstado(rs.getString("estado"));
                obj.setDescripcion(rs.getString("descripcion"));
                
            }
            
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{ // Cerramos la conexion
            try{
                if(cn != null){
                    cn.close();
                }
                if(rs != null){
                    rs.close();
                }
                if(ps != null){
                    ps.close();
                }
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        return obj;
    }
    
    public int editarProducto(Productos obj){
        int result = 0;
        
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            // La sentencia SQL para EDITAR un producto
            String sql = "UPDATE productos SET nombreProducto=?, categoria=?, precio=?, stock=?, estado=?, descripcion=?" + " WHERE codigoProducto=?"; 
            
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
        
            ps.setString(1,obj.getNombreProducto());
            ps.setString(2,obj.getCategoria());
            ps.setBigDecimal(3,obj.getPrecio());
            ps.setInt(4,obj.getStock());
            ps.setString(5,obj.getEstado());
            ps.setString(6, obj.getDescripcion());
            ps.setString(7, obj.getCodigoProducto());
            result = ps.executeUpdate();   
            
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{ // Cerramos la conexion
            try{
                if(cn != null){
                    cn.close();
                }
                if(ps != null){
                    ps.close();
                }
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        return result;
    }
    
    public int eliminarProducto(String codigoProducto){
        int result = 0;
        
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "DELETE FROM productos WHERE codigoProducto = ?"; // La sentencia SQL para Eliminar un producto
            
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
      
            ps.setString(1, codigoProducto);
            result = ps.executeUpdate();   
            
        }catch(Exception ex){
            ex.printStackTrace();
        }finally{ // Cerramos la conexion
            try{
                if(cn != null){
                    cn.close();
                }
                if(ps != null){
                    ps.close();
                }
                
            }catch(Exception ex){
                ex.printStackTrace();
            }
        }
        
        return result;
    }
    
    public List<Productos> filtrarProductos(String nombre, String categoria, String estado) {
        List<Productos> lista = new ArrayList<>();
        String sql = "SELECT * FROM productos WHERE 1=1";

        List<Object> params = new ArrayList<>();

        if (nombre != null && !nombre.trim().isEmpty()) {
            sql += " AND nombreProducto LIKE ?";
            params.add("%" + nombre.trim() + "%");
        }

        if (categoria != null && !categoria.trim().isEmpty()) {
            sql += " AND categoria = ?";
            params.add(categoria.trim());
        }

        if (estado != null && !estado.trim().isEmpty()) {
            sql += " AND estado = ?";
            params.add(estado.trim());
        }

        try (Connection con = ConexionDB.getConexion(); PreparedStatement ps = con.prepareStatement(sql)) {

            for (int i = 0; i < params.size(); i++) {
                ps.setObject(i + 1, params.get(i));
            }

            ResultSet rs = ps.executeQuery();
            while (rs.next()) {
                Productos p = new Productos();
                p.setCodigoProducto(rs.getString("codigoProducto"));
                p.setNombreProducto(rs.getString("nombreProducto"));
                p.setCategoria(rs.getString("categoria"));
                p.setPrecio(rs.getBigDecimal("precio"));
                p.setStock(rs.getInt("stock"));
                p.setEstado(rs.getString("estado"));
                p.setDescripcion(rs.getString("descripcion"));
                lista.add(p);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return lista;
    }

    
}
