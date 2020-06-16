package help;

public class search {
	public int[] recursionSearch(int[][] array, int searched, int col, int colLength, int index ){
        //recursion linear search
        int[] newarray = new int[colLength];

        //if not found
        if(index >= array.length){
            newarray[0] = 0;
            return newarray;
        }
        //if found
        if (array[index][col] == searched){
            //put all the value from the col to newarray
            for (int i = 0; i<colLength; i++){
                newarray[i] = array[index][i];
            }
            return newarray;
        }
        //search again
        return recursionSearch(array, searched, col, colLength, index+1);

    }
}
