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
	Connection con = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
	statement=con.createStatement();
	String email=request.getParameter("email");
	String password=request.getParameter("password");
	String sql = "select password from employer where email=?";
	try {
		PreparedStatement preparedStatement = con.prepareStatement(sql);
        preparedStatement.setString(1, email);
        ResultSet rs = preparedStatement.executeQuery();
        //out.println(rs.getString("password"));
        while(rs.next()) {
        	String s=rs.getString("password");
            if(s.equals(password))
            {
            	response.sendRedirect("job_post.jsp");
            }
            else
            {
            	response.sendRedirect("employer_signup.jsp");
            }
        } 
        
    } catch(Exception e) {
        System.out.println("Exception is: " + e);
    } 
	%>
</body>
</html>