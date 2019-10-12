<%-- 
    Document   : alumnos.jsp
    Created on : 02/10/2019, 11:16:56
    Author     : Orlando
--%>

<%@page import="ar.com.eduit.curso.java.entities.Alumno"%>
<%@page import="ar.com.eduit.curso.java.utils.html.Table"%>
<%@page import="ar.com.eduit.curso.java.entities.Curso"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_AlumnoRepository"%>
<%@page import="ar.com.eduit.curso.java.connectors.Connector"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_AlumnoRepository ar=new AlumnoRepository(Connector.getConnection()); %>
<% I_CursoRepository cr=new CursoRepository(Connector.getConnection()); %>

<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Alumnos</title>
    </head>
    <body>
        <div class="container">
            <h1>Mantenimiento de Alumnos</h1>
            <form action="alumnosAltas.jsp" method="POST" >
                <table>
                    <tr>
                        <td>Nombre:</td>
                        <td><input type="text" class="form-control" name="nombre"/></td>
                    </tr>
                    <tr>
                        <td>Apellido:</td>
                        <td><input type="text" class="form-control" name="apellido"/></td>
                    </tr>
                    <tr>
                        <td>Edad:</td>
                        <td><input type="text" class="form-control" name="edad"/></td>
                    </tr>
                    <tr>
                        <td>Curso:</td>
                        <td>
                            <select name="idCurso" class="form-control">
                                <%
                                    //Espacio libre 16.6 gb libres
                                    for(Curso c:cr.getAll()){
                                        out.print("<option value="+c.getId()+">"+
                                            
                                                c.getId()+", "+c.getTitulo()+", "+c.getProfesor()+", "+c.getDia()+", "+c.getTurno()+
                                                "</option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="reset" class="form-control" value="Limpiar"/> </td>
                        <td><input type="submit" class="form-control" value="Guardar"/></td>
                    </tr>
                </table>
            </form>
                        
            <hr>
            <h2>Listado de Alumnos</h2>
            <form>
                Buscar Apellido:<input type="text" class="form-control" name="buscarApellido">
                </form>
            <% 
                try {
                    String buscarApellido=request.getParameter("buscarApellido");
                    if(buscarApellido==null) buscarApellido="";
                    out.println(new Table<Alumno>().getTable(ar.getLikeApellidoNombre(buscarApellido, "")));
                } catch (Exception e) { e.printStackTrace(); }
            %>
            
            
            
            
            
            
        </div>
   
    </body>
</html>
