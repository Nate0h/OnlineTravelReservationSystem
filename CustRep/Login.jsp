<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<% 
	PreparedStatement ps = null;
	ResultSet rs = null;
	String userdbName;
	String userdbPsw;


		//Get the database connection
		ApplicationDB db = new ApplicationDB();	
		Connection con = db.getConnection();

		//Get parameters from the HTML form at the index.jsp
		String name = request.getParameter("username");
		String password = request.getParameter("password");
		String usertype = request.getParameter("usertype");
		
		String sql = "select * from users where username=? and password=?";
		
		if((!(name.equals(null) || name.equals("")) && !(password.equals(null) || password.equals("")))) {
					
					ps = con.prepareStatement(sql);

					ps.setString(1, name);

					ps.setString(2, password);

					rs = ps.executeQuery();

					if(rs.next()) { 

						userdbName = rs.getString("username");

						userdbPsw = rs.getString("password");

						
						if (name.equals(userdbName) && password.equals(userdbPsw) && (usertype.equals("customerRep"))) {
							response.sendRedirect("CustRepHome.jsp"); 
						}

					}
					else {
						out.print("Login error");
						rs.close();
						ps.close(); 
					}
					
		}
		else {
			out.print("error");
		}
con.close();

%>
</body>

</html>

