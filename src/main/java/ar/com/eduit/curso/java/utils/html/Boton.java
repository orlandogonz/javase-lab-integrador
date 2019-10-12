package ar.com.eduit.curso.java.utils.html;
public class Boton {
    public static String volver(String url){
        return "<form action="+url+" >"+
                "<input type=submit value=Volver >" +
                "</form>";
    }
}
