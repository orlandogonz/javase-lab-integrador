<%-- 
    Document   : cursos
    Created on : 30 sep. 2019, 11:48:27
    Author     : root
--%>

<%@page import="ar.com.eduit.curso.java.utils.html.Table"%>
<%@page import="ar.com.eduit.curso.java.entities.Curso"%>
<%@page import="ar.com.eduit.curso.java.repositories.jdbc.CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository"%>
<%@page import="ar.com.eduit.curso.java.connectors.Connector"%>
<%@page import="ar.com.eduit.curso.java.enumerados.Turno"%>
<%@page import="ar.com.eduit.curso.java.enumerados.Dia"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_CursoRepository cr=new CursoRepository(Connector.getConnection()); %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"><link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        
        <title>Curso</title>
    </head>
    <body>
        <div class="container">
            <h1>Mantenimiento cursos</h1>
            <form>
                <table>
                    <tr>
                        <td>Titulo:</td>
                        <td><input type="text" class="form-control" name="titulo"/></td>
                    </tr>
                    <tr>
                        <td>Profesor:</td>
                        <td><input type="text" class="form-control"  name="profesor"/></td>
                    </tr>
                    <tr>
                        <td>Día:</td>
                        <td>
                            <select name="dia" class="form-control" >
                                <%
                                    for(Dia d:Dia.values()){
                                        out.println("<option value="+d+">"+d+"</option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td>Turno:</td>
                        <td>
                            <select name="turno"class="form-control" >
                                <%
                                    for(Turno t:Turno.values()){
                                        out.println("<option value="+t+">"+t+"</option>");
                                    }
                                %>
                            </select>
                        </td>
                    </tr>
                    <tr>
                        <td><input type="reset" class="form-control" value="Limpiar"/></td>
                        <td><input type="submit" class="form-control"  value="Guardar"/></td>
                    </tr>
                </table>
            </form>
                        
            <%
                try {
                    String titulo=request.getParameter("titulo");
                    String profesor=request.getParameter("profesor");
                    Dia dia=Dia.valueOf(request.getParameter("dia"));
                    Turno turno=Turno.valueOf(request.getParameter("turno"));
                    if(titulo.length()>=3 && titulo.length()<=20 &&
                        profesor.length()>=3 && profesor.length()<=20){
                        Curso curso=new Curso(titulo, profesor, dia, turno);
                        cr.save(curso);
                        out.println("<h3>Se dio de alta el curso id: "+curso.getId()+"</h3>");
                    }else{
                        out.println("<h3>No se pudo dar de alta el curso!</h3>");
                    }
                } catch (Exception e) {e.printStackTrace();}
            %>
        
            <hr>
            <h2>Listado de cursos!</h2>
            <form>
                Buscar Titulo:
                <input type="text" class="form-control" name="buscarTitulo"/>
            </form>
            <%
                try{
                    String buscarTitulo=request.getParameter("buscarTitulo");
                    if(buscarTitulo==null) buscarTitulo="";
                    //for(Curso c:cr.getLikeTitulo(buscarTitulo)){
                    //    out.println(c+"<br>");
                    //}
                    out.println(new Table<Curso>().getTable(cr.getLikeTitulo(buscarTitulo)));
                }catch(Exception e){}
        %>
        </div>
        
    </body>
</html>
