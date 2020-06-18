<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
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
<title>Getting Started</title>
</head>
<link rel="icon"
	href="https://www.freepngimg.com/save/16268-java-png-image/64x64">
<body>
	<div align="center" style="margin-top: 50px;">
		<form action="handleGetStartData" method="post">
			<h1>Monthly Planner</h1>
			<table>
				<tbody>
					<tr>
						<td>How Many Months Do You Have Information For:</td>
						<td><input type="number" name="MonthIndex" size="2" min="1"
							value="1" required></td>
					</tr>
					<tr>
						<td>Starting Month:</td>
						<td><select name="month">
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
						</select></td>
					<tr>
						<td>Year:</td>
						<td><input type="number" name="year" size="5" value="2020"
							required></td>
					</tr>
					<tr>
						<td>Enter State Tax Rate:</td>
						<td><input type="number" name="tax" value="10" size="5"
							required />%</td>
					</tr>
				</tbody>
			</table>
			<br> <input type=button value="Back" onCLick="history.back()">
			<input type="reset" value="Clear" name="clear"> <input
				type="submit" value="Submit" name="submit">
		</form>
</body>
</html>