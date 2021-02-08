<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
	<title>Insert title here</title>
 	<script src="https://apis.google.com/js/platform.js" async defer></script>
   <meta name="google-signin-client_id" content="794853829820-88a6t0vvn6eacm1j3v9f82g9ko384l9q.apps.googleusercontent.com">
 	     <style>
        .top{
            display: flex;
            flex-direction: row;
            justify-content: center;
            align-items: center;
            
            justify-content: space-between;
        }
        .signin{
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            margin-left: 50px;
            
            width: 700px;
            height: 630px;
        }
        .input_email{
            height: 40px;
            width: 400px;
        }
        .input_password{
            margin-top: 20px;
            height: 40px;
            width: 400px;
        } 
        .submitbtn{
            margin-top: 20px;
            height: 45px;
            width: 410px;
            font-size: larger;
            color: white;
            background-color: crimson;
            border: none;
            pointer:cursor;
        }
        .google_btn{
            margin-top: 5px;
            height: 45px;
            width: 410px;
            font-size: large;
            color: crimson;
            background-color: white;
         	
        }
        form
        {
         margin-left:140px;
        }
    </style>

</head>
<body>
<div class="top">
        <div class="signin">
            <h1 style="text-transform: uppercase; color: crimson;">SignIn to WorkBook...</h1>
            <form action="employer_signup_db.jsp">
            <input type="email" required name="email" class="input_email" placeholder="   Email"/> 
            <input type="password" required name="password" class="input_password" placeholder="   password"/>
            <input type="submit" class="submitbtn" value="Sign in"/>
            </form>
            <p>Don't have an account? <a href="http://localhost:8088/Bootathon2/newemployer_form.jsp">Sign up</a></p>
           
            <div style="margin-top: 5px;height: 45px;width: 410px;font-size:20px;color: crimson;background-color: white; " class="g-signin2 btn" data-onsuccess="onSignIn" id="myP"></div>
        </div>
        <img src="signup.jpg" width="400px" height="620px" style="float: right;"/>
    </div>
	</body>
     <script type="text/javascript">
      function onSignIn(googleUser) {
      // window.location.href='success.jsp';
      var profile = googleUser.getBasicProfile();
      var name=profile.getName();
      var email=profile.getEmail();
      var id = profile.getId();
      //document.getElementById("name").innerHTML = name;
      //document.getElementById("email").innerHTML = email;
      //document.getElementById("id").innerHTML = id;
      window.location.href = "http://localhost:8088/Bootathon2/checklogin_employer.jsp?email="+email+"&name="+name+"&id="+id;
   }
  </script>

</html>