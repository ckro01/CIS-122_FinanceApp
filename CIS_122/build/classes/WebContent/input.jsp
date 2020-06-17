<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
	<%@ page import ="help.MonthConvert" %>
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
<link rel="icon"
	href="https://www.freepngimg.com/save/16268-java-png-image/64x64">
</head>
<body style="overflow: scroll">
	<form name="monthForm" action="resultsMonth.jsp" method="post">
		<%
			int bgnmonth = Integer.parseInt(request.getParameter("month")); //total of month
		%>

		<% //call the convert Month from user input to String(jan, Feb, ..)
		MonthConvert MC = new MonthConvert();%>
		<div align="center" style="margin-top: 50px;">
			<h2 align="center">Enter Your Finances:</h2>

			<%
				//get value of Month and Year from index.jsp
			int monthIndex = 1;
			monthIndex = Integer.parseInt(request.getParameter("MonthIndex"));
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
 	out.print(MC.getendmonth(monthidx) + " " + year + "\n");
 // + year every 12 month
 if (monthidx == 0) {
 	year += 1;
 }
 %> <%
 	//save date year and month to date.txt (date database)
 String date = String.valueOf(monthidx) + String.valueOf(year);
 save.addRecords(date + "\n");
 %>
			</b>
			<table id="table1">
				<tbody>
					<tr>
						<td>Income:</td>
						<td><input type="number" step="0.01" name=<%out.print("income" + i);%>
							value="" size="20" required/></td>
					</tr>
					<tr>
						<td>Rent:</td>
						<td><input type="number" step="0.01" name=<%out.print("rent" + i);%>
							value="" size="20" required/></td>
					</tr>
					<tr>
						<td>Cost of food:</td>
						<td><input type="number" step="0.01" name=<%out.print("food" + i);%>
							value="" size="20" required/></td>
					</tr>
					<tr>
						<td>Cost of entertainment:</td>
						<td><input type="number" step="0.01" name=<%out.print("ent" + i);%>
							value="" size="20" required/></td>
					</tr>
					<tr>
						<td>Other expenses:</td>
						<td><input type="number" step="0.01" name=<%out.print("other" + i);%>
							value="" size="20" required/></td>
					</tr>

				</tbody>
			</table>
			<%
				}
			%>
			<%
				save.closefile(); //close date.txt file
			%>
			<input type=button value="Back" onCLick="history.back()"> <input
				type="reset" value="Clear" name="clear"> <input
				type="submit" value="Submit" name="submit">
	</form>
	</div>
</body>
</html>