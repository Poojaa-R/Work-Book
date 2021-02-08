<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<style>
@import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');

*{
 margin: 0;
 padding: 0;
 box-sizing: border-box;
 font-family: "Poppins", sans-serif;

}
body{
    background:white no-repeat top center;
    background-size: cover;
    height: 100vh;
	font-family: 'Montserrat', sans-serif;

}
.box{
    background-color:white;
    box-sizing: border-box;
    border-style: groove;
    position: relative;
    width: 500px;
    height: 500px;
    margin-top: -600px;
    justify-content: center;
    align-items: center;
    margin-left: 550px;
    box-shadow: 0 10px 20px rgba(0,0,0,0.5);
    border-radius: 20px;
}
.box .title{
    text-align: center;
    
  background: -webkit-linear-gradient(rgb(240, 113, 138),crimson);
  -webkit-background-clip: text;
  -webkit-text-fill-color: transparent;
    text-shadow: rgb(212, 211, 211);
    letter-spacing: 5px;
    font-size: 20px;
}
.box .content{
    margin-top: 25px;
    padding-left: 40px;
    padding-bottom: 25px;
}
.box .content span{
    font-weight: lighter;
}
.box .content .ind{
    padding-top: 15px;
}
.box:before{
    content: '';
    position: absolute;
    top: -2px;
    left: -2px;
    right: -2px;
    bottom: -2px;
    background: #fff;
    z-index: -1;
}
.box:after{
    content: '';
    position: absolute;
    top: -2px;
    left: -2px;
    right: -2px;
    bottom: -2px;
    background: #fff;
    z-index: -1;
    filter: blur(40px);
}
.box:before,.box:after{
    background: linear-gradient(235 deg,#89ff00,#060c21,#060c21,#00bcd4);
}
</style>
</head>

<body>
	<%
		
			String employee_id=(String)request.getParameter("employee_id");
		//System.out.println(employee_id);
			String name1="";
			String email1="";
			String mobile_no1="";
			String location1="";
			String dob1="";
			String job_description1="";
			String job1="";
		%>
		<%@page import="java.sql.*" %>
	   <%@page import="java.util.*" %>
<%
		 String dbUrl = "jdbc:mysql://localhost:3306/database1";
		 String dbUname = "root";
		 String dbPassword = "root";
		 String dbDriver = "com.mysql.jdbc.Driver";
		 ArrayList<ArrayList<String>> ans=new ArrayList<ArrayList<String>>();
		try {
			Class.forName(dbDriver);
			} catch (ClassNotFoundException e) {
			e.printStackTrace();
			}
			Statement statement1 = null;
			ResultSet resultSet1 = null;
		Connection con1 = DriverManager.getConnection(dbUrl,dbUname,dbPassword);
		statement1=con1.createStatement();
		String sql1="select * from employee_signup where employee_id=?";
		String sql2="select * from review where review_to=?";
		PreparedStatement ps1;
		try
		{
			PreparedStatement preparedStatement = con1.prepareStatement(sql1);
	        preparedStatement.setString(1, employee_id);
	        ResultSet rs = preparedStatement.executeQuery();
	        while(rs.next()) 
	        {
	        	name1=rs.getString("name");
	           job1=rs.getString("job");
	           email1=rs.getString("email");
				mobile_no1=rs.getString("mobile_no");
				location1=rs.getString("location");
				dob1=rs.getString("dob");
				job_description1=rs.getString("description");
				job1=rs.getString("job");
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
%>
    <div class="box">
        <div class="title">
            <div class="text">
                <h1>ABOUT</h1>
            </div>
            <div class="ind">
                    Name : <span style="margin-left:78px;"><%=name1 %></span> <br>
                </div>
                <div class="ind">
                    Email : <span style="margin-left:80px;"><%=email1 %></span>  <br>
                </div>
                <div class="ind">
                    Phone : <span style="margin-left:75px;"><%=mobile_no1 %></span> <br>
                </div>
                <div class="ind">
                    Job : <span style="margin-left:97px;"><%=job1 %></span><br>
                </div>
                <div class="ind">
                   Description : <span style="margin-left:34px;"><%=job_description1 %></span><br>
                </div>
                <div class="ind">
                    Location : <span style="margin-left:58px;"><%=location1 %></span> <br>
                </div>
                <div class="ind">
                    Date of birth : <span style="margin-left:28px;"><%=dob1 %></span><br>
                </div>
        </div>
        <div class="content">
            <h4>
               
                
            </h4>
        </div>
    </div>
</body>
</html>