package help;

public class sort {
        public static void SortLtoH(int[] arr){
            for (int i = 0; i < arr.length - 1; i++)
            {
                int index = i;
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
        public static void SortDate(String... args) throws ParseException {
        	  ArrayList<Date> d=new ArrayList<>();
        	  
        	  DateFormat format=new SimpleDateFormat("DD-MM-YYYY");
        	  
        	  D d1=format.parse("02-12-2001");
        	  
        	  D d2=format.parse("12-09-1999");
        	  
        	  D d3=format.parse("13-11-2016");
        	  
        	  d.add(d1);
        	  d.add(d2);
        	  d.add(d3);
        	  
        	  Collection.sort(d);
        	  
        	  d.forEach(action-> System.out.println(format.format(action)));
        	}
}
        
       
            