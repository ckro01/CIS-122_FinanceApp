package help;


import java.util.Arrays;
import java.util.Comparator;

public class sort2d {
    public static void sortbyColumnLtoH(int array[][], int coloumn)
    {
        //sort array from small to highest number
        // Use Arrays.sort
        Arrays.sort(array, new Comparator<int[]>() {

            @Override
            // Compare element in array column
            public int compare(final int[] element1,
                               final int[] element2) {

                // descending order sort
                if (element1[coloumn] > element2[coloumn])
                    return 1;
                else
                    return -1;
            }
        });  // close sortbyColumnLtoH
    }
    public static void sortbyColumnHtoL(int array[][], int coloumn)
    {
        //sort array from highest to smallest
        // Use Arrays.sort
        Arrays.sort(array, new Comparator<int[]>() {

            @Override
            // Compare element in array column
            public int compare(final int[] entry1,
                               final int[] entry2) {

                // ascending order sort
                if (entry1[coloumn] < entry2[coloumn])
                    return 1;
                else
                    return -1;
            }
        });  // close the sortbycolumnHtoL
    }
}