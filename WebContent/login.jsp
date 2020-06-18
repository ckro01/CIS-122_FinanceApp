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
</style>
<link rel="icon" href="https://www.freepngimg.com/save/16268-java-png-image/64x64">
<meta charset="ISO-8859-1">
<title>CIS 122 Login</title>
</head>
<body>
	<div align="center" style="margin-top: 50px;">
		<h1>Login:</h1>
		<form action="login" method="post">
			<table style="with: 50%">

				<tr>
					<td>UserName</td>
					<td><input type="text" name="username" required/></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="password" required/></td>
				</tr>
			</table>
			<input type="submit" value="Login" />
		</form>
	</div>
</body>
</html>