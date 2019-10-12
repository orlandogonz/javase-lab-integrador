package ar.com.eduit.curso.java.utils.html;
import java.lang.reflect.Field;
import java.util.List;
public class Table <E> {
    public String getTable(List<E>list){
        String table="";
        if(list==null || list.isEmpty()) return table;
        table+="<table>";
        E e=list.get(0);
        Field[] campos=e.getClass().getDeclaredFields();
        table+="<tr>";
        for(Field c:campos){
            table+="<th>"+c.getName()+"</th>";
        }
        table+="</tr>";
        for(E x:list){
            table+="<tr>";
            for(Field c:campos){
                table+="<td>";
                String method="get"+c.getName().substring(0, 1).toUpperCase()+
                        c.getName().substring(1);
                try {
                    table+=x.getClass().getDeclaredMethod(method, null).invoke(x, null);
                } catch (Exception ex) { ex.printStackTrace(); }
                table+="</td>";
            }
            table+="</tr>";
        }
        table+="</table>";
        return table;
    }
}