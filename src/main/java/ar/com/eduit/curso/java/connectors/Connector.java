package ar.com.eduit.curso.java.connectors;
import java.sql.Connection;
import java.sql.DriverManager;
public class Connector {
    //private static String driver="com.mysql.jdbc.Driver";       //driver 5
    private static String driver="com.mysql.cj.jdbc.Driver";    //driver 6 o sup.
    //private static String url="jdbc:mysql://localhost:3306/colegio";  //driver 5
    private static String url="jdbc:mysql://localhost:3306/colegio?serverTimezone=UTC"; //driver 6 o sup
    //private static String url="jdbc:mysql://remotemysql.com:3306/XYi1Z7S7xL?serverTimezone=UTC";
    private static String user="root";
    //private static String user="XYi1Z7S7xL";
    private static String pass="";
    //private static String pass="uPWWkd279a";
    private static Connection conn=null;
    private Connector(){}
    public synchronized static Connection getConnection(){
        if(conn==null){
            try {
                Class.forName(driver);
                conn=DriverManager.getConnection(url, user, pass);
            } catch (Exception e) { e.printStackTrace(); }
        }
        return conn;
    }
}