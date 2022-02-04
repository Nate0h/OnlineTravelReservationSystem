<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*, java.text.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%

try{
	ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();	
	Statement stmt = con.createStatement();
	
	int rid = 0;
	
	String cust_id = request.getParameter("customer_id");
	String findcid = "Select* from `customers`";
	int exists = 0;
	
	ResultSet result = stmt.executeQuery(findcid);
	
	while(result.next()){
		String cid = result.getString("cid");
		if (cust_id.equals(cid)){
			exists = 1;
			out.println("yeah bud");
		}
	}
	if (exists == 0){
		out.println("Customer does not exist in the database");
	
		db.closeConnection(con);
	}
	
	
	String flight_id = request.getParameter("flight_id");
	
	out.println(flight_id);
	
	String flight_type = request.getParameter("flight_type");
	
	out.println(flight_type);
	
	String trip_type = request.getParameter("trip_type");
	
	out.println(trip_type);
	
	DateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	
	String booking_date = df.format(new java.util.Date());
	
	out.println(booking_date);
	
	
	String getrow = "Select* from `reservation_portfolio`";
	
	ResultSet rs = stmt.executeQuery(getrow);
	
	if (!rs.next() ) {
	    System.out.println("first reservation booked!");
	    rid = 0;
	    out.println(rid);
	} 
	else if (rs.last()) {
	    int rows = rs.getRow();
	    rid = rows;
	    rs.beforeFirst();
	    out.print(rows);
	}
	
	String str= "Select* from `flight_schedule` where `flight_id` = " + flight_id;
	
	ResultSet res = stmt.executeQuery(str);
	String airline_id = "";
	String dep_airport = "";
	String arr_airport = "";
	String dep_time = "";
	String arr_time = "";
	String date = "";
	int price = 0;
	
	
	while(res.next()){
	airline_id = res.getString("airline_id");
	dep_airport = res.getString("dep_airport");
	arr_airport = res.getString("arr_airport");
	dep_time = res.getString("dep_time");
	arr_time = res.getString("arr_time");
	date = res.getString("date");
	price = res.getInt("fare");
	
	
	}
	
	
	int booking_fee = 5;
	
	if(trip_type.equals("Round-Trip")){
		price = price * 2;
	}
	
	if(flight_type.equals("First-Class") || flight_type.equals("Business") ){
		price += 50;
		out.println("Issa First Class or Bizzness");
	}
	price += booking_fee;
	
	
	
	
	String insert = "Insert into reservation_portfolio(rid, cid, flight_id, flight_type, trip_type, airline_id, dep_airport, arr_airport, dep_time, arr_time, date, booking_date, price, booking_fee)"
			 + "Values (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
	
	PreparedStatement ps = con.prepareStatement(insert);
	ps.setInt(1, rid);
	ps.setString(2, cust_id);
	ps.setString(3, flight_id);
	ps.setString(4, flight_type);
	ps.setString(5, trip_type);
	ps.setString(6, airline_id);
	ps.setString(7, dep_airport);
	ps.setString(8, arr_airport);
	ps.setString(9, dep_time);
	ps.setString(10, arr_time);
	ps.setString(11, date);
	ps.setString(12, booking_date);
	ps.setInt(13, price);
	ps.setInt(14, booking_fee);
	
	ps.executeUpdate();
	
	
	
	//Reservation Complete, see all booked reservations
	
	
	
}catch(Exception e){
	out.print(e);
}



%>

</body>
</html>