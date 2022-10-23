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
            conexion = DriverManager.getConnection("jdbc:mysql://localhost:3306/proyectopruebas", "root", "");
            Statement guardaDatos = conexion.createStatement();
            String insercion = "INSERT INTO registro (nombre, apellido, dni, tel, direccion, email, nacionalidad, localidad) VALUES ("
            + Integer.valueOf(request.getParameter("matricula"))
            + ", '" + request.getParameter("nombre")
            + "', '" + request.getParameter("curso")
            + "', " + Integer.valueOf(request.getParameter("dni"))
            + ")";
            }
        %>
    </body>
</html>
