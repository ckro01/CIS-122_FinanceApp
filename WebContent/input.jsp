<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="java.util.*"%>
	<%@ page import ="help.MonthConvert" %>
<!DOCTYPE html>
<html>
<style>
<!--
@import url("Formatting.css");
-->
</style>
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
<title>Finance Info</title>
<link rel="icon"
	href="https://www.freepngimg.com/save/16268-java-png-image/64x64">
</head>
<body style="overflow: scroll">
	<form name="monthForm" action="saveInputData" method="post">

		<div align="center" style="margin-top: 50px;">
			<h2 align="center">Enter Your Finances:</h2>

			<%
				List<String> months = (List<String>)request.getAttribute("months");
				int i = 0;
				for(String s : months){
					if (i == 5) {
						out.print("<br>");
					}
					i++;
					out.print(s + "\n");
				
			%>

			<b> 
			
			</b>
			<table id="table1">
				<tbody>
					<tr>
						<td>Income:</td>
						<td><input type="number" step="0.01" name=<%out.print("income" + i);%>
							value="" size="20" required/></td>
					</tr>
					<tr>
						<td>Rent:</td>
						<td><input type="number" step="0.01" name=<%out.print("rent" + i);%>
							value="" size="20" required/></td>
					</tr>
					<tr>
						<td>Cost of food:</td>
						<td><input type="number" step="0.01" name=<%out.print("food" + i);%>
							value="" size="20" required/></td>
					</tr>
					<tr>
						<td>Cost of entertainment:</td>
						<td><input type="number" step="0.01" name=<%out.print("ent" + i);%>
							value="" size="20" required/></td>
					</tr>
					<tr>
						<td>Other expenses:</td>
						<td><input type="number" step="0.01" name=<%out.print("other" + i);%>
							value="" size="20" required/></td>
					</tr>

				</tbody>
			</table>
			<%
				}
			%>
			<input type="hidden" value=<%out.print(months.size());%> name="monthsSize"></input>
			<input type=button value="Back" onCLick="history.back()"> <input
				type="reset" value="Clear" name="clear"> <input
				type="submit" value="Submit" name="submit">
	</form>
	</div>
</body>
</html>