package Conf;

import java.sql.*;

public class Conexion {
    private Connection conexion = null;
    private static final String localhost="localhost";
    private static final String usuario="root";
    private static final String password="";
    private static final String db="datingo";

    public Connection getConexion() {
        try {
            Class.forName("com.mysql.jdbc.Driver");
            conexion = DriverManager.getConnection("jdbc:mysql://"+localhost+"/"+db+" ?serverTimezone=UTC", usuario, password);           
        } catch (Exception e) {
            System.out.println("Error");
        }finally{
             return conexion;
        }
    }
    
}