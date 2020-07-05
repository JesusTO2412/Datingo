<%-- 
    Document   : index
    Created on : 29 may. 2020, 8:58:32
    Author     : Jesus
    Posibles errores de zona horaria y solucion:
        SET GLOBAL time_zone = '+3:00'; -> consulta sql
        ?serverTimezone=UTC -> al final de la base de datos
        1049 database
        1045 root and pass, (login)
        1146 table
        1054 campo
        1064 borrando el from

https://www.fromdual.com/mysql-error-codes-and-messages-1000-1049
--%>
<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Connection conexion = null;
    Statement stmt = null;
    ResultSet rs = null;
    try{
        Class.forName("com.mysql.jdbc.Driver");
        conexion = DriverManager.getConnection("jdbc:mysql://localhost/datingo ?serverTimezone=UTC","root","");
        stmt = conexion.createStatement();
        rs = stmt.executeQuery("SELECT idUsuario,nombreUsuario,correoElectronico,"
                     + "telefono,fechaNacimiento,estado,idImagen FROM usuario JOIN estado ON usuario.idEstado=estado.idEstado");    
%>  
<html>
    <head>
        <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="shortcut icon" type="image/x-icon" href="iconos/logo2.ico">
        <link href="css/bootstrap.min.css" rel="stylesheet">
        <title>Datingo - Usuarios </title>          
    </head>
    <body>    
        <div class="jumbotron" style="background-color: #e34a42cc; color: #fff;">
            <div class="container">
              <h1 class="display-3">Datingo </h1>
              <h2>Usuarios Registrados en la aplicacion <img src="iconos/contacts2.png" alt="Generic placeholder image" width="75" height="75"> </h2>        
              <p><a class="btn btn-danger btn-lg" href="#" role="button">Volver al Inicio &raquo;</a></p>
            </div>
        </div>
        <div class="container marketing">
            <div class="row"> 
            <%
            while(rs.next()){
            %>
            <div class="container2 col-lg-4 text-center">
                <img class="rounded-circle" src="imagenes/<% out.println(rs.getString(7));%>" alt="Generic placeholder image" width="140" height="140">
                <h2><% out.println(rs.getString(2));%></h2>
                <p>Correo: <% out.println(rs.getString(3));%><br>
                Telefono: <% out.println(rs.getString(4));%><br>
                Fecha de Nacimiento: <% out.println(rs.getString(5));%><br>
                Estado: <% out.println(rs.getString(6));%></p>
            </div>    
            <%
            }
        }catch(SQLException e){
            int error = e.getErrorCode();
            if(error==1045)
                out.println("ERROR: El usuario o contraseña de la base de datos no son correctos");
            else if(error==1049)
                out.println("ERROR: Base de Datos desconocida");
            else if(error==1054)
                out.println("ERROR: El campo seleccionado no existe");
            else if(error==1064)
                out.println("ERROR: La consulta es incorrecta");
            else if(error==1146)
                out.println("ERROR: La tabla seleccionada no existe");
            else
                out.println("ERROR:" + e.getMessage());
        }
            %>
            </div>
        </div>
    </body>
</html>