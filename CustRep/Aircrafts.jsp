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
	
	<form method="post" action="Aircraftspage.jsp">
			<table>
		<tr>    
		<td>Aircraft ID:</td><td><input type="text" name="aircraft_id"></td>
		</tr>
		<tr>    
		<td>Aircraft You want to Change(Optional):</td><td><input type="text" name="aircraft_cid"></td>
		</tr>
		<tr>    
		<td>Seat Numbers:</td><td><input type="text" name="seats"></td>
		</tr>
		<tr>
		<select name="change_type" size=1>
              <option value="Edit">Edit</option>
               <option value="Delete">Delete</option>
              <option value="Insert">insert</option>
             
		</select>
		
		</table>
		<input type="submit" value="Submit">
		</form>
	
	</body>
</html>