package help;

// created a class 'sort' so that the program would sort the arrays in different ways 
// sorting lower to higher  


public class sort {
	
	
	
        public static void SortLtoH(int[] arr){
            for (int i = 0; i < arr.length - 1; i++)
            {
                int index = i;  // defining the integer index value in form of a variable
                
                for (int j = i + 1; j < arr.length; j++){
                    if (arr[j] < arr[index]){
                        index = j;//searching for lowest index
                    }
                }
                int smallerNumber = arr[index];
                arr[index] = arr[i];
                arr[i] = smallerNumber;
            }
        }
        //sorting higher to lower
        public static void SortHtoL(int[] arr){
            for (int i = 0; i < arr.length - 1; i++)
            {
                int index = i;
                for (int j = i + 1; j < arr.length; j++){
                    if (arr[j] > arr[index]){
                        index = j;//searching for lowest index
                    }
                }
                int smallerNumber = arr[index];
                arr[index] = arr[i];
                arr[i] = smallerNumber;
            }
        }
        
        // sorting by date i.e Datesort 
        public void Datesort(int arr[][], int col, int end)
        {
            int[] temp = new int[col];
            int start = 0;

            while (start < end)
            {
                for(int i=0; i<col; i++) {
                    temp[i] =arr[start][i];
                    arr[start][i]=arr[end][i];
                    arr[end][i] =temp[i];
                }
                    start++;
                    end--;
                }
        }
}