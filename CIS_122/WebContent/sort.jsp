<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@ page import="help.printfile"%>
<%@ page import="help.sort"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%!
//to cahange the value of month from number to string month(Jan, Feb, ...)
public String getendmonth(int monthNum){
String endmonth = "";
switch(monthNum){
        case 1: endmonth = "January";
        break;
        case 2: endmonth = "February";
        break;
        case 3: endmonth = "March";
        break;
        case 4: endmonth = "April";
        break;
        case 5: endmonth = "May";
        break;
        case 6: endmonth = "June";
        break;
        case 7: endmonth = "July";
        break;
        case 8: endmonth = "August";
        break;
        case 9: endmonth = "September";
        break;
        case 10: endmonth = "Ocotober";
        break;
        case 11: endmonth = "November";
        break;
        case 12: endmonth = "December";
        break;
        default: endmonth = "Missing Month";
}
return endmonth;
}
%>
	<%
	
		//get the data from alldata.txt and store it to datelist
	ArrayList<String> datalist = new ArrayList<String>();
	File filedata = new File("alldata.txt");
	Scanner scandata = new Scanner(filedata); // scan file
	while (scandata.hasNextLine()) {
		String line = scandata.nextLine(); // scan per line
		datalist.add(line);
	}
	scandata.close();

	String[][] alldata = new String[datalist.size()][7];
	int[] income = new int[datalist.size()];
	int[] expense = new int[datalist.size()];

	//put the Arraylist data in sperated form 2d array
	for (int i = 0; i < datalist.size(); i++) {
		String line = datalist.get(i);
		String[] splited = line.split("\\s+");

		//conver expense data to int
		int rent = Integer.parseInt(splited[2]);
		int food = Integer.parseInt(splited[3]);
		int entertaiment = Integer.parseInt(splited[4]);
		int other = Integer.parseInt(splited[5]);
		int totalexpense = rent + food + entertaiment + other;

		//add data income only
		income[i] = Integer.parseInt(splited[1]);

		//add data expense only
		expense[i] = totalexpense;

		//add data to all data
		for (int col = 0; col < splited.length; col++) {
			alldata[i][col] = splited[col];
		}
		alldata[i][6] = String.valueOf(totalexpense);
	}
	//
	%>
	<%
		//check the option user inputed
	int user = Integer.parseInt(request.getParameter("sortoption"));
	sort sortselect = new sort();

	if (user == 1) {
		//sort by income from high to low
				sortselect.SortHtoL(expense);

				String[][] expensesorted = new String[expense.length][7];

				for (int x = 0; x < income.length; x++) {
					for (int z = 0; z < alldata.length; z++) {
				String listval = String.valueOf(expense[x]);
				if (alldata[z][6].equals(listval)) { //if the ori data equals to sorted data
					//if the data1(data that will be inputed) not in data2(sorted and reorganized data);
					expensesorted[x][0] = alldata[z][0];
					expensesorted[x][1] = alldata[z][1];
					expensesorted[x][2] = alldata[z][2];
					expensesorted[x][3] = alldata[z][3];
					expensesorted[x][4] = alldata[z][4];
					expensesorted[x][5] = alldata[z][5];
					expensesorted[x][6] = alldata[z][6];
					for (int f = 0; f < 6; f++) { // clear/pop the data that already assigned 
						alldata[z][f] = "0";
					}
					break;
				}
					}
				}
				//fix date ex.(Jan 2020)
				String[] newdate = new String[expensesorted.length];
				for (int date=0; date<expensesorted.length; date++){
					int MonthYear = Integer.parseInt(expensesorted[date][0]);
					int month = MonthYear/10000; //get month
					int year = MonthYear%10000; //get year
					String monthstr = getendmonth(month);
					String dateCombine = monthstr+" "+String.valueOf(year);
					newdate[date] = dateCombine;
				}
				
				
				//print out
				for (int row = 0; row < expensesorted.length; row++) {
			%>
			<table border="1">
				<tbody>
					<tr>
						<td>Date</td>
						<td><%=newdate[row]%></td>
					</tr>
					<tr>
						<td>Income:</td>
						<td><%=expensesorted[row][1]%></td>
					</tr>
					<tr>
						<td>Total Expense:</td>
						<td><%=expensesorted[row][6]%></td>
					</tr>
					<tr>
						<td>Rent:</td>
						<td><%=expensesorted[row][2]%></td>
					</tr>
					<tr>
						<td>Cost of Food:</td>
						<td><%=expensesorted[row][3]%></td>
					</tr>
					<tr>
						<td>Cost of Entertainment:</td>
						<td><%=expensesorted[row][4]%></td>
					</tr>
					<tr>
						<td>Other Expenses:</td>
						<td><%=expensesorted[row][5]%></td>
					</tr>
				</tbody>
			</table>
			<br/>
			<% }

	} else if (user == 2) {
		sortselect.SortLtoH(expense);

		String[][] expensesorted = new String[expense.length][7];

		//sort the data in order of income sorted
		for (int x = 0; x < expense.length; x++) {
			for (int z = 0; z < alldata.length; z++) {
		String listval = String.valueOf(expense[x]);
		if (alldata[z][6].equals(listval)) { //if the ori data equals to sorted data
			//if the data1(data that will be inputed) not in data2(sorted and reorganized data);
			if (!alldata[z][0].equals(expensesorted[z][0])) {
				expensesorted[x][0] = alldata[z][0];
				expensesorted[x][1] = alldata[z][1];
				expensesorted[x][2] = alldata[z][2];
				expensesorted[x][3] = alldata[z][3];
				expensesorted[x][4] = alldata[z][4];
				expensesorted[x][5] = alldata[z][5];
				expensesorted[x][6] = alldata[z][6];
				break;
			}
		}
			}
		} //close for income.lengrh
	%>
	<%
	//fix date ex.(Jan 2020)
	String[] newdate = new String[expensesorted.length];
	for (int date=0; date<expensesorted.length; date++){
		int MonthYear = Integer.parseInt(expensesorted[date][0]);
		int month = MonthYear/10000; //get month
		int year = MonthYear%10000; //get year
		String monthstr = getendmonth(month);
		String dateCombine = monthstr+" "+String.valueOf(year);
		newdate[date] = dateCombine;
	}
	
	
	//print out
	for (int row = 0; row < expensesorted.length; row++) {
	%>
	<table border="1">
		<tbody>
			<tr>
				<td>Date</td>
				<td><%=newdate[row]%></td>
			</tr>
			<tr>
				<td>Income:</td>
				<td><%=expensesorted[row][1]%></td>
			</tr>
			<tr>
				<td>Total Expense:</td>
				<td><%=expensesorted[row][6]%></td>
			</tr>
			<tr>
				<td>Rent:</td>
				<td><%=expensesorted[row][2]%></td>
			</tr>
			<tr>
				<td>Cost of Food:</td>
				<td><%=expensesorted[row][3]%></td>
			</tr>
			<tr>
				<td>Cost of Entertainment:</td>
				<td><%=expensesorted[row][4]%></td>
			</tr>
			<tr>
				<td>Other Expenses:</td>
				<td><%=expensesorted[row][5]%></td>
			</tr>
		</tbody>
	</table>
	<br/>
	<%
		}
	%>
	<%
	} else if (user == 3) {
		//sort by income from high to low
		sortselect.SortHtoL(income);

		String[][] incomesorted = new String[income.length][7];

		for (int x = 0; x < income.length; x++) {
			for (int z = 0; z < alldata.length; z++) {
		String listval = String.valueOf(income[x]);
		if (alldata[z][1].equals(listval)) { //if the ori data equals to sorted data
			//if the data1(data that will be inputed) not in data2(sorted and reorganized data);
			incomesorted[x][0] = alldata[z][0];
			incomesorted[x][1] = alldata[z][1];
			incomesorted[x][2] = alldata[z][2];
			incomesorted[x][3] = alldata[z][3];
			incomesorted[x][4] = alldata[z][4];
			incomesorted[x][5] = alldata[z][5];
			incomesorted[x][6] = alldata[z][6];
			for (int f = 0; f < 6; f++) { // clear/pop the data that already assigned 
				alldata[z][f] = "0";
			}
			break;
		}
			}
		}
		
		//fix date ex.(Jan 2020)
		String[] newdate = new String[incomesorted.length];
		for (int date=0; date<incomesorted.length; date++){
			int MonthYear = Integer.parseInt(incomesorted[date][0]);
			int month = MonthYear/10000; //get month
			int year = MonthYear%10000; //get year
			String monthstr = getendmonth(month);
			String dateCombine = monthstr+" "+String.valueOf(year);
			newdate[date] = dateCombine;
		}
		
		//print out
		for (int row = 0; row < incomesorted.length; row++) {
	%>
	<table border="1">
		<tbody>
			<tr>
				<td>Date</td>
				<td><%=newdate[row]%></td>
			</tr>
			<tr>
				<td>Income:</td>
				<td><%=incomesorted[row][1]%></td>
			</tr>
			<tr>
				<td>Total Expense:</td>
				<td><%=incomesorted[row][6]%></td>
			</tr>
			<tr>
				<td>Rent:</td>
				<td><%=incomesorted[row][2]%></td>
			</tr>
			<tr>
				<td>Cost of Food:</td>
				<td><%=incomesorted[row][3]%></td>
			</tr>
			<tr>
				<td>Cost of Entertainment:</td>
				<td><%=incomesorted[row][4]%></td>
			</tr>
			<tr>
				<td>Other Expenses:</td>
				<td><%=incomesorted[row][5]%></td>
			</tr>
		</tbody>
	</table>
	<br/>
	<%
		}
	} //close if (3)
	else if (user == 4) {
		sortselect.SortLtoH(income);

		String[][] incomesorted = new String[income.length][7];

		//sort the data in order of income sorted
		for (int x = 0; x < income.length; x++) {
			for (int z = 0; z < alldata.length; z++) {
		String listval = String.valueOf(income[x]);
		if (alldata[z][1].equals(listval)) { //if the ori data equals to sorted data
			//if the data1(data that will be inputed) not in data2(sorted and reorganized data);
			if (!alldata[z][0].equals(incomesorted[z][0])) {
				incomesorted[x][0] = alldata[z][0];
				incomesorted[x][1] = alldata[z][1];
				incomesorted[x][2] = alldata[z][2];
				incomesorted[x][3] = alldata[z][3];
				incomesorted[x][4] = alldata[z][4];
				incomesorted[x][5] = alldata[z][5];
				incomesorted[x][6] = alldata[z][6];
				break;
			}
		}
			}
		} //close for income.lengrh
	%>
	<%
	//fix date ex.(Jan 2020)
	String[] newdate = new String[incomesorted.length];
	for (int date=0; date<incomesorted.length; date++){
		int MonthYear = Integer.parseInt(incomesorted[date][0]);
		int month = MonthYear/10000; //get month
		int year = MonthYear%10000; //get year
		String monthstr = getendmonth(month);
		String dateCombine = monthstr+" "+String.valueOf(year);
		newdate[date] = dateCombine;
	}
	
		//print out
	for (int row = 0; row < incomesorted.length; row++) {
	%>
	<table border="1">
		<tbody>
			<tr>
				<td>Date</td>
				<td><%=newdate[row]%></td>
			</tr>
			<tr>
				<td>Income:</td>
				<td><%=incomesorted[row][1]%></td>
			</tr>
			<tr>
				<td>Total Expense:</td>
				<td><%=incomesorted[row][6]%></td>
			</tr>
			<tr>
				<td>Rent:</td>
				<td><%=incomesorted[row][2]%></td>
			</tr>
			<tr>
				<td>Cost of Food:</td>
				<td><%=incomesorted[row][3]%></td>
			</tr>
			<tr>
				<td>Cost of Entertainment:</td>
				<td><%=incomesorted[row][4]%></td>
			</tr>
			<tr>
				<td>Other Expenses:</td>
				<td><%=incomesorted[row][5]%></td>
			</tr>
		</tbody>
	</table>
	<br/>
	
	<% }
		} else if (user == 5) {
			//fix date ex.(Jan 2020)
			String[] newdate = new String[alldata.length];
			for (int date=0; date<alldata.length; date++){
				int MonthYear = Integer.parseInt(alldata[date][0]);
				int month = MonthYear/10000; //get month
				int year = MonthYear%10000; //get year
				String monthstr = getendmonth(month);
				String dateCombine = monthstr+" "+String.valueOf(year);
				newdate[date] = dateCombine;
			}
			
			//print out
			for (int row = 0; row < alldata.length; row++) {
				%>
				<table border="1">
					<tbody>
						<tr>
							<td>Date</td>
							<td><%=newdate[row]%></td>
						</tr>
						<tr>
							<td>Income:</td>
							<td><%=alldata[row][1]%></td>
						</tr>
						<tr>
							<td>Total Expense:</td>
							<td><%=alldata[row][6]%></td>
						</tr>
						<tr>
							<td>Rent:</td>
							<td><%=alldata[row][2]%></td>
						</tr>
						<tr>
							<td>Cost of Food:</td>
							<td><%=alldata[row][3]%></td>
						</tr>
						<tr>
							<td>Cost of Entertainment:</td>
							<td><%=alldata[row][4]%></td>
						</tr>
						<tr>
							<td>Other Expenses:</td>
							<td><%=alldata[row][5]%></td>
						</tr>
					</tbody>
				</table>
				<br/>
<%
			}
	}
	%>



</body>
</html>