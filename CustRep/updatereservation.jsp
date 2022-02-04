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
		Statement stmt = con.createStatement();
		String user = request.getParameter("value");
		
		String q = request.getParameter("rid");
		int rid = Integer.parseInt(q);
		String cid = request.getParameter("cid");
		String flight_id = request.getParameter("flight_id");
		String flight_type = request.getParameter("flight_type");
		String trip_type = request.getParameter("trip_type");
		String airline_id = request.getParameter("airline_id");
		String dep_airport = request.getParameter("dep_airport");
		String arr_airport = request.getParameter("arr_airport");
		String dep_time = request.getParameter("dep_time");
		String arr_time = request.getParameter("arr_time");
		String date = request.getParameter("date");
		String booking_date = request.getParameter("booking_date");
		String r = request.getParameter("price");
		int price = Integer.parseInt(r);
		String s = request.getParameter("booking_fee");
		int booking_fee = Integer.parseInt(s);
		
		String statement = "UPDATE `reservation_portfolio` SET `cid`=?, `flight_id`=?, `flight_type`=?, `trip_type`=?, `airline_id`=?, `dep_airport`=?, `arr_airport`=?, `dep_time`=?, `arr_time`=?, `date`=?, `booking_date`=?, `price`=?, `booking_fee`=? WHERE `rid`=?";
		
		 PreparedStatement ps = con.prepareStatement(statement);
	    	ps.setString(1, cid);
	    	ps.setString(2, flight_id);
	    	ps.setString(3, flight_type);
	    	ps.setString(4, trip_type);
	    	ps.setString(5, airline_id);
	    	ps.setString(6, dep_airport);
		    ps.setString(7, arr_airport);
		    ps.setString(8, dep_time);
		    ps.setString(9, arr_time);
		    ps.setString(10, date);
		    ps.setString(11, booking_date);
		    ps.setInt(12, price);
		    ps.setInt(13, booking_fee);
		    ps.setInt(14, rid);
		
		    int x = ps.executeUpdate();
		    
		    if(x == 1){
		    	out.println("Reservation Successfully edited");
		    }
	} catch (Exception e){
		
		out.println(e);
	}
	
	
	
	
	
	
	%>
		
</body>
</html>