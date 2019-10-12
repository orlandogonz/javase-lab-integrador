package ar.com.eduit.curso.java.test;
import ar.com.eduit.curso.java.connectors.Connector;
import ar.com.eduit.curso.java.entities.Alumno;
import ar.com.eduit.curso.java.entities.Curso;
import ar.com.eduit.curso.java.enumerados.Dia;
import ar.com.eduit.curso.java.enumerados.Turno;
import ar.com.eduit.curso.java.repositories.interfaces.I_AlumnoRepository;
import ar.com.eduit.curso.java.repositories.interfaces.I_CursoRepository;
import ar.com.eduit.curso.java.repositories.jdbc.AlumnoRepository;
import ar.com.eduit.curso.java.repositories.jdbc.CursoRepository;
import java.sql.Connection;
public class TestRepository {
    public static void main(String[] args) {
        try (Connection conn=Connector.getConnection()){
            I_CursoRepository cr=new CursoRepository(conn);
            Curso curso=new Curso("Java","Rioja",Dia.lunes,Turno.noche);
            cr.save(curso);
            System.out.println(curso);
            
            curso=new Curso("HTML","Perez",Dia.martes,Turno.mañana);
            cr.save(curso);
            System.out.println(curso);
            
            curso=new Curso("PHP","Sosa",Dia.viernes,Turno.tarde);
            cr.save(curso);
            System.out.println(curso);
            
            curso=new Curso("Phyton","Segovia",Dia.jueves,Turno.noche);
            cr.save(curso);
            System.out.println(curso);
            
            curso=new Curso("Javascript","Sergi",Dia.jueves,Turno.noche);
            cr.save(curso);
            System.out.println(curso);
            
            curso=new Curso("Jardineria","Servante",Dia.jueves,Turno.noche);
            cr.save(curso);
            System.out.println(curso);
            
            cr.remove(cr.getById(8));
            
            curso=cr.getById(10);
            if(curso!=null &&  curso.getId()!=0){
                curso.setProfesor("Lorenzo");
                cr.update(curso);
            }
            
            System.out.println("*********************************************");
            cr.getAll().forEach(System.out::println);
            //cr.getLikeTitulo("ja").forEach(System.out::println);
            //cr.getLikeProfesor("se").forEach(System.out::println);
            //System.out.println(cr.getById(4));
            
            I_AlumnoRepository ar= new AlumnoRepository(conn);
            Alumno alumno=new Alumno("Carlos","Rios",23,1);
            ar.save(alumno);
            
            System.out.println(alumno);
            
        }catch(Exception e){ e.printStackTrace(); }
    }
}