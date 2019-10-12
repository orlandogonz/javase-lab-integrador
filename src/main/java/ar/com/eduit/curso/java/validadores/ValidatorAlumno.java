package ar.com.eduit.curso.java.validadores;
public class ValidatorAlumno {
    private String nombre;
    private String apellido;
    private String edad;
    private String mensaje="";

    public ValidatorAlumno(String nombre, String apellido, String edad) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.edad = edad;
    }

    public String getMensaje() {
        return mensaje;
    }
    
    public boolean validar(){
        // Nombre tenga entre 3 y 20 caracteres
        if(nombre.length()<3 || nombre.length()>20){
            mensaje="El nombre debe tener entre 3 y 20 caracteres.";
            return false;
        }
        // Apellido tenga entre 3 y 20 caracteres
        if(apellido.length()<3 || apellido.length()>20){
            mensaje="El apellido debe tener entre 3 y 20 caracteres.";
            return false;
        }
        // Edad sea un entero entre 18 y 110
        try {
            int nro=Integer.parseInt(edad);
            if(nro<18 || nro>110){
                mensaje="La edad debe ser un número entero entre 18 y 110 edad.";
                return false;
            } 
        } catch (NumberFormatException | NullPointerException e) {
            mensaje="La edad debe ser un número entero entre 18 y 110 edad.";
            return false;
        }
        return true;
    }
}
