<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CIS 122 Finance App W.I.P.</title>
</head>
<body>
<%@page import="java.io.FileWriter" %>
<%@page import="java.io.IOException" %>


<h2>Enter Your Information: </h2>
	<form action="input.jsp" method="post">
		<table>
			<tbody>
			<tr>
				<td>First Name:</td>
				<td><input type="text" name="first" size="20" /></td>
			</tr>
			<tr>
				<td>Last Name:</td>
				<td><input type="text" name="last" size="20" /></td>
			</tr>
			<tr>
			<tr>
				<td>Email:</td>
				<td><input type="text" name="email" size="20" /></td>
			</tr>
			<tr>
				<td>Phone Number:</td>
				<td><input type="text" name="phone" value="" size="20" /></td>
			</tr>
			<tr>
				<td>Are you employed?:</td>
				<td>
				<input type="radio" name="employed" value="Yes" />Yes
				<input type="radio" name="employed" value="No" />No
				</td>
			</tr>
			</tbody>
			</table>

<b>Monthly Planner</b><br/>
<b>How many Month</b><b><input type="number" name="MonthIndex" size="2"></b><br/>

<b>Starting month</b><select name="month">
						<option value=1>January</option>
						<option value=2>February</option>
						<option value=3>March</option>
						<option value=4>April</option>
						<option value=5>May</option>
						<option value=6>June</option>
						<option value=7>July</option>
						<option value=8>August</option>
						<option value=9>September</option>
						<option value=10>October</option>
						<option value=11>November</option>
						<option value=12>December</option>
					</select>
<b>Year: </b><input type="number" name="year" size="5" value="2020">
<br/>
	<input type="reset" value="Clear" name="clear">
	<input type="submit" value="Submit" name="submit">
	</form>
<b>Disclaimer: Project still in development.</b>
</body>
</html>