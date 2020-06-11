<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<form name="infoForm" action="results.jsp" method="post">
<% int bgnmonth = Integer.parseInt(request.getParameter("month")); //total of month%>

<%@page import="help.printfile" %>
<% //save the value of total month to MonthIndex.txt file
printfile save = new printfile();
save.doit();
%>
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
        case 0: endmonth = "December";
        break;
        default: endmonth = "Missing Month";
}
return endmonth;
}
%>
<% //get value of Month and Year from index.jsp
int monthIndex = Integer.parseInt(request.getParameter("MonthIndex"));
	int year = Integer.parseInt(request.getParameter("year"));

// print the otuput as many of the month(inputed in index.jsp)
for(int i = 0; i<monthIndex; i++){ %>

	<h2>Enter Your Finances: </h2>
	
	<% int monthidx = (bgnmonth+i)%12; //made the value stay between 0-11%>
	
	<b><% out.print(getendmonth(monthidx)+" "+year);
	 // + year every 12 month
		if(monthidx == 0){
			year += 1;}%></b>
		<table>
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
				<td><input type="number" name=name=<%out.print("other"+i);%> value="" size="20" /></td>
			</tr>

			</tbody>
		</table>
	<% } %>
	<input type="reset" value="Clear" name="clear">
	<input type="submit" value="Submit" name="submit">
	</form>
</body>
</html>