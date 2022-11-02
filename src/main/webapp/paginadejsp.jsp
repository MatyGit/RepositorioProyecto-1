<%-- 
    Document   : paginadejsp
    Created on : 2 nov. 2022, 19:06:04
    Author     : PC
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>TODO supply a title</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link rel="stylesheet" href="./css/bootstrap.min.css">
    </head>
    <body>
        
                <nav class="navbar navbar-expand-lg navbar-dark bg-primary">
  <div class="container-fluid">
    <a class="navbar-brand" href="#">CFL N°414 La Matanza</a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarColor01" aria-controls="navbarColor01" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarColor01">
      <ul class="navbar-nav me-auto">
        <li class="nav-item">
          <a class="nav-link active" href="Inicio1.html">Inicio
            <span class="visually-hidden">(current)</span>
          </a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Institucion.html">Institucion</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Ubicacion.html">Ubicacion</a>
        </li>
        <li class="nav-item">
          <a class="nav-link" href="Inicio1.html">Inscripcion</a>
          
        </li>
        
        
      </ul>
        
      
    </div>
  </div>
</nav>
        <select name="cursos" id="curs" form="alta"></select>
        <form method="post" action="paginadejsp.jsp">
        DNI </br>
        <input type = "text" name = "dni" /></br>
        </br>
        
        CUIL </br>
        <input type = "text" name = "cuil" /></br>
        </br>
        
        Nombre </br>
        <input type = "text" name = "nombre" /></br>
        </br>
        
        Apellido </br>
        <input type = "text" name = "apellido" /></br>
        </br>
        
        Tel </br>
        <input type = "text" name = "telefono" /></br>
        </br>
        
        Tel </br>
        <input type = "text" name = "fdnac" /></br>
        </br>
        
        Direccion </br>
        <input type = "text" name = "direccion" /></br>
        </br>
        
        EMAIL </br>
        <input type = "text" name = "email" /></br>
        </br>
        
        Nacionalidad </br>
        <input type = "text" name = "nacionalidad" /></br>
        </br>
        
        Localidad </br>
        <input type = "text" name = "localidad" /></br>
        </br>
        
        <input type="submit" value="Aceptar">
        </form>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conexion = null;            
        String insertAlus = "INSERT INTO tb_alus (dni, cuil, nombre, apellido, telefono, fdnac , direccion, email, nacionalidad, localidad) VALUES (?,?,,?,?,?,?,?,?,?,?,?)";
        String insertRel = "INSERT INTO alus_curs (id_alus, id_curs) VALUES "
                        + "((SELECT id_alus FROM tb_alus WHERE dni=?),"
                        + "(SELECT id_curs FROM tb_curs WHERE nom_curs=?))";
        PreparedStatement consultaAlus = null;
        PreparedStatement consultaRel = null;
        PreparedStatement conIn = null;
        PreparedStatement consultaUpdate = null;
        
        try{
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/ProyectoCurso", "root", "");
            consultaAlus = conexion.prepareStatement(insertAlus);
                    consultaAlus.setString(1, request.getParameter("dni"));
                    consultaAlus.setString(2, request.getParameter("cuil"));
                    consultaAlus.setString(3, request.getParameter("nombre"));
                    consultaAlus.setString(4, request.getParameter("apellido"));
                    consultaAlus.setString(5, request.getParameter("tel"));
                    consultaAlus.setString(6, request.getParameter("fdnac"));
                    consultaAlus.setString(7, request.getParameter("direccion"));
                    consultaAlus.setString(8, request.getParameter("email"));
                    consultaAlus.setString(9, request.getParameter("nacionalidad"));
                    consultaAlus.setString(10, request.getParameter("localidad"));
                    consultaAlus.execute();
                    
                    consultaRel = conexion.prepareStatement(insertRel);
                    consultaRel.setString(1, request.getParameter("dni"));
                    consultaRel.setString(2, request.getParameter("cursos"));
                    consultaRel.execute();
                                        
                    conIn = conexion.prepareStatement(selectInsc);
                    conIn.setString(1, request.getParameter("cursos"));
                    ResultSet listaInsc = conIn.executeQuery();
                    listaInsc.next();
                    int vi = Integer.parseInt(listaInsc.getString("inscriptos"));  
                    vi = vi + 1;
                    
                    consultaUpdate = conexion.prepareStatement(updateInsc);
                    consultaUpdate.setInt(1, vi);
                    consultaUpdate.setString(2, request.getParameter("cursos"));
                    consultaUpdate.execute(); 
            }
            catch (Exception e) {
                    e.printStackTrace();
                    out.println("exepcion </br>");
                    out.println("detalle de la consulta: </br>");
                    out.println(consultaAlus + "</br>");
                    out.println(consultaRel + "</br>");
                  
                } finally {
                    try {           
                        conIN.close();
                        consultaAlus.close();
                        consultaRel.close();
                        consultaUpdate.close();
                        conexion.close();
                    } catch (Exception e) {
                    }
                }
        %>
    </body>
</html>

