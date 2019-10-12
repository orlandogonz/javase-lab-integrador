package ar.com.eduit.curso.java.test;

import ar.com.eduit.curso.java.utils.files.FileText;

public class TestFile {
    public static void main(String[] args) {
        //String file="c:/texto.txt";         //absoluto a la una unidad del FS
        String file="texto.txt";            //relativo al proyecto
        FileText fileText=new FileText(file);
        fileText.setText("Curso de java!\n");
        fileText.appendText("Primavera.\n");
        fileText.appendText("Verano.\n");
        fileText.appendText("Otoño.\n");
        fileText.appendText("Invierno.\n");
        fileText.addLine("Lunes.");
        fileText.addLine("Martes.");
        fileText.addLine("Miércoles.");
        fileText.addLine("Jueves.");
        fileText.addLine("Viernes.");
        fileText.appendText("Invierno.\n");
        fileText.addLine("Lunes.");
        fileText.addLine("Martes.");
        fileText.addLine("Ana.");
        
        //fileText.print();
        //System.out.println(fileText.getText());
        
        //fileText.getLines().forEach(System.out::println);
        //fileText.TreeSetLines().forEach(System.out::println);
        //fileText.getLines("ma").forEach(System.out::println);
        //System.out.println(fileText.getMax());
        //System.out.println(fileText.getMin());
        //fileText.getReversedSorteredLines().forEach(System.out::println);
        //fileText.getSetLines().forEach(System.out::println);
        //fileText.getSorteredLines().forEach(System.out::println);
        
        //String texto="";
        //for(int a=0;a<=200000;a++) texto+="x";
        
        //StringBuilder
        //StringBuilder sb=new StringBuilder();
        //for(int a=0;a<=200000;a++) sb.append("x");
        
    }
}