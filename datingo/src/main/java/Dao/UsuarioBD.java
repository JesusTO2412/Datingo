package Dao;

import Conf.Conexion;
import java.sql.*;
import java.util.*;

public class UsuarioBD {
    
    //Atributos SQL
    private static final String listadoUsuario="SELECT idUsuario,nombreUsuario,correoElectronico,telefono,fechaNacimiento,usuario.idEstado FROM usuario;";
    
    //Atributos de conexión
    private Connection conexion= new Conexion().getConexion();
    private PreparedStatement stmt;
    private ResultSet rs;

    public List<Usuario> listadoUsuarios() throws SQLException{
    List<Usuario> usuarios = new ArrayList<>();
        this.stmt=this.conexion.prepareStatement(this.listadoUsuario);
        this.rs=this.stmt.executeQuery();
        while (this.rs.next()){
            usuarios.add(new Usuario(this.rs.getInt("idUsuario"),this.rs.getString("nombreUsuario"),this.rs.getString("correoElectronico"),this.rs.getString("telefono"),
                    this.rs.getString("fechaNacimiento"), this.rs.getInt("idEstado")));
        } 
    return usuarios;
   }
   
}
