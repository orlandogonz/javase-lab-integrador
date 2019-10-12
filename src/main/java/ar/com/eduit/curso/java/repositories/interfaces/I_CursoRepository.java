package ar.com.eduit.curso.java.repositories.interfaces;
import ar.com.eduit.curso.java.entities.Curso;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;
public interface I_CursoRepository {
    void save(Curso curso);
    void remove(Curso curso);
    void update(Curso curso);
    List<Curso> getAll();
    default Curso getById(int id)                           { 
        List<Curso>list=getAll()
                .stream()
                .filter(c->c.getId()==id)
                .collect(Collectors.toList());
        return (list==null || list.isEmpty())?(new Curso()):list.get(0);
    }
    default List<Curso> getLikeTitulo(String titulo)        { 
//        List<Curso>list=new ArrayList();
//        if(titulo==null) return list;
//        getAll().forEach(c->{
//            if(c.getTitulo().toLowerCase().contains(titulo.toLowerCase())){
//                list.add(c);
//            }
//        });
//        return list;

        // ApiStream JDK8
        if(titulo==null) return new ArrayList();
        return getAll()
                .stream()
                .filter(c->c.getTitulo().toLowerCase().contains(titulo.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<Curso> getLikeProfesor(String profesor)    { 
        if(profesor==null) return new ArrayList();
        return getAll()
                .stream()
                .filter(c->c.getProfesor().toLowerCase().contains(profesor.toLowerCase()))
                .collect(Collectors.toList());
    }
}