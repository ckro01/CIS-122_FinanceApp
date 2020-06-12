<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Information</title>
</head>
<style>
<!--
@import url("Formatting.css");
-->
</style>
<%
	int income = Integer.parseInt(request.getParameter("income"));
int rent = Integer.parseInt(request.getParameter("rent"));
int cFood = Integer.parseInt(request.getParameter("food"));
int cEnt = Integer.parseInt(request.getParameter("ent"));
int cOther = Integer.parseInt(request.getParameter("other"));
%>
<body>
	<h3>Is the following information correct? If not, please go back</h3>
	<form name="continue" method="post" action="processing.jsp" ]>
		<input type="submit" value="Continue" name="submit">
	</form>
	<table id="table1">
		<tbody>
			<tr>
				<td>Name:</td>
				<td></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td></td>
			</tr>
			<tr>
				<td>Are you employed:</td>
				<td></td>
			</tr>
			<tr>
				<td>Income:</td>
				<td><%=income%></td>
			</tr>
			<tr>
				<td>Rent:</td>
				<td><%=rent%></td>
			</tr>

			<tr>
				<td>Cost of Food:</td>
				<td><%=cFood%></td>
			</tr>
			<tr>
				<td>Cost of Entertainment:</td>
				<td><%=cEnt%></td>
			</tr>
			<tr>
				<td>Other Expenses:</td>
				<td><%=cOther%></td>
			</tr>
		</tbody>
	</table>
</body>
</html>