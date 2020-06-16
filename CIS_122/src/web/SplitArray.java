package web;
import java.util.Arrays;
public class SplitArray {
	public static int[][] splitArray(int[] arrayToSplit, int chunkSize) {
		if (chunkSize<=0) {
			return null;
		}
		int remainder = arrayToSplit.length % chunkSize;
		int chunks = arrayToSplit.length / chunkSize + (remainder > 0 ? 1 : 0);
		int[][] arrays=new int [chunks][];
		for(int i = 0; i < (remainder > 0 ? chunks - 1 : chunks); i++) {
			arrays[i] = Arrays.copyOfRange(arrayToSplit, i * chunkSize, i * chunkSize + chunkSize);
		}
		if(remainder > 0) {
			arrays[chunks - 1] = Arrays.copyOfRange(arrayToSplit, (chunks-1) * chunkSize, (chunks - 1) * chunkSize + remainder);
		}
		return arrays;
	}
}
