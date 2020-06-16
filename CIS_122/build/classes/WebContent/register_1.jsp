<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" 
    "http://www.w3.org/TR/html4/loose.dtd">
<html>
<style type="text/css">
body {
	background-image:
		url('https://cdn.crunchify.com/wp-content/uploads/2013/03/Crunchify.bg_.300.png');
}
h3 {
color: red;
}
</style>

<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<link rel="icon" href="https://www.freepngimg.com/save/16268-java-png-image/64x64">
<title>CIS_122 Register</title>
</head>
<body>

	<div align="center" style="margin-top: 50px;">

		<form method="post" action="LoginCheck">
			<h2>Create Account:</h2>
		<table id="table1" style="with: 50%">
			<tbody>
				<tr>
					<td>First Name: </td>
					<td><input type="text" name="first" /></td>
				</tr>
				<tr>
					<td>Last Name: </td>
					<td><input type="text" name="last" /></td>
				</tr>
				<tr>
					<td>UserName: </td>
					<td><input type="text" name="username" /></td>
				</tr>
					<tr>
					<td>Password: </td>
					<td><input type="password" name="pass" /></td>
				</tr>
				<tr>
					<td>Address: </td>
					<td><input type="text" name="address" /></td>
				</tr>
				<tr>
					<td>Phone Number: </td>
					<td><input type="text" name="phone" /></td>
				</tr>
				<tr>
					<td>Are you employed?:</td>
					<td><input type="radio" name="employed" value="Yes" />Yes 
					<input type="radio" name="employed" value="No" />No</td>
				</tr>
			</tbody>
		</table>
		<br>
		<input type="reset" value="Clear" name="clear">
		<input type="submit" value="Create" name="submit">
		</form>
		<h3>Incorrect Information: Please Try Again!</h3>
	</div>

</body>
</html>