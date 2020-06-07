<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CIS 122 Finance App W.I.P.</title>
</head>
<body>
<h2>Enter Your Information: </h2>
	<form name="infoForm" action="results.jsp" method="post">
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
			</tbody>
			</table>
	

<h2>Enter Your Finances: </h2>
		<table>
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
			<tr>
				<td>Are you employed?:</td>
				<td>
				<input type="radio" name="employed" value="Yes" />Yes
				<input type="radio" name="employed" value="No" />No
				</td>
			</tr>
			</tbody>
		</table>
	<input type="reset" value="Clear" name="clear">
	<input type="submit" value="Submit" name="submit">
	</form>



<b>Disclaimer: Project still in development.</b>
</body>
</html>