<%-- 
    Document   : alumnosAlta
    Created on : 02/10/2019, 12:17:57
    Author     : Orlando
--%>

<%@page import="ar.com.eduit.curso.java.validadores.ValidatorAlumno"%>
<%@page import="ar.com.eduit.curso.java.entities.Alumno"%>
<%@page import="ar.com.eduit.curso.java.connectors.Connector"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.utils.html.Boton"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Alta de Alumnos</title>
    </head>
    <body>
        <h1>Alta de Alumnos</h1>
        
        <%
            I_AlumnoRepository ar=new AlumnoRepository(Connector.getConnection());
            try {
                ValidatorAlumno va=new ValidatorAlumno(
                        request.getParameter("nombre"),
                        request.getParameter("apellido"),
                        request.getParameter("edad")
                );
                if(va.validar()){
                    String nombre=request.getParameter("nombre");
                    String apellido=request.getParameter("apellido");
                    int edad=Integer.parseInt(request.getParameter("edad"));
                    int idCurso=Integer.parseInt(request.getParameter("idCurso"));
                    Alumno alumno=new Alumno(nombre, apellido, edad, idCurso);
                    ar.save(alumno);
                    out.println("<h3>Se dio de alta un alumno id:"+alumno.getId()+"</h3>");
                }else{
                    out.println("<h3>"+va.getMensaje()+"</h3>");
                }
            } catch (Exception e) { e.printStackTrace(); }
        %>
        
        <% out.println(Boton.volver("alumnos.jsp")); %>
        <!--
        <form action="alumnos.jsp">
            <input type="submit" value="Volver"/>
        </form>
        -->
    </body>
</html>
