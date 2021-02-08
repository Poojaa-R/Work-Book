<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>
      Profile
</title>
        <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
        <link rel="stylesheet" href="hire_style.css">
        <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
        <script src='https://kit.fontawesome.com/a076d05399.js'></script>
   <script>
   	function myFunction1(employer_id,job_id) 
   	{
   		var employee_bid_amount= document.getElementById("employee_bid_amount").value;
   		window.location.href = "http://localhost:8088/Bootathon2/job_detaildb.jsp?job_id="+job_id+"&employer_id="+employer_id+"&employee_bid_amount="+employee_bid_amount;
	}
   </script>
   <%@include file="nav_bar.jsp" %>
   <style>
   @import 'https://fonts.googleapis.com/css?family=Montserrat:300, 400, 700&display=swap';
* {
	padding: 0;
	margin: 0;
	box-sizing: border-box;
}
html {
	font-size: 10px;
	font-family: 'Montserrat', sans-serif;
	scroll-behavior: smooth;
}
a {
	text-decoration: none;
}
.container {
	min-height: 100vh;
	width: 100%;
	display: flex;
	align-items: center;
	justify-content: center;
}
img {
	height: 100%;
	width: 100%;
	object-fit: cover;
}
p {
	color: black;
	font-size: 1.4rem;
	margin-top: 5px;
	line-height: 2.5rem;
	font-weight: 300;
	letter-spacing: .05rem;
}

.cta {
	display: inline-block;
	padding: 10px 30px;
	color: white;
	background-color: transparent;
	border: 2px solid crimson;
	font-size: 2rem;
	text-transform: uppercase;
	letter-spacing: .1rem;
	margin-top: 30px;
	transition: .3s ease;
	transition-property: background-color, color;
}
.cta:hover {
	color: white;
	background-color: crimson;
}

.row button{
    position: relative;
    display: inline-block;
    padding: 8px 20px;
    margin-top: 25px;
    background: crimson;
    color: #fff;
    border-radius: 8px;
    text-decoration: none;
    border: none;
    box-shadow: 0 5px 15px rgba(0,0,0,0.5);
    width: 80px;
    cursor: pointer;
    height: 30px;
    padding: 10px;
}

.div2 {
  width: 360px;
  height: 35px;  
  padding: 25px;
  padding-top:35px;
  border: 4px solid red;
  box-sizing: border-box;
  font-size: 15px;
	font-family: 'Montserrat', sans-serif;
}
   
        body
        {
            font-family: sans-serif;
            color:#3c3939;
            background-color: #f1f1f1;
        }
        .profile-card
        {
            width:400px;
            margin:auto;
            padding-top: 0px;
            background:#fff;
            box-shadow:0 4px 10px 0 rgba(0,0,0,0.5);
        }
        .image-container
        {
            position:relative;
        }
        .info
        {
            color:#4b4fe2;
            margin-right:16px;
        }
        .main-container
        {
            padding:20px;
            font-size: 10px;
	font-family: 'Montserrat', sans-serif;

        }
        .title
        {
            position:absolute;
            left:15px;
            bottom:0;
        }
        .column 
        {
            float: left;
            width: 40%;
            height:100%;
            padding: 0 100px;
            padding-top: 100px;
        }
         .column1
        {
            float: left;
            width: 40%;
            height:100%;
            padding: 0 700px;
            padding-top: 0px;
        }
        input[type=text], select, textarea {
  width: 50%;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 4px;
  resize: vertical;
}

label {
  padding: 12px 12px 12px 0;
  display: inline-block;
}

input[type=submit] {
  background-color: crimson;
  color: white;
  padding: 12px 20px;
  border: none;
  border-radius: 4px;
  cursor: pointer;
  float: right;
}

input[type=submit]:hover {
  background-color:red ;
}

.container {
  border-radius: 5px;
  background-color: #f2f2f2;
  padding: 20px;
}

