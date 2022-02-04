<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Home</title>
	</head>
	
	<body>
	<% 
	try{
		
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();		

		//Create a SQL statement
		Statement stmt = con.createStatement();
		
		String str = "SELECT* FROM `flight_schedule`";
		
		ResultSet rs = stmt.executeQuery(str);
		
		//Make an HTML table to show the results in:
		out.print("<table>");
				//make header row
		out.print("<tr>");
		
		out.print("<th>Flight ID</td>");
		out.print("<th>Airline ID</td>");
		out.print("<th>Origin Airport</td>");
		out.print("<th>Destination Airport</td>");
		out.print("<th>Departing Time</td>");
		out.print("<th>Arriving Time </td>");
		out.print("<th>Date</td>");
		out.print("<th>Fare</td>");
    	out.print("</tr>");
    	
    	
  
		
    	while(rs.next()){
    		
    		
    
    	out.print("<tr>");
		
		out.print("<td>");
		out.print(rs.getString("flight_id"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(rs.getString("airline_id"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(rs.getString("dep_airport"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(rs.getString("arr_airport"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(rs.getString("dep_time"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(rs.getString("arr_time"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(rs.getString("date"));
		out.print("</td>");
		
		out.print("<td>");
		out.print(rs.getInt("fare"));
		out.print("</td>");
		
		out.print("<tr>");
	}
    	out.print("</table>");
    	
    	stmt.close();
	    rs.close();
    	db.closeConnection(con);
		
	}catch(Exception e){
		out.print(e);
	}
	
	%>
	
	<form method="post" action="reservations.jsp">
		<table>
		<tr>    
		<td>Enter Customer Id:</td><td><input type="text" name="customer_id"></td>
		</tr>
		<tr>    
		<td>Enter Flight Id:</td><td><input type="text" name="flight_id"></td>
		</tr>
		<tr>
		<select name="trip_type" size=1>
              <option value="Round-Trip">Round-Trip</option>
              <option value="One-Way">One-way</option>
		</select>
		</tr>
		
		</tr>
		<select name="flight_type" size=1>
              <option value="Economy">Economy</option>
               <option value="First-Class">First Class</option>
              <option value="Business">Business</option>
             
		</select>
		
		</table>
		<input type="submit" value="Submit">
		</form>
		
	</body>
</html>