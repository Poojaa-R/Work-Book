<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<%@include file="nav_bar_employer.jsp" %>
<body>
<%@ page import="java.sql.*"%>
<%@ page import="java.util.*"%>
<%!

private static String dbUrl ="jdbc:mysql://localhost:3306/database1";
private static String dbUname = "root";
private static String dbPassword = "root";
private static String dbDriver = "com.mysql.jdbc.Driver";
public static void loadDriver(String dbDriver)
{
	try
	{
		Class.forName(dbDriver);
	} catch (ClassNotFoundException e) 
	{
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
}

public static Connection getConnection()
{
	Connection con = null;
	try {
		con = DriverManager.getConnection(dbUrl, dbUname, dbPassword);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	return con;
}
%>
<%

LinkedHashMap<String,ArrayList<Integer>> hm=new LinkedHashMap<String,ArrayList<Integer>>();
loadDriver(dbDriver);
Connection con=getConnection();
String sql="select * from review";
try
{
PreparedStatement ps=con.prepareStatement(sql);
ResultSet rs=ps.executeQuery();
while(rs.next())
{
	String employee_id=rs.getString("review_to");
	System.out.println(employee_id);
	String rating=rs.getString("ratings");
	int ratings=Integer.parseInt(rating);
	if(!hm.containsKey(employee_id))
	{
		ArrayList<Integer> r=new ArrayList<Integer>();
		r.add(ratings);
		r.add(1);
		hm.put(employee_id,r);
	}
	else
	{
		ArrayList<Integer> r1=hm.get(employee_id);
		int n1=r1.get(0);
		int n2=n1+ratings;
		int count=r1.get(1);
		int count1=count+1;
		r1.clear();
		r1.add(n2);
		r1.add(count1);
		hm.put(employee_id,r1);
	}
}

ps.executeUpdate();
 
}
catch(Exception e)
{
	System.out.println(e.getMessage());
}
System.out.println(hm);
%>

</body>
</html>