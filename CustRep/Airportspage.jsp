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
	
	String airport_id = request.getParameter("airport_id");
	String airport_cid = request.getParameter("airport_cid");
  
	
	String change_type = request.getParameter("change_type");
	String edit = "UPDATE `airports` SET `airport_id` = ? WHERE `airport_id` = ?";
	String insert = "Insert into airports(airport_id)" + "Values(?)";
	String delete = "Delete from `airports` where `airport_id`= ?" ;
	
	
	if(change_type.equals("Edit")){
		PreparedStatement ps = con.prepareStatement(edit);
		
		ps.setString(1, airport_id);
		ps.setString(2, airport_cid);
   
    
		  int x = ps.executeUpdate(edit);
		    if(x == 1){
		    	out.println("Airport Successfully edited");
		    }
		
	}else if(change_type.equals("Delete")){
		 PreparedStatement ps = con.prepareStatement(delete);
		 ps.setString(1, airport_id);
		 int x = ps.executeUpdate();
		 
		 if(x >= 0){
		    	out.println("Airport Successfully deleted");
		    }
		
	}else if(change_type.equals("Insert")){
		
		 PreparedStatement ps = con.prepareStatement(insert);
		 ps.setString(1, airport_id);

		 
		  int x = ps.executeUpdate();
		    
		    if(x == 1){
		    	out.println("Airport Successfully inserted");
		    }
		
	}
		
	
	
	}catch(Exception e){
		
		out.println(e);
	}
	
	
	
	
	
	%>
	
	
	
	
		</body>
</html>