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
	
	String aircraft_id = request.getParameter("aircraft_id");
	String aircraft_cid = request.getParameter("aircraft_cid");
  	String s = request.getParameter("seats");
	int seats = Integer.parseInt(s);
	
	
	String change_type = request.getParameter("change_type");
	String edit = "Update `aircrafts` set `aircraft_id` = ?,`seats` = ? where `aircraft_id` = ?";
	String insert = "Insert into aircrafts(aircraft_id, seats)" + "Values(?,?)";
	String delete = "Delete from `aircrafts` where `aircraft_id`= ?" ;
	
	
	if(change_type.equals("Edit")){
		PreparedStatement ps = con.prepareStatement(edit);
		
		ps.setString(1, aircraft_id);
    	ps.setInt(2, seats);
    
    	
		  int x = ps.executeUpdate(edit);
		    if(x == 1){
		    	out.println("Reservation Successfully edited");
		    }
		
	}else if(change_type.equals("Delete")){
		 PreparedStatement ps = con.prepareStatement(delete);
		 ps.setString(1, aircraft_id);
		 int x = ps.executeUpdate();
		 
		 if(x >= 0){
		    	out.println("Reservation Successfully deleted");
		    }
		
	}else if(change_type.equals("Insert")){
		
		 PreparedStatement ps = con.prepareStatement(insert);
		 ps.setString(1, aircraft_id);
		 ps.setInt(2, seats);
		 
		  int x = ps.executeUpdate();
		    
		    if(x == 1){
		    	out.println("Reservation Successfully inserted");
		    }
		
	}
		
	
	
	}catch(Exception e){
		
		out.println(e);
	}
	
	
	
	
	
	%>
	
	
	
	
		</body>
</html>