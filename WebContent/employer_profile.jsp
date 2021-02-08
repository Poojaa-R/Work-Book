<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
   <title>Profile Page</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
</head>
<style>
       @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@100;200;300;400;500;600;700;800;900&display=swap');

*{
 margin: 0;
 padding: 0;
 box-sizing: border-box;
 font-family: "Poppins", sans-serif;

}
body{
    background: rgb(235, 228, 228) no-repeat top center;
    background-size: cover;
    height: 100vh;


}
.dashboard{
    height: 100%;
    width: 300px;
    background-attachment: fixed;
    background: rgba(0,0,0,0.8);
    padding: 30px;
    border-radius: 5px;
    
    
    justify-content: center;
    align-items: center;

}
.dashboard .profile-image img{
    width: 200px;
    height: 250px;
    clip-path: circle();
    margin-left: 17px;
    
}
.dashboard .profile-text a{
    font-family: 'Poppins',sans-serif;
    color: #ffffff;
    letter-spacing: 2.5px;
    position: relative;
    display: inline-block;
    padding: 8px 8px;
    margin-top: 10px;
    text-decoration: none;
    text-align: center;
}
.dashboard .profile-icons h2{
    color: #ffffff;
    font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
    text-align: center;
    margin-top: -25px;
    font-size: 20px;
    margin-bottom: 13px;
    font-style: italic;
}
.dashboard .profile-icons h3{
    color: #ffffff;
    font-family: 'Trebuchet MS', 'Lucida Sans Unicode', 'Lucida Grande', 'Lucida Sans', Arial, sans-serif;
    text-align: center;
    margin-top: -10px;
    font-size: 15px;
    
}
.dashboard .title-text{
    color: #ffffff;
    font-size: 25px;
    font-weight: 550;
}
.dashboard .title-text span{
    color: crimson;
}

.right-side {
    float: right;
    margin-right: 30px;
    margin-top: -550px;
}
.right-side .logout a{
    position: relative;
    display: inline-block;
    padding: 8px 20px;
    margin-top: 15px;
    background: crimson;
    color: #fff;
    border-radius: 20px;
    text-decoration: none;
    font-weight: 500;
    font-family: 'Poppins',sans-serif;
    box-shadow: 0 5px 15px rgba(0,0,0,0.5);
    margin-bottom: 20px;
}
.right-side .links a{
    margin-top: 520px;
    padding-top: 20px;
    
}
.right-side .links a i{
    color: #000;
    height: 30px;
    width: 30px;
    padding-top: 5px;
    margin-left: 40px;

}
hr{
    display: block;
    margin-top: 0.5em;
    margin-bottom: 0.5em;
    margin-left: 10px;
    margin-right: 10px;
    border-style: inset;
    border-width: 1px;
}
.dashboard .profile-text a:hover{
    color: crimson;
}
</style>
<body>
		<%
			String employer_id=(String)session.getAttribute("employer_id");
			String name=(String)session.getAttribute("employer_name");
			String email=(String)session.getAttribute("employer_email");
			String mobile_no="";
			String company_name="";
			String company_link="";
			String address="";
			String state="";
			String district="";
			String description="";
		%>
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
		String sql1="select * from employer where email=?";
		PreparedStatement ps1;
		try
		{
			PreparedStatement preparedStatement = con.prepareStatement(sql1);
	        preparedStatement.setString(1, email);
	        ResultSet rs = preparedStatement.executeQuery();
	        while(rs.next()) 
	        {
				mobile_no=rs.getString("mobile_no");
				company_name=rs.getString("company_name");
				company_link=rs.getString("company_link");
				address=rs.getString("address");
				state=rs.getString("state");
				district=rs.getString("district");
				description=rs.getString("description");
			}
		}
		catch (SQLException e) 
		{
			e.printStackTrace();
		}
	%>
		
 <div class="dashboard">
         <div class="title-text">WORK<span> BOOK</span></div>
         <div class="profile-image">
             <img src="img/a4.jpg">
         </div>
         <div class="profile-icons">
             <h2>
                 <%=name %>
             </h2>
             <h3>
                 <%=description %>
             </h3>
             <hr>


         </div>
         <div class="profile-text">
             <p>
                <a href="employer_about.jsp">About</a><br>
             </p>
            
         </div>
     </div>
     <div class="right-side">
         <p class="logout">
            <a href="#">Logout</a> <br>

         </p>
        <p class="links">
            <a href="#"><i class="fa fa-facebook"></i></a><br>
            <a href="#"><i class="fa fa-twitter"></i></a><br>
            <a href="#"><i class="fa fa-instagram"></i></a>

        </p>


     </div>

  
</body>
</html>