package ar.com.eduit.curso.java.repositories.jdbc;
import ar.com.eduit.curso.java.entities.Alumno;
import ar.com.eduit.curso.java.repositories.interfaces.I_AlumnoRepository;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
public class AlumnoRepository implements I_AlumnoRepository{
    private Connection conn;
    public AlumnoRepository(Connection conn) { this.conn = conn; }  
    @Override public void save(Alumno alumno) {
        if(alumno == null) return;
        try (PreparedStatement ps=conn.prepareStatement(
                "insert into alumnos (nombre,apellido,edad,idCurso) values (?,?,?,?)",
                PreparedStatement.RETURN_GENERATED_KEYS)) {
            ps.setString(1, alumno.getNombre());
            ps.setString(2, alumno.getApellido());
            ps.setInt(3, alumno.getEdad());
            ps.setInt(4, alumno.getIdCurso());
            ps.execute();
            ResultSet rs=ps.getGeneratedKeys();
            if(rs.next()) alumno.setId(rs.getInt(1));
        } catch (Exception e) { e.printStackTrace(); }
    }

    @Override
    public void remove(Alumno alumno) {
        if(alumno == null) return;
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public void uptdate(Alumno alumno) {
        if(alumno == null) return;
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public List<Alumno> getAll() {
        List<Alumno> list=new ArrayList();
        try (ResultSet rs=conn.createStatement().executeQuery(
                "select * from alumnos")) {
            while(rs.next()){
                list.add(
                        new Alumno(
                                rs.getInt("id"),
                                rs.getString("nombre"),
                                rs.getString("apellido"),
                                rs.getInt("edad"),
                                rs.getInt("idCurso")
                        )
                );
            }
        } catch (Exception e) { e.printStackTrace(); }
        return list;
    }
    
}