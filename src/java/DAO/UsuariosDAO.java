
package DAO;

import Modelos.Usuarios;
import Utilidades.ConexionDB;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;


public class UsuariosDAO {
    private Connection cn = null;
    private PreparedStatement ps = null;
    private ResultSet rs = null;
    
    
    public ArrayList<Usuarios> ListarTodosUsuario(){
        ArrayList<Usuarios> lista = new ArrayList<>(); // Se crea una lista varia
        
        // Se cre la conexion dentro de un try-catch
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "SELECT * FROM usuarios"; // La sentencia SQL para traer toota la tabla Usuarios
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
            rs = ps.executeQuery(); // ps retorla la informacion y la guardamos el rs
            
            // Como rs retotna un conjundo de fils los voy a iterar con un WHILE usando .next()
            while(rs.next()){ 
                Usuarios obj = new Usuarios(); // Por cada iteracion se va crear una nueva clase tipo Usuarios
                obj.setNoIdentificacion(rs.getString("noIdentificacion"));
                obj.setNombreUsuario(rs.getString("nombreUsuario"));
                obj.setPassword(rs.getString("Password"));
                obj.setEstado(rs.getString("estado"));
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
    
    public int registrarUsuario(Usuarios obj){
        int result = 0;
        
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "INSERT INTO usuarios(noIdentificacion,nombreUsuario,password,estado) VALUES (?,?,?,?)"; // La sentencia SQL para crear un nuevo usuario
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
            ps.setString(1,obj.getNoIdentificacion());
            ps.setString(2,obj.getNombreUsuario());
            ps.setString(3,obj.getPassword());
            ps.setString(4,obj.getEstado());
            
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
    
    public Usuarios buscarUsuario(String noIdentificacion){
        Usuarios obj = null;
        
        
        // Se cre la conexion dentro de un try-catch
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "SELECT * FROM usuarios WHERE noIdentificacion = ?"; // La sentencia SQL para traer toota la tabla Usuarios
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
            ps.setString(1, noIdentificacion);
            rs = ps.executeQuery();
            
            
            if(rs.next()){ 
                obj = new Usuarios(); // Por cada iteracion se va crear una nueva clase tipo Usuarios
                obj.setNoIdentificacion(rs.getString("noIdentificacion"));
                obj.setNombreUsuario(rs.getString("nombreUsuario"));
                obj.setPassword(rs.getString("Password"));
                obj.setEstado(rs.getString("estado"));
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
    
    public int editarUsuario(Usuarios obj){
        int result = 0;
        
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "UPDATE usuarios SET nombreUsuario=?, password=?, estado=?" + " WHERE noIdentificacion=?"; // La sentencia SQL para EDITAR un usuario
            
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
        
            ps.setString(1,obj.getNombreUsuario());
            ps.setString(2,obj.getPassword());
            ps.setString(3,obj.getEstado());
            ps.setString(4,obj.getNoIdentificacion());
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
    
    public int eliminarUsuario(String noIdentificacion){
        int result = 0;
        
        try{
            cn = ConexionDB.getConnection(); // se invoca la clase ConexionDB y su metodo getConnection()
            String sql = "DELETE FROM usuarios WHERE noIdentificacion = ?"; // La sentencia SQL para EDITAR un usuario
            
            ps = cn.prepareStatement(sql); // Prepara la sentencia SQL
      
            ps.setString(1, noIdentificacion);
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
