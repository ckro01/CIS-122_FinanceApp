package inputhandler;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import help.printfile;
import help.MonthConvert;

@WebServlet("/handleGetStartData")
public class HandleGetStartnputData extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public HandleGetStartnputData() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int bgnmonth = Integer.parseInt(request.getParameter("month")); //total of month

		MonthConvert mc = new MonthConvert();
		
		//get value of Month and Year from index.jsp
		int monthIndex = 1;
		monthIndex = Integer.parseInt(request.getParameter("MonthIndex"));
		int year = Integer.parseInt(request.getParameter("year"));
		// print the otuput as many of the month(inputed in index.jsp)

		//save the tax value
		printfile filetax = new printfile();
		filetax.openFile("tax.txt");
		String taxrate = request.getParameter("tax");
		filetax.addRecords(taxrate);
		filetax.closefile();

		//save the value of total month to MonthIndex.txt file
		printfile save = new printfile();
		save.openFile("MonthIndex.txt");
		save.addRecords(String.valueOf(monthIndex));
		save.closefile();
		save.openFile("date.txt"); //open file for date(for date database)

		List<String> months = new ArrayList<>();
		Map<Integer, String> monthsMap = mc.getMonthMap();

		for(int i=0; i < monthIndex; i++) {

			int monthidx = (bgnmonth + i) % 12; //made the value stay between 0-11
			months.add(monthsMap.get(monthidx) + " " + year);

		 	//save date year and month to date.txt (date database)
			 String date = String.valueOf(monthidx) + String.valueOf(year);
			 save.addRecords(date + "\n");

			// + year every 12 month
			 if (monthidx == 0) {
			 	year += 1;
			 }
		}

		save.closefile(); //close date.txt file

		request.setAttribute("year", year);
		request.setAttribute("monthIndex", monthIndex);
		request.setAttribute("bgnmonth", bgnmonth);
		request.setAttribute("months", months);

		request.getRequestDispatcher("input.jsp").forward(request, response);


	}
}
