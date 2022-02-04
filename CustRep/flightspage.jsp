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
		String airport_id = request.getParameter("airport_id");
		
		String str = "SELECT* FROM `flight_schedule` where `arr_airport` ='"+airport_id+"' OR `dep_airport` ='"+airport_id+"'";
		
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