.col-25 {
  float: left;
  width: 25%;
  margin-top: 6px;
}
.row:after {
  content: "";
  display: table;
  clear: both;
}
@media screen and (max-width: 600px) {
  .col-25, input[type=submit] {
    width: 100%;
    margin-top: 0;
  }
}
    </style>
    </head>
    <%ArrayList<String> al=new ArrayList<String>(); %>
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
        
          <div class="column">
           <div class="profile-card">
               <div class="image-container">
                   
                   <div class="title">
                       <h2></h2>

                   </div>
               </div>
               <div class="main-container">
               <%
				try{
					int job_id=Integer.parseInt(request.getParameter("job_id"));
				connection = DriverManager.getConnection(connectionUrl, userid, password);
				statement=connection.createStatement();
				//String id=request.getParameter("job_id");
				String sql ="select * from job_post where job_id=?";
				PreparedStatement ps=connection.prepareStatement(sql);
				ps.setInt(1,job_id);
				resultSet = ps.executeQuery();
				
				while(resultSet.next())
				{
					al.add(resultSet.getString("email"));
					%>
					 
					 <div class="div2"><h2><center><%=resultSet.getString("job") %></center></h2></div><br>
					 <p style="color:crimson ;font-size:15px"> <b>Job Description: <%=resultSet.getString("job_description") %></b></p><br>
					 <i class="material-icons" style="font-size:30px;color:crimson">email</i><i style="font-size:15px"><%="    "+al.get(0) %></i><br><br>
					<%
					al.add(String.valueOf(resultSet.getInt("mobile_no")));
					%>
					 <i class='fas fa-phone-alt' style="font-size:30px;color:crimson"></i><i style="font-size:15px"><%="    "+al.get(1) %></i><br><br>
					<%
					al.add(resultSet.getString("address"));
					%>
					 <i class='fas fa-building' style="font-size:30px;color:crimson"></i><i style="font-size:15px"><%="    "+al.get(2) %></i><br><br>
					<%
					
						al.add(resultSet.getString("state"));
					%>
					 	<i class="material-icons" style="font-size:30px;color:crimson">add_location</i><i style="font-size:15px"><%="    "+al.get(3) %></i><br><br>
					<%
						al.add(resultSet.getString("district"));
					%>
						<i class="material-icons" style="font-size:30px;color:crimson">add_location</i><i style="font-size:15px"><%="    "+al.get(4) %></i><br><br>
					<%
					al.add(String.valueOf(resultSet.getInt("bid_amount")));
					%>
					<i class='fas fa-rupee-sign' style="font-size:30px;color:crimson"></i><i style="font-size:15px"><%="    "+al.get(5) %></i><br><br>
					<%
					al.add(String.valueOf(resultSet.getInt("no_of_days")));
					%>
					<i class='far fa-calendar' style="font-size:30px;color:crimson"></i><i style="font-size:15px"><%="    "+al.get(6) %></i><br><br>
					<%
					al.add(String.valueOf(resultSet.getInt("no_of_people")));
					%>
					<i class='fas fa-user-friends' style="font-size:30px;color:crimson"></i><i style="font-size:15px"><%="    "+al.get(7) %></i><br><br>
					<%
					al.add(resultSet.getString("due_date"));
					%>
					<i class='far fa-calendar-alt' style="font-size:30px;color:crimson"></i><i style="font-size:15px"><%="    "+al.get(8) %></i><br><br>
					<%
					al.add(resultSet.getString("job"));
					al.add(resultSet.getString("employer_id"));
					al.add(resultSet.getString("job_id"));

				}
				
				%>  
				
               </div>
           </div>
           </div>
           <%
    connection.close();
				}
catch (Exception e)
{
e.printStackTrace();
}
%>
          <div class="column">
           <div class="profile-card">
               <div class="image-container">
                   
                   <div class="title">
						
                   </div>
               </div>
               <div class="main-container">
                     <div class="div2"><h2><center>BID NOW</center></h2></div>
    
    <br><br>
    <div class="row">
      <div class="col-25">
        <label style="font-size:17px ; color:crimson"><b>Email-id</b></label>
      </div>
      <div class="col-75">
        <input type="text" name="email" placeholder="your mail-id.." autocomplete="off">
      </div>
    </div>
    <br>
    <div class="row">
      <div class="col-25">
        <label style="font-size:17px ; color:crimson"><b>Name</b></label>
      </div>
      <div class="col-75">
      <br>
        <input type="text"  name="name" placeholder="your name.." autocomplete="off">
      </div>
    </div>
    <br>
    <div class="row">
      <div class="col-25">
      <br>
        <label style="font-size:17px ; color:crimson"><b>Mobile</b></label>
      </div>
      <div class="col-75">
      <br>
      <br>
        <input type="text"  name="location" placeholder="your mobile..">
      </div>
    </div>
    
    <br>
    <div class="row">
      <div class="col-25">
      <br>
        <label style="font-size:17px ; color:crimson"><b>Location</b></label>
      </div>
      <div class="col-75">
      <br>
      <br>
        <input type="text"  name="location" placeholder="your location..">
      </div>
    </div>
    <br>
    <div class="row">
      <div class="col-25">
      <br>
        <label style="font-size:17px ; color:crimson"><b>Bid Amount</b></label>
        
      </div>
      <div class="col-75">
      <br>
      <br>
        <input type="text"  name="employee_bid_amount" id="employee_bid_amount" placeholder="bid amount..">
      </div>
    </div>
    
    <div class="row">
      <button onclick="myFunction1('<%= al.get(10) %>','<%= al.get(11) %>')">Bid now</button>
    </div>
               </div>
           </div>
           </div>
 
</body>
</html>