<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
 <script src='https://kit.fontawesome.com/a076d05399.js'></script>
<title>Insert title here</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" >
    <title>Message</title>
    <style>
        @import url('https://fonts.googleapis.com/css?family=Poppins:200,300,400,500,600,700,800,9--&display=swap');

*{
    margin: 0;
    padding: 0;
    box-sizing: border-box;
    font-family: 'Poppins',sans-serif;
}
body{
    display: flex;
    justify-content: center;
    align-items: center;
    min-height: 100vh;
    

}
.container{
    position: relative;
    width: 480px;
    color: white;
    height: 280px;
    margin: 30px;
    box-shadow: 20px 20px 50px rgba(0,0,0,0.5);
    border-radius: 15px;
    background: rgba(225, 225, 225, 0.1);
    overflow: hidden;
    display: flex;
    background-color: rgb(240, 39, 79);
    justify-content: center;
    align-items: center;
    border-top: 1px solid rgba(225, 225, 225, 0.5);
    border-left: 1px solid rgba(225, 225, 225, 0.5);
    backdrop-filter: blur(55px);
}
.container .check i{
    content: '\f058';
    color: white;
    height: 30px;
    width: 30px;
    font-size:40px;
}
    </style>
</head>
<body>
<div class="container">
        <div class="check">
        
           
             <i class='far fa-frown' style='font-size:36px'></i>
        </div>
      <!--- <img src="t.png.png" >
        <div class="cont">-->
            <p style="font-size:20px; margin-left:30px;">Your request is not yet accepted !!</p> 
        </div>

    </div>
   
</body>
</html>