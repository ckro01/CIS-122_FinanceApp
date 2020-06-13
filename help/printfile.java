package help;

import java.util.Formatter;

public class printfile {
    private Formatter x;
    public void openFile(String file){
        try {
            x = new Formatter(file);
        } catch (Exception e){
                System.out.println("error");
        }
    }
    public void addRecords(String line){
        x.format("%s", line);
    }

    public void closefile(){
        x.close();
    }
    public void printx(String filex, String x){
        printfile file = new printfile();
        file.openFile(filex);
        file.addRecords(x);
        file.closefile();
    }
}