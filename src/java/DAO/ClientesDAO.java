package DAO;

import Modelos.Clientes;
import Utilidades.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ClientesDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    public boolean existeIdClientes(String idCliente) {
        boolean existe = false;
        try {
            cn = ConexionDB.getConnection();
            String sql = "SELECT COUNT(*) FROM clientes WHERE idCliente = ?";
            ps = cn.prepareStatement(sql);
            ps.setString(1, idCliente);
            rs = ps.executeQuery();

            if (rs.next()) {
                existe = rs.getInt(1) > 0; // Si devuelve más de 0, significa que el ID ya existe
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
    
    
    public ArrayList<Clientes> ListarTodosClientes(){
        ArrayList<Clientes> lista = new ArrayList<>(); // Se crea una lista varia
        
        // Se cre la conexion dentro de un try-catch
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "SELECT * FROM clientes"; // La sentencia SQL para traer toota la tabla Usuarios
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
            rs = ps.executeQuery(); // ps retorla la informacion y la guardamos el rs
            
            // Como rs retotna un conjundo de filas los voy a iterar con un WHILE usando .next()
            while(rs.next()){ 
                Clientes obj = new Clientes(); // Por cada iteracion se va crear una nueva clase tipo Clientes
                obj.setIdCliente(rs.getString("idCliente"));
                obj.setTipoDocumento(rs.getString("tipoDocumento"));
                obj.setNombreCliente(rs.getString("nombreCliente"));
                obj.setApellidoCliente(rs.getString("apellidoCliente"));
                obj.setTelefonoCliente(rs.getString("telefonoCliente"));
                obj.setDireccionCliente(rs.getString("direccionCliente"));
                
                
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
    
    public int registrarCliente(Clientes obj){
        int result = 0;
        
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "INSERT INTO clientes(idCliente,tipoDocumento,nombreCliente,apellidoCliente,telefonoCliente,direccionCliente) VALUES (?,?,?,?,?,?)"; // La sentencia SQL para crear un nuevo usuario
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
            ps.setString(1,obj.getIdCliente());
            ps.setString(2,obj.getTipoDocumento());
            ps.setString(3,obj.getNombreCliente());
            ps.setString(4,obj.getApellidoCliente());
            ps.setString(5,obj.getTelefonoCliente());
            ps.setString(6,obj.getDireccionCliente());
            
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
    
    public Clientes buscarCliente(String idCliente){
        Clientes obj = null;
        
        
        // Se cre la conexion dentro de un try-catch
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "SELECT * FROM clientes WHERE idCliente = ?"; // La sentencia SQL para traer toota la tabla Clientes
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
            ps.setString(1, idCliente);
            rs = ps.executeQuery();
            
            
            if(rs.next()){ 
                obj = new Clientes(); // Por cada iteracion se va crear una nueva clase tipo Cliente
                obj.setIdCliente(rs.getString("idCliente"));
                obj.setTipoDocumento(rs.getString("tipoDocumento"));
                obj.setNombreCliente(rs.getString("nombreCliente"));
                obj.setApellidoCliente(rs.getString("apellidoCliente"));
                obj.setTelefonoCliente(rs.getString("telefonoCliente"));
                obj.setDireccionCliente(rs.getString("direccionCliente"));
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
    
    public int editarCliente(Clientes obj){
        int result = 0;
        
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "UPDATE clientes SET tipoDocumento=?, nombreCliente=?, apellidoCliente=?, telefonoCliente=?, direccionCliente=?" + " WHERE idCliente=?"; // La sentencia SQL para EDITAR un cliente
            
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
        
            ps.setString(1,obj.getTipoDocumento());
            ps.setString(2,obj.getNombreCliente());
            ps.setString(3,obj.getApellidoCliente());
            ps.setString(4,obj.getTelefonoCliente());
            ps.setString(5,obj.getDireccionCliente());
            ps.setString(6,obj.getIdCliente());
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
    
    public int eliminarCliente(String idCliente){
        int result = 0;
        
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "DELETE FROM clientes WHERE idCliente = ?"; // La sentencia SQL para EDITAR un cliente
            
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
      
            ps.setString(1, idCliente);
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
    
}
