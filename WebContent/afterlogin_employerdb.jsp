<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
 <%@page import="java.sql.*" %>
   <%@page import="java.util.*" %>
<%
	 String dbUrl = "jdbc:mysql://localhost:3306/database1";
	 String dbUname = "root";
	 String dbPassword = "root";
	 String dbDriver = "com.mysql.jdbc.Driver";
	try {
		Class.forName(dbDriver);
		} catch (ClassNotFoundException e) {
		e.printStackTrace();
		}
		Statement statement = null;
		ResultSet resultSet = null;
		String employer_id=(String)session.getAttribute("employer_id");
		String name=request.getParameter("name");
		String mobile_no=request.getParameter("mobile_no");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		String company_name=request.getParameter("company_name");
		String company_link=request.getParameter("company_link");
		String address=request.getParameter("address");
		String state=request.getParameter("state");
		String district=request.getParameter("district");
		String description=request.getParameter("description");
		Connection con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		statement=con.createStatement();
		String sql = "insert into employer values(?,?,?,?,?,?,?,?,?,?,?)";
	PreparedStatement ps;
	try 
	{
		ps = con.prepareStatement(sql);
		ps.setString(1,employer_id);
		ps.setString(2,name);
		ps.setString(3,mobile_no);
		ps.setString(4,email);
		ps.setString(5,password);
		ps.setString(6,company_name);
		ps.setString(7,company_link);
		ps.setString(8,address);
		ps.setString(9,state);
		ps.setString(10,district);
		ps.setString(11,description);
	ps.executeUpdate();
	response.sendRedirect("job_post.jsp");
	
	} catch (SQLException e) 
	{
		e.printStackTrace();
	}
	
	
%>

</body>
</html>