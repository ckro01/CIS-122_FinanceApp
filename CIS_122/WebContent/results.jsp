<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"
 %>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Information</title>
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
<b>total expense</b>
<b><% //totalexp %></b>
<form action="sort.jsp" method="post">
<b>View data, Sort by</b><select name="sortoption">
						<option value=1>High to low expense</option>
						<option value=2>Low to High expense</option>
						<option value=3>High to low income</option>
						<option value=4>low to High income</option>
						<option value=5>Date modified</option>
					</select>
<input type="submit" value="Submit" name="submit">
</form>
</body>
</html>