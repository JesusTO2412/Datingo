package Dao;

import Conf.Conexion;
import java.sql.*;
import java.util.*;

public class EstadoDB {
    
    //Atributos SQL
    private static final String listadoEstado="SELECT * FROM estado";
    
    //Atributos de conexión
    private Connection conexion= new Conexion().getConexion();
    private PreparedStatement stmt;
    private ResultSet rs;

    public List<Estado> listadoEstados() throws SQLException{
    List<Estado> estados = new ArrayList<>();
        this.stmt=this.conexion.prepareStatement(this.listadoEstado);
        this.rs=this.stmt.executeQuery();
        while (this.rs.next()){
            estados.add(new Estado(this.rs.getInt("idEstado"),this.rs.getString("estado")));
        } 
    return estados;
   }
}
