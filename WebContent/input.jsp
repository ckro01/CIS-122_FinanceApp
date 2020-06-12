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
<meta charset="ISO-8859-1">
<title>Finance Info</title>
</head>
<body style="overflow: scroll">
	<form name="monthForm" action="resultsMonth.jsp" method="post">
		<%
			int bgnmonth = Integer.parseInt(request.getParameter("month")); //total of month
		%>
		String fName = request.getParameter("first"); String lName =
		request.getParameter("last"); String name = fName + " " + lName;
		String email = request.getParameter("email"); String phoneNumber =
		request.getParameter("phone"); String isEmployed =
		request.getParameter("employed");
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
		int monthIndex = 12;
		int year = 2020;
			//int monthIndex = Integer.parseInt(request.getParameter("MonthIndex"));
		//int year = Integer.parseInt(request.getParameter("year"));
		// print the otuput as many of the month(inputed in index.jsp)
		for (int i = 0; i < monthIndex; i++) {
			int monthidx = (bgnmonth + i) % 12; //made the value stay between 0-11
		%>

		<b>
			<%
				out.print(getendmonth(monthidx) + " " + year + "\n");
			// + year every 12 month
			if (monthidx == 0) {
				year += 1;
			}
			%>
		</b>
		<table id="table1">
			<tbody>
				<tr>
					<td>Income:</td>
					<td><input type="number" name="income" value="" size="20" /></td>
				</tr>
				<tr>
					<td>Rent:</td>
					<td><input type="number" name="rent" value="" size="20" /></td>
				</tr>
				<tr>
					<td>Cost of food:</td>
					<td><input type="number" name="food" value="" size="20" /></td>
				</tr>
				<tr>
					<td>Cost of entertainment:</td>
					<td><input type="number" name="ent" value="" size="20" /></td>
				</tr>
				<tr>
					<td>Other expenses:</td>
					<td><input type="number" name="other" value="" size="20" /></td>
				</tr>

			</tbody>
		</table>
		<%
			}
		%>
		<input type="reset" value="Clear" name="clear"> <input
			type="submit" value="Submit" name="submit">
	</form>
</body>
</html>