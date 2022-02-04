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
		String flight_id = request.getParameter("flight_id");
		
		String str = "Select `cid` from `waitinglist` where `flight_id` = " + flight_id;
		
		ResultSet rs = stmt.executeQuery(str);
		
		while(rs.next()){
			out.print("<tr>");
			out.println(rs.getString(1));
			out.print("<tr>");
			
		}
		
		
	}catch(Exception e){
		
		out.println(e);
	}
	
	
	
	
	
	
	%>
	
	
		
    </body>
</html>