package help;

import java.util.Formatter;
//Created a class called printfile

public class printfile {
    private Formatter x;
    public void openFile(String file){
        try {
            x = new Formatter(file);
        } catch (Exception e){
                System.out.println("error");
        }
    }
    //adding the records to the string line 
    public void addRecords(String line){
        x.format("%s", line);
    }

    public void closefile(){
        x.close();
    }
    //printing all the records of the class that were added 
    public void printx(String filex, String x){
        printfile file = new printfile();
        file.openFile(filex);
        file.addRecords(x);
        file.closefile();
    }
}