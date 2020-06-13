<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
<!DOCTYPE html>
<html>
<style>
<!--
@import url("Formatting.css");
-->
</style>
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
<title>Finance Info</title>
</head>
<body style="overflow: scroll">
	<form name="monthForm" action="resultsMonth.jsp" method="post">
		<%
			int bgnmonth = Integer.parseInt(request.getParameter("month")); //total of month
		%>

		<%!//to change the value of month from number to string month(Jan, Feb, ...)
	public String getendmonth(int monthNum) {
		String endmonth = "";
		switch (monthNum) {
		case 1:
			endmonth = "January";
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
	}%>
		<h2>Enter Your Finances:</h2>

		<%
			//get value of Month and Year from index.jsp
		int monthIndex = Integer.parseInt(request.getParameter("MonthIndex"));
		int year = Integer.parseInt(request.getParameter("year"));
		// print the otuput as many of the month(inputed in index.jsp)
		%>
		<%@page import="help.printfile"%>
		<%
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
		%>
		<%
			for (int i = 0; i < monthIndex; i++) {
			if (i == 5) {
				out.print("<br>");
			}
			int monthidx = (bgnmonth + i) % 12; //made the value stay between 0-11
		%>

		<b> <%
 	out.print(getendmonth(monthidx) + " " + year + "\n");
 // + year every 12 month
 if (monthidx == 0) {
 	year += 1;
 }
 %>
<% //save date year and month to date.txt (date database)
		String date = String.valueOf(monthidx) + String.valueOf(year);
		save.addRecords(date+"\n");
		%>
		</b>
		<table id="table1">
			<tbody>
				<tr>
					<td>Income:</td>
					<td><input type="number" name=<%out.print("income"+i); %> value="" size="20" /></td>
				</tr>
				<tr>
					<td>Rent:</td>
					<td><input type="number" name=<%out.print("rent"+i); %> value="" size="20" /></td>
				</tr>
				<tr>
					<td>Cost of food:</td>
					<td><input type="number" name=<%out.print("food"+i); %> value="" size="20" /></td>
				</tr>
				<tr>
					<td>Cost of entertainment:</td>
					<td><input type="number" name=<%out.print("ent"+i); %> value="" size="20" /></td>
				</tr>
				<tr>
					<td>Other expenses:</td>
					<td><input type="number" name=<%out.print("other"+i); %> value="" size="20" /></td>
				</tr>

			</tbody>
		</table>
		<%
			}
		%>
			<% save.closefile(); //close date.txt file %>
		<input type="reset" value="Clear" name="clear"> <input
			type="submit" value="Submit" name="submit">
	</form>
</body>
</html>