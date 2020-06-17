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

<%@ page import = "java.io.File" %>
<%@ page import = "java.util.*" %>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.io.FileInputStream"%>
<%@page import="java.io.File"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.net.URL"%>
<%@page import="java.io.FileReader"%>
<%@ page import="help.printfile" %>
<%@page import = "java.util.ArrayList"%>
<%@ page import="java.util.List" %>

<%	
    //get the data from MonthIndex and store it to int monthindex
	ArrayList<Integer> index = new ArrayList<Integer>();
	File file = new File("MonthIndex.txt");
	Scanner scan = new Scanner(file); // scan file
	while (scan.hasNextLine()) {
        String line = scan.nextLine(); // scan per line
        index.add(Integer.parseInt(line));
        }
	int monthindex = index.get(0);
	scan.close();
	
	//get the data from tax.txt and store it to int tax
		ArrayList<Integer> taxlist = new ArrayList<Integer>();
		File filetax = new File("tax.txt");
		Scanner taxes = new Scanner(filetax); // scan file
		while (taxes.hasNextLine()) {
	        String line = taxes.nextLine(); // scan per line
	        taxlist.add(Integer.parseInt(line));
	        }
		int tax = taxlist.get(0);
		taxes.close();
	
    //get the data from date.txt and store it to datelist
	ArrayList<Integer> datelist = new ArrayList<Integer>();
	File filedate = new File("date.txt");
	Scanner scandate = new Scanner(filedate); // scan file
	while (scandate.hasNextLine()) {
        String line = scandate.nextLine(); // scan per line
        datelist.add(Integer.parseInt(line));
        }
	scandate.close();	
	
	ArrayList<Integer> incomelist = new ArrayList<Integer>();
	ArrayList<Integer> rentlist = new ArrayList<Integer>();
	ArrayList<Integer> foodlist = new ArrayList<Integer>();
	ArrayList<Integer> entertaimentlist = new ArrayList<Integer>();
	ArrayList<Integer> otherlist = new ArrayList<Integer>();

	//get the input from input.jsp
	for(int x = 0;x<monthindex; x++){
		//income
		int income = Integer.parseInt(request.getParameter("income"+x));
		incomelist.add(income);
		
		//rent expense
		int exRent = Integer.parseInt(request.getParameter("rent"+x));
		rentlist.add(exRent);
		
		//food expense
		int food = Integer.parseInt(request.getParameter("food"+x));
		foodlist.add(food);
		
		//entertaiment expense
		int entertaiment = Integer.parseInt(request.getParameter("ent"+x));
		entertaimentlist.add(entertaiment);
		
		//other expense
		int other = Integer.parseInt(request.getParameter("ent"+x));
		otherlist.add(other);
		
		
	}
%>
<body>
<div align="center" style="margin-top: 50px;">
<%
//open file to write and collect all the data
printfile save = new printfile();
save.openFile("alldata.txt");
%>

<% 

//collect the input data in one file txt
for(int j = 0;j<monthindex; j++){ 
	String incomex = String.valueOf(incomelist.get(j));
	String rentex = String.valueOf(rentlist.get(j));
	String foodex = String.valueOf(foodlist.get(j));
	String entertaimentex = String.valueOf(entertaimentlist.get(j));
	String otherex = String.valueOf(otherlist.get(j));
	String date = String.valueOf(datelist.get(j));
	// put the data in one String
	String data = date+" "+incomex+" "+rentex+" "+foodex+" "+entertaimentex+" "+otherex+" ";
	save.addRecords(data+"\n");  //write the data to alldata.txt
 	
	// 
	
}%>
<% save.closefile(); //close file alldata.txt %>

<%
//calculate Information total and Average
	//total income
	int totalincome = 0;
	for(int i=0; i<incomelist.size(); i++){
		totalincome += incomelist.get(i);
	}
	//average income
	int avgincome = totalincome/incomelist.size();
	
	//total expense
	int totalexpense = 0;
	for(int i=0; i<rentlist.size(); i++){
		totalexpense = totalexpense + rentlist.get(i) + foodlist.get(i) + entertaimentlist.get(i) + otherlist.get(i);
	}
	
	//average expense
	int avgexpense = totalexpense/rentlist.size();
	
	//Money left
	int moneyleft = totalincome - totalexpense;
	
	// Average money left
	int avgmoneyleft = moneyleft/incomelist.size();
	
	//After Tax
	//total income after tax
	int totalincomeAftertax = totalincome - (totalincome * (tax/100));
	
	//avg income after tax
	int avgincomeAfterTax = avgincome - (avgincome * tax/100) ;
	
	//avg money left after tax
	int avgmoneyleftAftertax = avgincomeAfterTax - avgexpense;
	
	//total money left after tax
	int moneyleftAftertax = totalincomeAftertax - totalexpense;
%>
<h3> Your Financial Data: </h3>
<table>
		<tbody>
			<tr>
				<td>Average Income:</td>
				<td><%=avgincome %></td>
			</tr>
			<tr>
				<td>Average Total Expenses: </td>
				<td><%=avgexpense %></td>
			</tr>
			<tr>
				<td>Average Money Leftover: </td>
				<td><%=avgmoneyleft %></td>
			</tr>
			<tr>
				<td>Total Money Left: </td>
				<td><%=moneyleft %></td>
			</tr>
			<tr>
				<td>Total Income: </td>
				<td><%=totalincome %></td>
			</tr>
			<tr>
				<td>Total Expenses: </td>
				<td><%=moneyleftAftertax %></td>
			</tr>
			<tr>
				<td>Total Income After Tax:</td>
				<td><%=totalincomeAftertax %></td>
			</tr>
			<tr>
				<td>Average Income After Tax: </td>
				<td><%=avgincomeAfterTax %></td>
			</tr>
			<tr>
				<td>Average Money leftover After Tax: </td>
				<td><%=avgmoneyleftAftertax %></td>
			</tr>
			<tr>
				<td>Total Money Left After Tax: </td>
				<td><%=moneyleft %></td>
			</tr>
			</tbody>
	</table>
<br>
<b>Data Viewing: </b><br/><br>
<%@ page import = "help.MonthConvert" %>
<% //convert date to readable String
//call the convert Month from user input to String(jan, Feb, ..)
	MonthConvert MC = new MonthConvert();

String[] datestr = new String[datelist.size()];
int dindex = 0;
for(int d : datelist){
	int month = d/10000;
	String year = String.valueOf(d%10000);
	String monthstr = MC.getendmonth(month);
	datestr[dindex] = (monthstr + " " + year);
	dindex++;
}
	%>
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