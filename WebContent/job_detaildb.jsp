<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@page import="java.sql.DriverManager"%>
		<%@page import="java.sql.ResultSet"%>
		<%@page import="java.sql.Statement"%>
		<%@page import="java.sql.Connection"%>
		<%@page import="java.sql.*"%>
		<%@page import="java.util.*" %>
		<%
		String driver = "com.mysql.jdbc.Driver";
		String connectionUrl = "jdbc:mysql://localhost:3306/database1";
		String userid = "root";
		String password = "root";
		try {
		Class.forName(driver);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		Connection connection = null;
		Statement statement = null;
		ResultSet resultSet = null;
		%>

<%
	String employee_id=(String)session.getAttribute("employee_id");
	connection = DriverManager.getConnection(connectionUrl, userid, password);
	statement=connection.createStatement();
	String sql1 = "insert into job_status values(default,?,?,?,?,?,?)";
	String job_id=request.getParameter("job_id");
	int flag=0;
	String employer_id=request.getParameter("employer_id");
 	String bid=request.getParameter("employee_bid_amount");
	PreparedStatement ps;
	try {
		if(flag==0)
		{
	ps = connection.prepareStatement(sql1);
	
	ps.setString(1,employee_id);
	ps.setString(2,employer_id);
	ps.setString(3,job_id);
	ps.setString(4,bid);
	ps.setInt(5,0);
	ps.setInt(6,1);
	ps.executeUpdate();	
	flag=1;
		}
 	}
 	catch (Exception e)
 	{
 		e.printStackTrace();
 	}
	
 %>
 <%
 if(flag==1)
 {
	 response.sendRedirect("Bid_success.jsp");
 }
 %>
</body>
</html>