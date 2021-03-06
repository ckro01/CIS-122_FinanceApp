package help;
// creating a class MonthConvert

import java.util.HashMap;
import java.util.Map;

public class MonthConvert {
	public String getendmonth(int monthNum) {
		String endmonth = "";
		switch (monthNum) {
		case 1:
			endmonth = "January"; //assigning the months 
			break;
		case 2:
			endmonth = "February";
			break;
		case 3:
			endmonth = "March";
			break;
		case 4:
			endmonth = "April";
			break;
		case 5:
			endmonth = "May";
			break;
		case 6:
			endmonth = "June";
			break;
		case 7:
			endmonth = "July";
			break;
		case 8:
			endmonth = "August";
			break;
		case 9:
			endmonth = "September";
			break;
		case 10:
			endmonth = "Ocotober";
			break;
		case 11:
			endmonth = "November";
			break;
		case 0:
			endmonth = "December";
			break;
		default:
			endmonth = "Missing Month";
		}
		return endmonth;
	}
	public String[] dateCon(int[][] alldata) {
		//Convert date from .txt(database)(12020 to January 2020)
		
		String[] newdate = new String[alldata.length];
		for (int date = 0; date < alldata.length; date++) {
			int MonthYear = alldata[date][0];
			int month = MonthYear / 10000; //get month
			int year = MonthYear % 10000; //get year
			String monthstr = getendmonth(month);
			String dateCombine = monthstr + " " + String.valueOf(year);
			newdate[date] = dateCombine;
		}
		return newdate;
	}
	
	// Charith
	//to change the value of month from number to string month(Jan, Feb, ...)
		public Map<Integer, String> getMonthMap() {
			Map<Integer, String> monthsMap = new HashMap<>();

			monthsMap.put(1, "January");
			monthsMap.put(2, "February");
			monthsMap.put(3, "March");
			monthsMap.put(4, "April");
			monthsMap.put(5, "May");
			monthsMap.put(6, "June");
			monthsMap.put(7, "July");
			monthsMap.put(8, "August");
			monthsMap.put(9, "September");
			monthsMap.put(10, "Ocotober");
			monthsMap.put(11, "November");
			monthsMap.put(0, "December");

			return monthsMap;
		}
}