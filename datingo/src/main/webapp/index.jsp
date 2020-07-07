<%-- 
    Document   : index
    Created on : 5 jul. 2020, 17:36:51
    Author     : Jesus
--%>
<%@page import="java.util.*"%>
<%@page import="Dao.*"%>
<%@page import="Dao.EstadoDB"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <meta name="description" content="">
    <meta name="author" content="">
    <link rel="icon" href="img/iconos/logo2.ico">
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css" >
    
    <link href="css/style.css" rel="stylesheet">
    <title>Datingo</title>
  </head>

  <body>
    <%
        List<Usuario> usuarios = new UsuarioBD().listadoUsuarios();
        List<Estado> estados = new EstadoDB().listadoEstados();   
    %>
    <nav class="navbar navbar-expand-md navbar-dark fixed-top " style="background-color: #fd5754;">
      <a class="navbar-brand" href="#">Datingo</a>
      <button class="navbar-toggler d-lg-none" type="button" data-toggle="collapse" data-target="#navbarsExampleDefault" aria-controls="navbarsExampleDefault" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>

      <div class="collapse navbar-collapse" id="navbarsExampleDefault">
        <ul class="navbar-nav mr-auto">
          <li class="nav-item active">
            <a class="nav-link" href="#">Home <span class="sr-only">(current)</span></a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Settings</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Profile</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="#">Help</a>
          </li>
        </ul>
      </div>
    </nav>

    <div class="container-fluid">
      <div class="row">
        <nav class="col-sm-3 col-md-2 d-none d-sm-block sidebar fixed-left bg-dark">
          <div class="col-12 col-sm-12 administrador text-center"">
              <img src="img/admin.jpg" width="50%" class="img-fluid rounded-circle" alt=""><br><br>
              <h4>Administrador</h4>
          <div>Jesus Toxqui Ortega</div><br>
          <a class="btn btn-danger" href="#" role="button">Log Out &raquo;</a>
          </div><br>
          <ul class="nav nav-pills flex-column">
            <li class="nav-item">
              <a class="nav-link active" href="index.jsp">Dashboard <span class="sr-only">(current)</span></a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="agregarUsuario.jsp">Insertar Usuario</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="agregarEstado.jsp">Insertar Estado</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="editarUsuario.jsp">Editar Usuario</a>
            </li>
            <li class="nav-item">
              <a class="nav-link" href="editarEstado.jsp">Editar Estado</a>
            </li>
            <li class="nav-item">
              <a class="nav-link disabled" href="#">Otra opcion</a>
            </li>
          </ul>
      
        </nav>

        <main class="col-sm-9 ml-sm-auto col-md-10 pt-3" role="main">
          <h1>Dashboard</h1>

          <section class="row justify-content-md-center imgLogoBg">
            <div class="col-6 col-sm-6 text-center">
              <img src="img/logo.png"  class="img-fluid ">
            
          </section>

          <div class="card">
            <div class="card-body">
              <div class="row justify-content-between">
                <div class="col-md-6">
                  <h2>Tabla Usuarios Registrados</h2>
                </div>
                <div class="col-md-2 text-right">
                  <a class="btn btn-success btn-block" href="agregar.html" role="button"><i class="fas fa-plus"></i> Agregar Usuario</a>
                </div>
              </div>
              <div class="table-responsive">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th scope="col">#Id Usuario</th>
                      <th scope="col">Nombre de Usuario</th>
                      <th scope="col">Correo Electronico</th>
                      <th scope="col">Telefono</th>
                      <th scope="col">Fecha de Nacimiento</th>
                      <th scope="col">Id Estado</th>
                      <th scope="col" colspan="3">Acciones</th>
                    </tr>
                  </thead>
                  <tbody>
                    <%for (Usuario usuario:usuarios){%>
                    <tr>                              
                      <th scope="row"><%=usuario.getId_usuario()%></th>
                      <td><%=usuario.getUsuario()%></td>
                      <td><%=usuario.getCorreo()%></td>
                      <td><%=usuario.getTelefono()%></td>
                      <td><%=usuario.getFechaNacimiento() %></td>
                      <td><%=usuario.getId_estado()%></td>
                      <td class="actions"><a class="btn btn-info btn-block btn-sm" href="detalles.html" role="button"><i class="fas fa-eye"></i> Detalles</a></td>
                      <td class="actions"><a class="btn btn-warning btn-block btn-sm" href="#" role="button"><i class="fas fa-pen"></i> Editar</a></td>
                      <td class="actions">
                        <button type="button" class="btn btn-danger btn-block btn-sm" data-toggle="modal" data-target="#modalUsuario<%=usuario.getId_usuario()%>">
                          <i class="fas fa-trash-alt"></i> Eliminar
                        </button>
                        <div class="modal fade" id="modalUsuario<%=usuario.getId_usuario()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header justify-content-md-center">
                                <h5 class="modal-title justify-content-md-center" id="exampleModalLabel">¡Atencion!</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">
                                ¿Esta seguro de eliminar a <%=usuario.getUsuario()%>?
                              </div>
                              <div class="modal-footer justify-content-md-center">
                                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i></i></button>
                                <button type="button" class="btn btn-success"><i class="fas fa-check"></i></button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </td>
                    </tr>
                    <%}%>
                   
                  </tbody>
                </table>   
              </div>    
            </div>
          </div>

          <div class="card">
            <div class="card-body">
              <div class="row justify-content-between">
                <div class="col-md-6">
                  <h2>Tabla Estados</h2>
                </div>
                <div class="col-md-2 text-right">
                  <a class="btn btn-success btn-block" href="#" role="button"><i class="fas fa-plus"></i> Agregar Estado</a>
                </div>
              </div>
              <div class="table-responsive">
                <table class="table table-striped">
                  <thead>
                    <tr>
                      <th>#Id</th>
                      <th>Nombre del Estado</th>
                      <th scope="col" colspan="2">Actions</th>
                    </tr>
                  </thead>
                  <tbody>
                      <%for (Estado estado:estados){%>
                    <tr>
                      <td><%=estado.getId_estado()%></td>
                      <td><%=estado.getEstado()%></td>
                      <td class="actions"><a class="btn btn-warning btn-block btn-sm" href="#" role="button"><i class="fas fa-pen"></i> Editar</a></td>
                      <td class="actions">

                        <button type="button" class="btn btn-danger btn-block btn-sm" data-toggle="modal" data-target="#modalEstado<%=estado.getId_estado()%>">
                          <i class="fas fa-trash-alt"></i> Eliminar
                        </button>

                        <div class="modal fade" id="modalEstado<%=estado.getId_estado()%>" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
                          <div class="modal-dialog">
                            <div class="modal-content">
                              <div class="modal-header justify-content-md-center">
                                <h5 class="modal-title justify-content-md-center" id="exampleModalLabel">¡Atencion!</h5>
                                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                                  <span aria-hidden="true">&times;</span>
                                </button>
                              </div>
                              <div class="modal-body">
                                ¿Esta seguro de eliminar a <%=estado.getEstado()%>?
                              </div>
                              <div class="modal-footer justify-content-md-center">
                                <button type="button" class="btn btn-danger" data-dismiss="modal"><i class="fas fa-times"></i></i></button>
                                <button type="button" class="btn btn-success"><i class="fas fa-check"></i></button>
                              </div>
                            </div>
                          </div>
                        </div>
                      </td>
                    </tr>
                   <%}%>
                  </tbody>
                </table>
              </div>    
            </div>
          </div>    
        </main>
      </div>
    </div>

  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.9/umd/popper.min.js" integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q" crossorigin="anonymous"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/js/bootstrap.min.js" integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl" crossorigin="anonymous"></script>
  <script src="https://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN" crossorigin="anonymous"></script>
  <script src="https://kit.fontawesome.com/3bd2f12179.js" crossorigin="anonymous"></script>

  </body>
</html>
