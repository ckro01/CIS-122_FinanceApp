package inputhandler;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import help.MonthConvert;
import help.printfile;

/**
 * Servlet implementation class SaveInputData
 */
@WebServlet("/saveInputData")
public class SaveInputData extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SaveInputData() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException { 

		//Linked list time :)
		//get the data from MonthIndex and store it to int monthindex
		List<Integer> index = new ArrayList<Integer>();
		File file = new File("MonthIndex.txt");
		Scanner scan = new Scanner(file); // scan file
		while (scan.hasNextLine()) {
			String line = scan.nextLine(); // scan per line
			index.add(Integer.parseInt(line));
		}
		int monthindex = index.get(0);
		scan.close();

		//get the data from tax.txt and store it to int tax
		ArrayList<Integer> taxlist = new ArrayList<Integer>();
		File filetax = new File("tax.txt");
		Scanner taxes = new Scanner(filetax); // scan file
		while (taxes.hasNextLine()) {
			String line = taxes.nextLine(); // scan per line
			taxlist.add(Integer.parseInt(line));
		}
		int tax = taxlist.get(0);
		taxes.close();

		//get the data from date.txt and store it to datelist
		ArrayList<Integer> datelist = new ArrayList<Integer>();
		File filedate = new File("date.txt");
		Scanner scandate = new Scanner(filedate); // scan file
		while (scandate.hasNextLine()) {
			String line = scandate.nextLine(); // scan per line
			datelist.add(Integer.parseInt(line));
		}
		scandate.close();	

		List<Integer> incomelist = new ArrayList<Integer>();
		List<Integer> rentlist = new ArrayList<Integer>();
		List<Integer> foodlist = new ArrayList<Integer>();
		List<Integer> entertaimentlist = new ArrayList<Integer>();
		List<Integer> otherlist = new ArrayList<Integer>();

		//get the input from input.jsp
		for(int x = 1;x<=monthindex; x++){
			//income


			int income = Integer.parseInt(request.getParameter("income"+x));
			incomelist.add(income);

			//rent expense
			int exRent = Integer.parseInt(request.getParameter("rent"+x));
			rentlist.add(exRent);

			//food expense
			int food = Integer.parseInt(request.getParameter("food"+x));
			foodlist.add(food);

			//entertaiment expense
			int entertaiment = Integer.parseInt(request.getParameter("ent"+x));
			entertaimentlist.add(entertaiment);

			//other expense
			int other = Integer.parseInt(request.getParameter("other"+x));
			otherlist.add(other);

		}

		//open file to write and collect all the data
		printfile save = new printfile();
		save.openFile("alldata.txt");


		//collect the input data in one file txt
		for(int j = 1;j<=monthindex; j++){ 
			String incomex = String.valueOf(incomelist.get(j - 1));
			String rentex = String.valueOf(rentlist.get(j - 1));
			String foodex = String.valueOf(foodlist.get(j - 1));
			String entertaimentex = String.valueOf(entertaimentlist.get(j - 1));
			String otherex = String.valueOf(otherlist.get(j - 1));
			String date = String.valueOf(datelist.get(j - 1));
			// put the data in one String
			String data = date+" "+incomex+" "+rentex+" "+foodex+" "+entertaimentex+" "+otherex+" ";
			save.addRecords(data+"\n");  //write the data to alldata.txt

			// 

		}

		save.closefile(); //close file alldata.txt %>

		//calculate Information total and Average
		//total income
		int totalincome = 0;
		for(int i=0; i<incomelist.size(); i++){
			totalincome += incomelist.get(i);
		}
		//average income
		int avgincome = totalincome/incomelist.size();

		//total expense
		int totalexpense = 0;
		for(int i=0; i<rentlist.size(); i++){
			totalexpense = totalexpense + rentlist.get(i) + foodlist.get(i) + entertaimentlist.get(i) + otherlist.get(i);
		}

		//average expense
		int avgexpense = totalexpense/rentlist.size();

		//Money left
		int moneyleft = totalincome - totalexpense;

		// Average money left
		int avgmoneyleft = moneyleft/incomelist.size();

		//After Tax
		//total income after tax
		int totalincomeAftertax = totalincome-(totalincome*tax/100);

		//avg income after tax
		int avgincomeAfterTax = avgincome - (avgincome * tax/100) ;

		//avg money left after tax
		int avgmoneyleftAftertax = avgincomeAfterTax - avgexpense;

		//total money left after tax
		int moneyleftAftertax = totalincomeAftertax - totalexpense;

		//convert date to readable String
		//call the convert Month from user input to String(jan, Feb, ..)
		MonthConvert MC = new MonthConvert();

		String[] datestr = new String[datelist.size()];
		int dindex = 0;
		for(int d : datelist){
			int month = d/10000;
			String year = String.valueOf(d%10000);
			String monthstr = MC.getendmonth(month);
			datestr[dindex] = (monthstr + " " + year);
			dindex++;
		}


		request.setAttribute("avgincome", avgincome);
		request.setAttribute("avgexpense", avgexpense);
		request.setAttribute("avgmoneyleft", avgmoneyleft);
		request.setAttribute("moneyleft", moneyleft);
		request.setAttribute("totalexpense", totalexpense);
		request.setAttribute("totalincome", totalincome);
		request.setAttribute("moneyleftAftertax", moneyleftAftertax);
		request.setAttribute("totalincomeAftertax", totalincomeAftertax);
		request.setAttribute("avgincomeAfterTax", avgincomeAfterTax);
		request.setAttribute("avgmoneyleftAftertax", avgmoneyleftAftertax);

		request.getRequestDispatcher("resultsMonth.jsp").forward(request, response);
	}

}
