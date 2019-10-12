package ar.com.eduit.curso.java.utils.files;
import java.util.ArrayList;
import java.util.Comparator;
import java.util.LinkedHashSet;
import java.util.List;
import java.util.TreeSet;
import java.util.stream.Collectors;
public interface I_File {
    default void print()                { System.out.println(getText());    }
    String getText();
    void setText(String text);
    void appendText(String text);
    default void addLine(String line)   { appendText(line+"\n");            }
    default void clear()                { setText("");                      }
    List<String> getLines();
    default List<String> getLines(String filter){
        if(filter==null) return new ArrayList<String>();
        return getLines()
                .stream()
                .filter(s->s.toLowerCase().contains(filter.toLowerCase()))
                .collect(Collectors.toList());
    }
    default List<String> getSorteredLines(){
        return getLines()
                .stream()
                .sorted()
                .collect(Collectors.toList());
    }
    default List<String> getReversedSorteredLines(){
        return getLines()
                .stream()
                .sorted(Comparator.reverseOrder())
                .collect(Collectors.toList());
    }
    default String getMin(){
        return getLines()
                .stream()
                .min(Comparator.naturalOrder())
                .get();
    }
    default String getMax(){
        return getLines()
                .stream()
                .max(Comparator.naturalOrder())
                .get();
    }
    default LinkedHashSet<String> getSetLines(){
        LinkedHashSet<String>set=new LinkedHashSet();
        set.addAll(getLines());
        return set;
    }
    default TreeSet<String> TreeSetLines(){
        TreeSet<String> set=new TreeSet();
        set.addAll(getLines());
        return set;
    }
}