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
<%@include file="user_profile.jsp" %>

    <div class="box">
        <div class="title">
            <div class="text">
                <h1>ABOUT</h1>
            </div>
            
        </div>
        <div class="content">
            <h4>
                <div class="ind">
                    Name : <span style="margin-left:78px;"><%=name %></span> <br>
                </div>
                <div class="ind">
                    Email : <span style="margin-left:80px;"><%=email %></span>  <br>
                </div>
                <div class="ind">
                    Phone : <span style="margin-left:75px;"><%=mobile_no %></span> <br>
                </div>
                <div class="ind">
                    Job : <span style="margin-left:97px;"><%=job %></span><br>
                </div>
                <div class="ind">
                   Description : <span style="margin-left:34px;"><%=job_description %></span><br>
                </div>
                <div class="ind">
                    Location : <span style="margin-left:58px;"><%=location %></span> <br>
                </div>
                <div class="ind">
                    Date of birth : <span style="margin-left:28px;"><%=dob %></span><br>
                </div>
                
            </h4>
        </div>
    </div>
    
    
</body>
</body>
</html>