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
<%@ page import="help.printfile, help.MonthConvert, help.sort"%>
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


<title>Sorted Tables</title>
<link rel="icon"
	href="https://www.freepngimg.com/save/16268-java-png-image/64x64">
</head>
<body>
	<div align="center" style="margin-top: 50px;">
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
		//call the convert Month from user input to String(jan, Feb, ..)
		MonthConvert MC = new MonthConvert();

		//check the option user inputed
		int user = Integer.parseInt(request.getParameter("sortoption"));
		sort2d sort = new sort2d();

		if (user == 1) {
		%>

		<h3>Sort by Total expense from Highest to Lowest</h3>
		<br>
		<%
			//sort total expense Highest to Lowest
		int col = 7; //total expense column
		sort.sortbyColumnHtoL(alldata, col - 1); //sort

		} else if (user == 2) {
		%>
		<b>Sort by Total Expense from Lowest to Highest</b>
		<%
			//sort total expesne Lowest to Highest
		int col = 7; //total expense column
		sort.sortbyColumnLtoH(alldata, col - 1); //sort

		} else if (user == 3) {
		%>
		<b>Sort by Income from Highest to Lowest</b>
		<%
			//sort income Highest to Lowest
		int col = 2; //income column
		sort.sortbyColumnHtoL(alldata, col - 1); //sort

		} else if (user == 4) {
		%>
		<b>Sort by Income from Lowest to Highest</b>
		<%
			//sort income Lowest to Highest
		int col = 2; //income column
		sort.sortbyColumnLtoH(alldata, col - 1); //sort

		} else if (user == 5) {
		%>
		<b>Sort by rent expenses from Highest to lowest</b>
		<%
			//sort income Lowest to Highest
		int col = 3; //rent column
		sort.sortbyColumnHtoL(alldata, col - 1); //sort

		} else if (user == 6) {
		%>
		<b>Sort by rent expense from Lowest to Highest</b>
		<%
			//sort income Lowest to Highest
		int col = 3; //rent column
		sort.sortbyColumnLtoH(alldata, col - 1); //sort

		} else if (user == 7) {
		%>
		<b>Sort by food expenses from Highest to lowest</b>
		<%
			//sort income Lowest to Highest
		int col = 4; //food column
		sort.sortbyColumnHtoL(alldata, col - 1); //sort

		} else if (user == 8) {
		%>
		<b>Sort by food expense from Lowest to Highest</b>
		<%
			//sort income Lowest to Highest
		int col = 4; //food column
		sort.sortbyColumnLtoH(alldata, col - 1); //sort

		} else if (user == 9) {
		%>
		<b>Sort by entertainment expenses from Highest to lowest</b>
		<%
			//sort income Lowest to Highest
		int col = 5; //entertainment column
		sort.sortbyColumnHtoL(alldata, col - 1); //sort

		} else if (user == 10) {
		%>
		<b>Sort by entertainment expense from Lowest to Highest</b>
		<%
			//sort income Lowest to Highest
		int col = 5; //income column
		sort.sortbyColumnLtoH(alldata, col - 1); //sort

		} else if (user == 11) {
		%>
		<b>Sort by other expenses from Highest to lowest</b>
		<%
			//sort income Lowest to Highest
		int col = 6; //other column
		sort.sortbyColumnHtoL(alldata, col - 1); //sort

		} else if (user == 12) {
		%>
		<b>Sort by other expense from Lowest to Highest</b>
		<%
			//sort income Lowest to Highest
		int col = 6; //other column
		sort.sortbyColumnLtoH(alldata, col - 1); //sort

		} else if (user == 13) {

		} else if (user == 14) {
			sort st = new sort();
			st.Datesort(alldata, 6, alldata.length-1);
		}
		%>
		<%
			//fix date ex.(Jan 2020)
		String[] newdate = MC.dateCon(alldata);

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
		<%
			}
		%>
		<input type=button value="Back" onCLick="history.back()">
		<br />
		
	</div>
</body>
</html>