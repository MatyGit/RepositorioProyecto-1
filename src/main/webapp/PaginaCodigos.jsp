 <%-- 
    Document   : PaginaCodigos
    Created on : 21 oct. 2022, 11:12:27
    Author     : COMPU05
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        
        Connection conexion = null;
         PreparedStatement consultaEjercicio = null;   
         try{
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/pruebacodigo", "root", "");
            Statement guardaDatos = conexion.createStatement();
            String insercion = "INSERT INTO registro (nombre, apellido, dni, telefono, direccion, email, nacionalidad, localidad) VALUES ("            
            + ", '" + request.getParameter("nombre")
            + ", '" + request.getParameter("apellido")
            + ", '" + Integer.valueOf(request.getParameter("dni"))
            + ", '" + Integer.valueOf(request.getParameter("telefono"))
            + "','" + request.getParameter("direccion")
            + ", '" + request.getParameter("email")
            + ", '" + request.getParameter("nacionalidad")
            + "','" + request.getParameter("localidad")
            + ")";
            }
            guardarDatos.execute(insercion);
            conexion.close();
                    
        %>
    </body>
</html>
