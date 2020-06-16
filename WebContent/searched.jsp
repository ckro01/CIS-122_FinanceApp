<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.File"%>
<%@ page import="java.util.*"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@ page import="help.printfile"%>
<%@ page import="help.search, help.MonthConvert" %>
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
<title>Search Results</title>
<link rel="icon" href="https://www.freepngimg.com/save/16268-java-png-image/64x64">
 <div align="center" style="margin-top: 50px;">
</head>
<body>

<% 
//get the data from alldata.txt and store it to datelist
	ArrayList<String> datalist = new ArrayList<String>();
	File filedata = new File("alldata.txt");
	Scanner scandata = new Scanner(filedata); // scan file
	while (scandata.hasNextLine()) {
		String line = scandata.nextLine(); // scan per line
		datalist.add(line);
	}
	scandata.close();
	int[][] alldata = new int[datalist.size()][7];
	//put the Arraylist data in sperated form 2d array
		for (int i = 0; i < datalist.size(); i++) {
			String line = datalist.get(i);
			String[] splited = line.split("\\s+");

			//conver expense data to int
			int rent = Integer.parseInt(splited[2]);
			int food = Integer.parseInt(splited[3]);
			int entertaiment = Integer.parseInt(splited[4]);
			int other = Integer.parseInt(splited[5]);
			int totalexpense = rent + food + entertaiment + other;

			//add data to all data
			for (int col = 0; col < splited.length; col++) {
				alldata[i][col] = Integer.parseInt(splited[col]);
			}
			alldata[i][6] = Integer.parseInt(String.valueOf(totalexpense));
		}
	
String userM = request.getParameter("Month"); //gett user input
String userY = request.getParameter("Year");
String userD = userM + userY; 
//search
search search = new search();
int searchedvalue = Integer.parseInt(userD);
int[] searchedData = search.recursionSearch(alldata, searchedvalue, 0, 7, 0);


//if element found
if(searchedData[0] != 0){

	//fix date ex.(Jan 2020)
	MonthConvert MC = new MonthConvert();
	String[] dateCombine = MC.dateCon(alldata);
			
//print out
	%>
	<h3>Search Results: </h3>
	<table border="1">
		<tbody>
			<tr>
				<td>Date</td>
				<td><%=dateCombine[0]%></td>
			</tr>
			<tr>
				<td>Income:</td>
				<td><%=searchedData[1]%></td>
			</tr>
			<tr>
				<td>Total Expense:</td>
				<td><%=searchedData[6]%></td>
			</tr>
			<tr>
				<td>Rent:</td>
				<td><%=searchedData[2]%></td>
			</tr>
			<tr>
				<td>Cost of Food:</td>
				<td><%=searchedData[3]%></td>
			</tr>
			<tr>
				<td>Cost of Entertainment:</td>
				<td><%=searchedData[4]%></td>
			</tr>
			<tr>
				<td>Other Expenses:</td>
				<td><%=searchedData[5]%></td>
			</tr>
		</tbody>
	</table>
<% }
else{ %>
	<b>Data is not found</b>
<% }
%>
<form>
<table>
<tr><td>
<input type=button value="Back" onCLick="history.back()">
</td></tr>
</table>
</form>
</body>
</html>