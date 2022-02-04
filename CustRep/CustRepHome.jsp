<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<h1>Welcome Rep! </h1>

<input type = "button" value = "View Flight Schedules" onClick = "javascript:window.location='<%="schedule.jsp"%>';">
<input type = "button" value = "Create Reservation For Customer" onClick = "javascript:window.location='<%="reservations.jsp"%>';">
<input type = "button" value = "Edit Reservation For Customer" onClick = "javascript:window.location='<%="editreservations.jsp"%>';">
<input type = "button" value = "Flight Waiting List" onClick = "javascript:window.location='<%="waitinglist.jsp"%>';">
<input type = "button" value = "Aircrafts" onClick = "javascript:window.location='<%="Aircrafts.jsp"%>';">
<input type = "button" value = "Airports" onClick = "javascript:window.location='<%="Airports.jsp"%>';">
<input type = "button" value = "Flights" onClick = "javascript:window.location='<%="flights.jsp"%>';">




<p> <a href = "logout.jsp">Logout</a>
</body>
</html>