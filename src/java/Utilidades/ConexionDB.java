
package Utilidades;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class ConexionDB {
    private static final String URL = "jdbc:mysql://databaseaws.cjis684qsvrb.sa-east-1.rds.amazonaws.com:3308/colibri";
    private static final String USER = "admin"; // Cambia por tu usuario de la BD
    private static final String PASSWORD = "**ADSO**2758277**"; // Cambia por tu contraseña de la BD

    // Método para obtener la conexión No. 1
    public static Connection getConnection() throws SQLException {
        Connection connection = null;
        try {
            // Registrar el controlador de MySQL (opcional desde JDBC)
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Establecer la conexión
            connection = DriverManager.getConnection(URL, USER, PASSWORD);
            System.out.println("Conexión exitosa a la base de datos AWS.");
        } catch (ClassNotFoundException e) {
            System.err.println("Error: No se encontró el driver JDBC.");
            e.printStackTrace();
        } catch (SQLException e) {
            System.err.println("Error al conectar con la base de datos.");
            throw e;
        }
        return connection;
    }
    
    // Método para obtener la conexión No. 2
    public static Connection getConexion() throws SQLException {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Cargar el driver de MySQL
            return DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (ClassNotFoundException e) {
            System.out.println("Error al cargar el driver de MySQL: " + e.getMessage());
            throw new SQLException(e);
        }
    }
    
    // Método para obtener la conexión No. 3
    Connection con;
    public ConexionDB() {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver"); // Cargar el driver de MySQL
            con = DriverManager.getConnection(URL, USER, PASSWORD);
        } catch (Exception e) {
            Logger.getLogger(ConexionDB.class.getName()).log(Level.SEVERE, null, e);
        }
        
    }
    public  Connection getConnection2(){
        return con;
    }
    
    // Método principal para pruebas
    /*public static void main(String[] args) {
        try (Connection connection = ConexionDB.getConnection()) {
            if (connection != null) {
                System.out.println("La conexión está activa.");
            }
        } catch (SQLException e) {
            System.err.println("No se pudo establecer la conexión.");
            e.printStackTrace();
        }
    }*/
}
