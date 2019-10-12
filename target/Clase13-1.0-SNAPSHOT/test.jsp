<%-- 
    Document   : test
    Created on : 25/09/2019, 11:55:23
    Author     : EducaciónIT
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang=es>
    <head>
        <meta http-equiv=Content-Type content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <!-- Comentarios html -->
        <h1>Hello World!</h1>
        <%
            // Codigo JSP
            System.out.println("** Esto sale en la consola del servidor **");
            out.println("** esto se renderiza como html **");
            out.println("<h1>Titulo</h1>");
            out.println("<h2>Titulo</h2>");
            out.println("<h3>Titulo</h3>");
            out.println("<h4>Titulo</h4>");
            out.println("<h5>Titulo</h5>");
            out.println("<h6>Titulo</h6>");
            
            List<String> lista=new ArrayList();
            lista.add("Lunes");
            lista.add("Martes");
            lista.add("Miércoles");
            lista.add("Jueves");
            lista.add("Viernes");
            
            lista.forEach(System.out::println);
            //lista.forEach(out::println);
            
            //lista.forEach(item->{
            //    try{
            //        out.println(item+"<br>");
            //    }catch(Exception e){ e.printStackTrace();}
            //});
            
            for(String st:lista) out.println(st+"<br>");

            {
                int x1=8;
                out.println(x1+"<br>");
            }
            //out.println(x1+"<br>");
            //Variable fuera de scope
            int x2=12;
        %>
        
        <hr>
        
        <%
            //otro bolque jsp
            out.println(x2+"<br>");
            
            //Parametros GET
            //http://localhost:8080/Clase10/test.jsp?nombre=Carlos
            String nombre=request.getParameter("nombre");
            if(nombre !=null && !nombre.isEmpty()){
                out.println("<h1>Hola "+nombre+"</h1>");
            }
            
            try{
                //http://localhost:8080/Clase10/test.jsp?nro1=5&nro2=14&nombre=Carlos
                int nro1=Integer.parseInt(request.getParameter("nro1"));
                int nro2=Integer.parseInt(request.getParameter("nro2"));
                out.println("<h3>Total="+(nro1+nro2)+"</h3>");
            }catch(Exception e){ }

        %>
        
    </body>
</html>
