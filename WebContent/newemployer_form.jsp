<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
        <title>FORM</title>
        <script>
        function formValidation()
        {
        	var name=document.registration.name;
        	var email=document.registration.email;
        	var location=document.registration.location;
        	var mobile=document.registration.mobile_no;
	        var uid = document.registration.name;
	        var passid = document.registration.password.value;
	        var con_pass=document.registration.confirm_password.value;
	        var passid_len = passid.length;
	        var b=true;
	        if(passid_len==0 || passid_len<=8 || passid_len>=15)
	        {
	        	document.getElementById("passid").innerHTML = "Set a strong password";
	        	b=false;
	        }
	        if(con_pass!==passid)
	        {
	       		//alert(con_pass +" "+passid);
	        	document.getElementById("con_passid").innerHTML = "Password does not match";
	        	b=false;
	        }
	        if(mobile.value.length<10 || mobile.value.length>10)
	        {
	        	document.getElementById("phone").innerHTML = "Incorrect mobile number";
	        	b=false;
	        }
	       	return b;
        }
        </script>
        
        <style>
          @import url('https://fonts.googleapis.com/css?family=Roboto');   

*{
  margin: 0;
  padding: 0;
  box-sizing: border-box;
  outline: none;
  font-family: 'Roboto', sans-serif;
}

body{
  background: url(../HTML/aesthetic\ red\ -\ Google\ Search.jfif) no-repeat top center;
  background-size: cover;
  height: 100vh;
}

.wrapper{
  position: absolute;
  top: 50%;
  left: 50%;
  transform: translate(-50%, -50%);
  width: 100%;
  max-width: 550px;
  background: rgba(0,0,0,0.8);
  padding: 30px;
  border-radius: 5px;
  box-shadow: 0 0 10px rgba(0,0,0,0.3);
  box-shadow: 20px 20px 50px rgba(0,0,0,0.5);
}

.wrapper .title h1{
  color:#fff;
  text-align: center;
  margin-bottom: 25px;

}

.contact-form{
  display: flex;
  
}

.input-fields{
  display: flex;
  flex-direction: column;
  margin-right: 4%;
}

.input-fields,
.msg{
  width: 48%;
}

.input-fields .input,
.msg textarea{
  margin: 10px 0;
  background: transparent;
  border: 0px;
  border-bottom: 2px solid #fff;
  padding: 10px;
  color: #fff;
  width: 100%;
}

.msg textarea{
  height: 212px;
}

::-webkit-input-placeholder {
  /* Chrome/Opera/Safari */
  color: rgb(207, 202, 202);
}
::-moz-placeholder {
  /* Firefox 19+ */
  color: rgb(207, 202, 202);
}
:-ms-input-placeholder {
  /* IE 10+ */
  color: rgb(207, 202, 202);
}
input:focus::placeholder {
  color: transparent;
}
textarea:focus::placeholder {
  color: transparent;
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
.btn {
    background: crimson;
    text-align: center;
    padding: 15px;
    border-radius: 30px;
    color: #fff;
    cursor: pointer;
    text-transform: uppercase;
}

@media screen and (max-width: 600px){
  .contact-form{
    flex-direction: column;
  }
  .msg textarea{
    height: 80px;
  }
  .input-fields,
  .msg{
    width: 100%;
  }
}
li {
    list-style-type: none;
}
        </style>
</head>
    <body>
   
        <div class="wrapper">
            <div class="title">
              <h1>SIGN UP</h1>
            </div>
            <form name='registration' action="newemployer_form.jsp"  onSubmit="return formValidation();">
            <div class="contact-form">
              <div class="input-fields">
                <input type="text" class="input" name="name" placeholder="Name">
                <input type="tel" class="input" name="mobile_no" placeholder="Mobile number">
                <input type="text" class="input" name="email" placeholder="Email id">
                <input type="password" class="input" name="password" placeholder="Password">
                <input type="password" class="input" name="confirm_password" placeholder="Confirm Password">
                <input type="text" class="input" name="company_name" placeholder="Company_name">
                <input type="text" class="input" name="company_link" placeholder="Company_link">
                <input type="text" class="input" name="address" placeholder="Enter your address..">
                 <input type="text" class="input" name="state" placeholder="Enter your State..">
                 <input type="text" class="input" name="district" placeholder="Enter your district..">
              </div>
              <div class="msg">
                
                <textarea name="description" placeholder="Description"></textarea>
                
               <br>
               <br>
                  <input type="submit">
              
              </div>
            </div>
            <li><label id="passid" style="color:red"></label></li>
            <li><label id="con_passid" style="color:red"></label></li>
            <li><label id="phone" style="color:red"></label></li>
          </form>
          </div>
    </body>
   <%@page import="java.sql.*" %>
   <%@page import="java.util.*" %>
<%
	 String dbUrl = "jdbc:mysql://localhost:3306/database1";
	 String dbUname = "root";
	 String dbPassword = "root";
	 String dbDriver = "com.mysql.jdbc.Driver";
		try 
		{
		Class.forName(dbDriver);
		} 
		catch(ClassNotFoundException e)
		{
		e.printStackTrace();
		}
		Statement statement = null;
		ResultSet resultSet = null;
		String employer_id=UUID.randomUUID().toString();
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
	
	} catch (SQLException e) 
	{
		e.printStackTrace();
	}
	employer_id="";
	String employer_name="";
	String employer_email="";
	String sql1="select * from employer where email=?";
	PreparedStatement ps1;
	int flag=0;
	try
	{
		PreparedStatement preparedStatement = con.prepareStatement(sql1);
        preparedStatement.setString(1,email);
        ResultSet rs = preparedStatement.executeQuery();
        while(rs.next()) 
        {
        	employer_id=rs.getString("employer_id");
        	employer_name=rs.getString("name");
        	employer_email=rs.getString("email");
        	session.setAttribute("employer_id",employer_id);
        	session.setAttribute("employer_name",employer_name);
        	session.setAttribute("employer_email",employer_email);
           response.sendRedirect("job_post.jsp");
           flag=1;
		}
	}
	catch (SQLException e) 
	{
		e.printStackTrace();
	}

	
%>
   
</html>