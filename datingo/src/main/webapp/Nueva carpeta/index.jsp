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
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" >
        <title>Datingo - Usuarios </title>          
    </head>
    <body> 
        <nav class="navbar navbar-expand-lg navbar-light bg-light fixed-top">
            <div class="container">
                <a class="navbar-brand" href="#"><img src="imagenes/logo.png" width="30" height="30" class="d-inline-block align-top"> <b>UPPue</b></a>
                <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#Nav1" aria-controls="Nav1" aria-expanded="false" aria-label="Toggle navigation">
                  <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="Nav1">
                    <ul class="navbar-nav mr-auto">
                        <li class="nav-item active"><a href="index.php" class="nav-link">Inicio</a></li>
                        <li class="nav-item"><a href="insertarLibro.php" class="nav-link">Insertar</a></li>
                        <li class="nav-item dropdown"><a class="nav-link dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">Popular</a>
                        <div class="dropdown-menu" aria-labelledby="dropdown07">
                            <a class="dropdown-item" href="#">Action</a>
                        </div>
                        </li>
                   </ul>
                   
                </div>
            </div>
        </nav>
        
        
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
        <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
	<script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
    </body>
</html>