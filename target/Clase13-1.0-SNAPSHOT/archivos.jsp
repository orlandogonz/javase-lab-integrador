<%-- 
    Document   : archivos
    Created on : 07/10/2019, 13:00:06
    Author     : Orlando
--%>

<%@page import="ar.com.eduit.curso.java.utils.html.Table"%>
<%@page import="ar.com.eduit.curso.java.utils.files.FileText"%>
<%@page import="ar.com.eduit.curso.java.utils.files.I_File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% I_File file=new FileText("colores.txt"); %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
        integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
        <title>Archivos</title>
    </head>
    <body>
        <h1>Ejemplo de Archivos</h1>
        <form>
            Color:<input type="text" class="form-control" name="color">
            <input type="submit" class="form-control" value="Agregar">
        </form>
        <%
            file.addLine(request.getParameter("color"));
        %>
        <%
            for(String s:file.getLines()) out.println(s+"<br>");
            // carlos.rios@educacionit.com
        %>
    </body>
</html>
