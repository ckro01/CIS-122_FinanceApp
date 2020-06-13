<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ page import="help.sort2d"%>
<%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@ page import="help.printfile"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
body {
	background-image:
		url('https://cdn.crunchify.com/wp-content/uploads/2013/03/Crunchify.bg_.300.png');
}

h3 {
	color: red;
}
</style>
<meta charset="ISO-8859-1">
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

<title>Insert title here</title>
</head>
<body>
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

	int[][] alldata = new int[datalist.size()][7];
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
			alldata[i][col] = Integer.parseInt(splited[col]);
		}
		alldata[i][6] = Integer.parseInt(String.valueOf(totalexpense));
	}
	//
	%>
	<%
		//check the option user inputed
	int user = Integer.parseInt(request.getParameter("sortoption"));
	sort2d sort = new sort2d();

	if (user == 1) {
		%>
		<b>Sort by Total expense form Highest to Lowest</b>
		<%
		//sort total expense Highest to Lowest
		int col = 7; //total expense column
		sort.sortbyColumnHtoL(alldata, col - 1); //sort

		//fix date ex.(Jan 2020)
		String[] newdate = new String[alldata.length];
		for (int date = 0; date < alldata.length; date++) {
			int MonthYear = alldata[date][0];
			int month = MonthYear / 10000; //get month
			int year = MonthYear % 10000; //get year
			String monthstr = getendmonth(month);
			String dateCombine = monthstr + " " + String.valueOf(year);
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
	<br />
	<%
		}
	} else if (user == 2) {
		%>
		<b>Sort by Total Expense form Lowest to Highest</b>
		<%
		//sort total expesne Lowest to Highest
		int col = 7; //total expense column
		sort.sortbyColumnLtoH(alldata, col - 1); //sort

		//fix date ex.(Jan 2020)
		String[] newdate = new String[alldata.length];
		for (int date = 0; date < alldata.length; date++) {
			int MonthYear = alldata[date][0];
			int month = MonthYear / 10000; //get month
			int year = MonthYear % 10000; //get year
			String monthstr = getendmonth(month);
			String dateCombine = monthstr + " " + String.valueOf(year);
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
	<br />
	<%
		}
	} else if(user == 3){
		%>
		<b>Sort by Income form Highest to Lowest</b>
		<%
		//sort income Highest to Lowest
				int col = 2; //income column
				sort.sortbyColumnHtoL(alldata, col - 1); //sort

				//fix date ex.(Jan 2020)
				String[] newdate = new String[alldata.length];
				for (int date = 0; date < alldata.length; date++) {
					int MonthYear = alldata[date][0];
					int month = MonthYear / 10000; //get month
					int year = MonthYear % 10000; //get year
					String monthstr = getendmonth(month);
					String dateCombine = monthstr + " " + String.valueOf(year);
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
			<br />
			<%
	}
	} else if(user == 4){
		%>
		<b>Sort by Income form Lowest to Highest</b>
		<%
		//sort income Lowest to Highest
				int col = 2; //income column
				sort.sortbyColumnLtoH(alldata, col - 1); //sort

				//fix date ex.(Jan 2020)
				String[] newdate = new String[alldata.length];
				for (int date = 0; date < alldata.length; date++) {
					int MonthYear = alldata[date][0];
					int month = MonthYear / 10000; //get month
					int year = MonthYear % 10000; //get year
					String monthstr = getendmonth(month);
					String dateCombine = monthstr + " " + String.valueOf(year);
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
			<br />
			<%
	}
	}
	%>
<!-- Back Button -->
<form>
<table>
<tr><td>
<input type=button value="Back" onCLick="history.back()">
</td></tr>
</table>
</form>
</body>
</html>