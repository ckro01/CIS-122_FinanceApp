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
	String fName = request.getParameter("first");
String lName = request.getParameter("last");
String name = fName + " " + lName;
String email = request.getParameter("email");
String phoneNumber = request.getParameter("phone");
int income = Integer.parseInt(request.getParameter("income"));
int rent = Integer.parseInt(request.getParameter("rent"));
String isEmployed = request.getParameter("employed");
int cFood = Integer.parseInt(request.getParameter("food"));
int cEnt = Integer.parseInt(request.getParameter("ent"));
int cOther = Integer.parseInt(request.getParameter("other"));
%>
<body>
	<h1>Information</h1>

	<table border="1">
		<tbody>
			<tr>
				<td>Name:</td>
				<td><%=name%></td>
			</tr>
			<tr>
				<td>Email:</td>
				<td><%=email%></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><%=phoneNumber%></td>
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
				<td>Are you employed:</td>
				<td><%=isEmployed%></td>
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