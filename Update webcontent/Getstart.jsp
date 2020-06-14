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
<title>CIS 122 Log Out</title>
</head>
<link rel="icon"
	href="https://www.freepngimg.com/save/16268-java-png-image/64x64">
<body>
	<form action="input.jsp" method="post">
		<b>Monthly Planner</b><br /> <b>How many Month</b><b><input
			type="number" name="MonthIndex" size="2"></b><br /> <b>Starting
			month</b><select name="month">
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
		</select> <b>Year: </b><input type="number" name="year" size="5" value="2020"><br/>
		<b>"Enter state tax rate"</b><input type="number" name="tax" value="10" size="5" />%
		<br /> <input type="reset" value="Clear" name="clear"> <input
			type="submit" value="Submit" name="submit">
	</form>
</body>
<form>
<table>
<tr><td>
<input type=button value="Back" onCLick="history.back()">
</td></tr>
</table>
</form>
</html>