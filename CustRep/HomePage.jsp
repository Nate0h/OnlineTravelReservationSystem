<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
	<head>
		<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
		<title>Customer Rep Home</title>
	</head>
	
	<body>
     
    <br>
    
    <br>
     
	Don't have an account with us? Please register below.
	<br>
		<form method="post" action="Register.jsp">
		<table>
		<tr>    
		<td>Enter a username:</td><td><input type="text" name="username"></td>
		</tr>
		<tr>
		<td>Enter a password:</td><td><input type="text" name="password"></td>
		</tr>
		<tr>
		</table>
		<input type="submit" value="Register!">
		</form>
	<br>


		<br>		
	Login Here
	<br>
		<form method="post" action="Login.jsp">
		<table>
		<tr>    
		<td>username:</td><td><input type="text" name="username"></td>
		</tr>
		<tr>
		<td>password:</td><td><input type="text" name="password"></td>
		</tr>
		<tr>
		 <select name="usertype" size=1>
              <option value="customerRep">Customer Representative</option>
		</select>
		<input type="submit" value="Login!">
		</table>
		</form>

</body>
</html>