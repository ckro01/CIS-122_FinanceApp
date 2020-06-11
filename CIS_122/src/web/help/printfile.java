package help;

import java.util.Formatter;

public class printfile {
    private Formatter x;
    public void openFile(){
        try {
            x = new Formatter("MonthIndex.txt");
        } catch (Exception e){
                System.out.println("error");
        }
    }
    public void addRecords(int number){
        x.format("%s", number);
    }

    public void closefile(){
        x.close();
    }
    public void doit(){
        printfile file = new printfile();
        file.openFile();
        file.addRecords(50);
        file.closefile();
    }
}