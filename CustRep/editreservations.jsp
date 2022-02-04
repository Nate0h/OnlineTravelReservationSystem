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
		
				<form method="post" action="updatereservation.jsp">
		<table>
		<tr>    
		<td>RID:</td><td><input type="text" name="rid"></td>
		</tr>
		<tr>
		<td>CID:</td><td><input type="text" name="cid"></td>
		</tr>
		<tr>
		<td>Flight ID:</td><td><input type="text" name="flight_id"></td>
		</tr>
		<tr>
		<td>Flight Type:</td><td><input type="text" name="flight_type"></td>
		</tr>
		<tr>
		<td>Trip Type:</td><td><input type="text" name="trip_type"></td>
		</tr>
		<tr>
		<td>Airline ID:</td><td><input type="text" name="airline_id"></td>
		</tr>
		<tr>
		<td>Departing Airport:</td><td><input type="text" name="dep_airport"></td>
		</tr>
		<tr>
		<td>Arrival Airport:</td><td><input type="text" name="arr_airport"></td>
		</tr>
		<tr>
		<td>Departure Time:</td><td><input type="text" name="dep_time"></td>
		</tr>
		<tr>
		<td>Arrival Time:</td><td><input type="text" name="arr_time"></td>
		</tr>
		<tr>
		<td>Date:</td><td><input type="text" name="date"></td>
		</tr>
		<tr>
		<td>Booking Date:</td><td><input type="text" name="booking_date"></td>
		</tr>
		<tr>
		<td>Price:</td><td><input type="text" name="price"></td>
		</tr>
		<tr>
		<td>Booking Fee:</td><td><input type="text" name="booking_fee"></td>
		</tr>
		
		
		<input type="submit" value="Submit">
		</table>
		</form>
	</body>
</html>