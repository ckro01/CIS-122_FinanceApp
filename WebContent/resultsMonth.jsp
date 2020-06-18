<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
 %>

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
<title>Information</title>
<link rel="icon" href="https://www.freepngimg.com/save/16268-java-png-image/64x64">
</head>


<body>
<div align="center" style="margin-top: 50px;">

<h3> Your Financial Data: </h3>
<table>
		<tbody>
			<tr>
				<td>Average Income:</td>
				<td><%=request.getAttribute("avgincome") %></td>
			</tr>
			<tr>
				<td>Average Total Expenses: </td>
				<td><%=request.getAttribute("avgexpense") %></td>
			</tr>
			<tr>
				<td>Average Money Leftover: </td>
				<td><%=request.getAttribute("avgmoneyleft") %></td>
			</tr>
			<tr>
				<td>Total Money Left: </td>
				<td><%=request.getAttribute("moneyleft") %></td>
			</tr>
			<tr>
				<td>Total Income: </td>
				<td><%=request.getAttribute("totalincome") %></td>
			</tr>
			<tr>
				<td>Total Expenses: </td>
				<td><%=request.getAttribute("moneyleftAftertax") %></td>
			</tr>
			<tr>
				<td>Total Income After Tax:</td>
				<td><%=request.getAttribute("totalincomeAftertax") %></td>
			</tr>
			<tr>
				<td>Average Income After Tax: </td>
				<td><%=request.getAttribute("avgincomeAfterTax") %></td>
			</tr>
			<tr>
				<td>Average Money leftover After Tax: </td>
				<td><%=request.getAttribute("avgmoneyleftAftertax") %></td>
			</tr>
			<tr>
				<td>Total Money Left After Tax: </td>
				<td><%=request.getAttribute("moneyleft") %></td>
			</tr>
			</tbody>
	</table>
<br>
<b>Data Viewing: </b><br/><br>

<form action="searched.jsp" method="post">
<table>
<tbody>
<tr>
<th>Search for a certain month: </th><th>
<input type="number" name="Month" value="" placeholder="MM" size="3" /><input type="number" name="Year" value="" placeholder="YYYY" size="5" />
<input type="submit" value="submit" name="View">
</th>
</tr>
</tbody>
</table>
</form>
<br/>
<form action="sort.jsp" method="post">
<table>
<tr>
<th>View Data, Sort By: </th><th><select name="sortoption">
						<option value=1>High to Low Expenses</option>
						<option value=2>Low to High Expenses</option>
						<option value=3>High to Low Income</option>
						<option value=4>Low to High Income</option>
						<option value=5>High to Low Rent Expenses</option>
						<option value=6>Low to High Rent Expenses</option>
						<option value=7>High to Low Food Expenses</option>
						<option value=8>Low to High Food Expenses</option>
						<option value=9>High to Low Entertainment Expenses</option>
						<option value=10>Low to High Entertainment Expenses</option>
						<option value=11>High to Low Other Expenses</option>
						<option value=12>Low to High Other Expenses</option>
						<option value=13>Date Modified Ascending</option>
						<option value=14>Date Modified Descending</option>
					</select></th>
<th><input type="submit" value="submit" name="Sort"></th>
</tr>


</table>
</form>
<input type=button value="Back" onCLick="history.back()">
</div>
</body>
</html>