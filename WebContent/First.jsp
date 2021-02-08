<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<title>Work book</title>
  <title></title>
</head>
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

.section-title {
	font-size: 4rem;
	font-weight: 300;
	color: black;
	margin-bottom: 10px;
	text-transform: uppercase;
	letter-spacing: .2rem;
	text-align: center;
}
.section-title span {
	color: crimson;
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
.brand h1 {
	font-size: 3rem;
	text-transform: uppercase;
	color: white;
}
.brand h1 span {
	color: crimson;
}

/* Header section */
#header {
	position: fixed;
	z-index: 1000;
	left: 0;
	top: 0;
	width: 100vw;
	height: auto;
}
#header .header {
	min-height: 8vh;
	background-color: rgba(31, 30, 30, 0.24);
	transition: .3s ease background-color;
}
#header .nav-bar {
	display: flex;
	align-items: center;
	justify-content: space-between;
	width: 100%;
	height: 100%;
	max-width: 1300px;
	padding: 0 10px;
}
#header .nav-list ul {
	list-style: none;
	position: absolute;
	background-color: rgb(31, 30, 30);
	width: 100vw;
	height: 100vh;
	left: 100%;
	top: 0;
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	z-index: 1;
	overflow-x: hidden;
	transition: .5s ease left;
}
#header .nav-list ul.active {
	left: 0%;
}
#header .nav-list ul a {
	font-size: 2.5rem;
	font-weight: 500;
	letter-spacing: .2rem;
	text-decoration: none;
	color: white;
	text-transform: uppercase;
	padding: 20px;
	display: block;
}
#header .nav-list ul a::after {
	content: attr(data-after);
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%) scale(0);
	color: rgba(240, 248, 255, 0.021);
	font-size: 13rem;
	letter-spacing: 50px;
	z-index: -1;
	transition: .3s ease letter-spacing;
}
#header .nav-list ul li:hover a::after {
	transform: translate(-50%, -50%) scale(1);
	letter-spacing: initial;
}
#header .nav-list ul li:hover a {
	color: crimson;
}
#header .hamburger {
	height: 60px;
	width: 60px;
	display: inline-block;
	border: 3px solid white;
	border-radius: 50%;
	position: relative;
	display: flex;
	align-items: center;
	justify-content: center;
	z-index: 100;
	cursor: pointer;
	transform: scale(.8);
	margin-right: 20px;
}
#header .hamburger:after {
	position: absolute;
	content: '';
	height: 100%;
	width: 100%;
	border-radius: 50%;
	border: 3px solid white;
	animation: hamburger_puls 1s ease infinite;
}
#header .hamburger .bar {
	height: 2px;
	width: 30px;
	position: relative;
	background-color: white;
	z-index: -1;
}
#header .hamburger .bar::after,
#header .hamburger .bar::before {
	content: '';
	position: absolute;
	height: 100%;
	width: 100%;
	left: 0;
	background-color: white;
	transition: .3s ease;
	transition-property: top, bottom;
}
#header .hamburger .bar::after {
	top: 8px;
}
#header .hamburger .bar::before {
	bottom: 8px;
}
#header .hamburger.active .bar::before {
	bottom: 0;
}
#header .hamburger.active .bar::after {
	top: 0;
}
/* End Header section */

/* Hero Section */
#hero {
	background-image: url(img/a3.jpg);
	background-size: cover;
	background-position: top center;
	position: relative;
	z-index: 1;
}
#hero::after {
	content: '';
	position: absolute;
	left: 0;
	top: 0;
	height: 100%;
	width: 100%;
	background-color: black;
	opacity: .7;
	z-index: -1;
}
#hero .hero {
	max-width: 1200px;
	margin: 0 auto;
	padding: 0 50px;
	justify-content: flex-start;
}
#hero h1 {
	display: block;
	width: fit-content;
	font-size: 4rem;
	position: relative;
	color:white;
	animation: text_reveal .5s ease forwards;
	animation-delay: 1s;
}
.hero h1 b
{
	color:crimson;
}
#hero h3 {
	display: block;
	width: fit-content;
	font-size: 3rem;
	position: relative;
	color: transparent;
}
#hero h1:nth-child(1) {
	animation-delay: 1s;
}
#hero h1:nth-child(2) {
	animation-delay: 2s;
}
#hero h1:nth-child(3) {
	animation: text_reveal_name .5s ease forwards;
	animation-delay: 3s;
}
#hero h1 span {
	position: absolute;
	top: 0;
	left: 0;
	height: 100%;
	width: 0;
	background-color: crimson;
	animation: text_reveal_box 1s ease;
	animation-delay: .5s;
}
#hero h1:nth-child(1) span {
	animation-delay: .5s;
}
#hero h1:nth-child(2) span {
	animation-delay: 1.5s;
}
#hero h1:nth-child(3) span {
	animation-delay: 2.5s;
}

/* About Section */
#about .about {
	flex-direction: column-reverse;
	text-align: center;
	max-width: 1200px;
	margin: 0 auto;
	padding: 100px 20px;
}
#about .col-left {
	width: 250px;
	height: 360px;
}
#about .col-right {
	width: 100%;
}
#about .col-right h2 {
	font-size: 1.8rem;
	font-weight: 500;
	letter-spacing: .2rem;
	margin-bottom: 10px;
}
#about .col-right p {
	margin-bottom: 20px;
}
#about .col-right .cta {
	color: black;
	margin-bottom: 50px;
	padding: 10px 20px;
	font-size: 2rem;
}
#about .col-left .about-img {
	height: 100%;
	width: 100%;
	position: relative;
	border: 10px solid white;
}
#about .col-left .about-img::after {
	content: '';
	position: absolute;
	left: -33px;
	top: 19px;
	height: 98%;
	width: 98%;
	border: 7px solid crimson;
	z-index: -1;
}


/* Keyframes */
/*@keyframes hamburger_puls {
	0% {
		opacity: 1;
		transform: scale(1);
	}
	100% {
		opacity: 0;
		transform: scale(1.4);
	}
}*/
/*@keyframes text_reveal_box {
	50% {
		width: 100%;
		left: 0;
	}
	100% {
		width: 0;
		left: 100%;
	}
}
@keyframes text_reveal {
	100% {
		color: white;
	}
}
@keyframes text_reveal_name {
	100% {
		color: crimson;
		font-weight: 500;
	}
}*/
/* End Keyframes 

/* Media Query For Tablet */
@media only screen and (min-width: 768px) {
	.cta {
		font-size: 1.5rem;
		padding: 20px 60px;
	}
	h1.section-title {
		font-size: 6rem;
	}

	/* Hero */
	#hero h1 {
		font-size: 7rem;
	}

	/* About */
	#about .about {
		flex-direction: row;
	}
	#about .col-left {
		width: 600px;
		height: 400px;
		padding-left: 60px;
	}
	#about .about .col-left .about-img::after {
		left: -45px;
		top: 34px;
		height: 98%;
		width: 98%;
		border: 10px solid crimson;
	}
	#about .col-right {
		text-align: left;
		padding: 30px;
	}
	#about .col-right h1 {
		text-align: left;
	}
@media only screen and (min-width: 1200px) {
	/* header */
	#header .hamburger {
		display: none;
	}
	#header .nav-list ul {
		position: initial;
		display: block;
		height: auto;
		width: fit-content;
		background-color: transparent;
	}
	#header .nav-list ul li {
		display: inline-block;
	}
	#header .nav-list ul li a {
		font-size: 1.8rem;
	}
	#header .nav-list ul a:after {
		display: none;
    }
    
    .domain{
        margin-top: 30px;
        display: flex;
        justify-content: center;
        align-items: center;
        min-height: 100vh;
        background: url(pexels-fauxels-3183151.jpg)no-repeat top center;
        background-size: cover;
    }
    .domain .container{
        position: relative;
        display: flex;
        justify-content: center;
        align-items: center;
        max-width: 1200px;
        flex-wrap: wrap;
        z-index: 1;
    }
    .domain .container .card{
        position: relative;
        width: 280px;
        height: 280px;
        margin: 30px;
        box-shadow: 20px 20px 50px rgba(0,0,0,0.5);
        border-radius: 15px;
        background: rgba(225, 225, 225, 0.1);
        overflow: hidden;
        display: flex;
        justify-content: center;
        align-items: center;
        border-top: 1px solid rgba(225, 225, 225, 0.5);
        border-left: 1px solid rgba(225, 225, 225, 0.5);
        backdrop-filter: blur(10px);
    }
    .domain .container .card .content{
        padding: 20px;
        text-align: center;
        transition: 0.5s;
        color: black;
    }
    .domain .container .card .content h3{
        font-size: 2.3em;
        color: #000;
        
        z-index: 1;
    }
    .domain .container .card .content p{
        font-size: 2em;
        color: #fff;
        font-weight: 300;
        color: black;
    }
    .domain .container .card .content a{
        position: relative;
        display: inline-block;
        padding: 8px 20px;
        margin-top: 15px;
        background: crimson;
        color: #fff;
        border-radius: 20px;
        text-decoration: none;
        font-weight: 500;
        box-shadow: 0 5px 15px rgba(0,0,0,0.5);
    }
    .rev{
        margin-top: 50px;
        display: flex;
        align-items: center;
        justify-content: center;
       
        width: 100%;
        height: 100%;
    }
    .rev .team-area{
        display: flex;
        width: 90%;
        justify-content: space-around;
    }
    .rev .single-team{
        width: 260px;
        height: 300px;
        padding: 24px;
        background: #fff;
        position: relative;
        display: flex;
        align-items: flex-end;
        transition: .6s ease-out;
        box-shadow: 0 10px 10px rgba(0,0,0,0.5);
    }
    .rev .single-team:hover{
        transform: translateY(15px);
    }
    .rev .single-team:hover:before{
        opacity: 1;
    }
    .rev .single-team:hover .team-text{
        opacity: 1;
        transform: translateY(0);
    }
    .rev .single-team:before{
        content: "";
        position: absolute;
        top:0;
        left:0;
        display: block;
        width: 100%;
        height: 100%;
        background: linear-gradient(to top,#000,transparent);
        z-index: 2;
        transition: 0.5s;
        opacity: 0;
    }
    .rev .single-team img{
        width: 100%;
        height: 100%;
        position: absolute;
        top:0;
        left: 0;
        object-fit: cover;
    }
    .rev .single-team .team-text{
        position: relative;
        z-index: 3;
        color: #fff;
        opacity: 0;
        transform: translateY(60px);
        transition: 0.5s;
    }
    .rev .team-text h2{
        margin: 0;
        font-family: sans-serif;
        letter-spacing: 3px;
    }
    .rev .team-text h4{
        font-size: 18px;
        font-family: 'Lucida Sans', 'Lucida Sans Regular', 'Lucida Grande', 'Lucida Sans Unicode', Geneva, Verdana, sans-serif;
        margin-top: 4px;
    
    }
    .rev .team-text p{
        letter-spacing: 1px;
        font-size: 15px;
        margin-top: 8px;
        font-family: 'Poppins',sans-serif;
        color: #fff;
    }
    
    #ins1 h3{
        font-family: 'Montserrat', sans-serif;
        margin-bottom: 20px;
        margin-top: 55px;
        font-size: 35px;
        color: black;
        padding-left: 30px;
    }
    #ins1 span{
        font-family: 'Montserrat', sans-serif;
        margin-bottom: 20px;
        margin-top: 55px;
        font-size: 35px;
        color:crimson;
        
    }
    #ins2 h3{
        font-family: 'Montserrat', sans-serif;
        margin-bottom: 27px;
        margin-top: 45px;
        font-size: 35px;
        color: black;
        padding-left: 30px;
    }
    #ins2 span{
        font-family: 'Montserrat', sans-serif;
        margin-bottom: 20px;
        margin-top: 55px;
        font-size: 35px;
        color:crimson;
        
    }
    .footer{
        background: rgb(4, 8, 31);
        width: 100%;
        height: 100px;
        display: flex;
        
        margin-top: 70px;
        color: #fff;

    }
    .footer .num h5{
         color: #fff;
         font-family: 'Montserrat',sans-serif;
         font-size: 15px;
         font-weight: 500;
         
         padding: 25px 150px;
          
    }
    .footer .num span{
        color: #fff;
        font-family: 'Montserrat',sans-serif;
        font-size: 15px;
        text-align: right;
        font-weight: 500;

    }
    
    .footer .links #sign{
        color:#fff;
        float: right;
        margin-right: -20px;
        padding-left: 180px;
        margin-top: 5px;
        font-size: 30px;
    }
    .footer .links #sign span{
        color: crimson;
    }
    .footer .links .l{
        margin-left: 180px;
    }
    .footer .links .l a{
        margin-top: 550px;
        padding-top: 20px;
       margin-left: 40;
        
    }
    .footer .links .l a i{
        color: #fff;
        height: 60px;
        width: 10px;
        padding-top: 20px;
        margin-left: 40px;
        
    
    }
</style>
<body>
  <section id="header">
    <div class="header container">
      <div class="nav-bar">
        <div class="brand">
          <h1>WORK BOOK</h1>
        </div>
        <div class="nav-list">
          <div class="hamburger"><div class="bar"></div></div>
          <ul>
            <li><a href="#about" data-after="About">About</a></li>
            <li><a href="first1.jsp" data-after="About">How it works</a></li>
          </ul>
        </div>
      </div>
    </div>
  </section>
  <section id="hero">
    <div class="hero container">
      <div>
        <h1><span></span></h1>
        <h1>Hire only the best freelancers <span></span></h1>
        <h1><b>to assist you with your work</b><span></span></h1>
        <a href="employer_signup.jsp" type="button" class="cta">HIRE FREELANCER</a>
        <a href="Sign_up.jsp" type="button" class="cta">WORK AS FREELANCER</a>
      </div>
    </div>
  </section>
  <section id="about">
    <div class="about container">
      <div class="col-left">
        <div>
          <img src="img/a4.jpg" alt="img">
        </div>
      </div>
      <div class="col-right">
        <h1 class="section-title">About <span><b>WORK BOOK</b></span></h1>
        <p>WorkBook is an online platform that helps you find freelancers in areas around you and worldwide. It helps you hire talented freelancers in a cost-effective way through its bidding process. Alternatively, you can register on our platform as a freelancer and begin building your career. Our effective rating and review system throws light on the working efficiency and capabilities of every freelancer on our platform and also helps you improve your niche as a freelancer. </p>
        <p>The novelty of our website is that we help you connect with non-technical workers as well as technical professionals. You can find freelancers here from all domains of work like writing, logistics, janitorial services, hair dresses, tailors and web-developers. Find your freelancer, and get your work done instantly and efficiently!</p>
        <p>We, at Work Book are here to give you the best solutions to your temporary, but important problems. Looking forward to having you here! </p>
      </div>
    </div>
  </section>
  <script src="./app.js"></script>
  <div id="ins2">
     <h3>
         Take a look at our <span>popular jobs</span>...
     </h3>
  </div>
  <div class="domain">
  <div class="container">
      
            <div class="card">
                <div class="content">
                    <h3>Web-Development</h3>
                    
                    <a href="Sign_up.jsp">Explore Jobs</a>

                </div>

            </div>
            <div class="card">
                <div class="content">
                    <h3>Graphic Design</h3>
                    
                    <a href="Sign_up.jsp">Explore Jobs</a>

                </div>

            </div>
            <div class="card">
                <div class="content">
                    <h3>Marketing & Sales</h3>
                    
                    <a href="Sign_up.jsp">Explore Jobs</a>

                </div>

            </div>
            <div class="card">
                <div class="content">
                    <h3>Janitorial Services</h3>
                    
                    <a href="Sign_up.jsp">Explore Jobs</a>

                </div>

            </div>
            <div class="card">
                <div class="content">
                    <h3>Logistics</h3>
                    
                    <a href="Sign_up.jsp">Explore Jobs</a>

                </div>

            </div>
            <div class="card">
                <div class="content">
                    <h3>Laundry Service</h3>
                    
                    <a href="Sign_up.jsp">Explore Jobs</a>

                </div>

            </div>

        </div>
        <script type="text/javascript" src="vanilla-tilt.js"></script>
        <script type="text/javascript">
	VanillaTilt.init(document.querySelectorAll(".card"), {
		max: 25,
        speed: 400,
        glare: true,
    "max-glare":   1
	});
	
	//It also supports NodeList
	VanillaTilt.init(document.querySelectorAll(".card"));
    </script>
    </div>
    <div id="ins1">
        <h3>
            Find out <span>what our users think</span> about us...
        </h3>
    </div>
    <div class="rev">
        
        <div class="team-area">
            <div class="single-team">
                <img src="img1.jpg" >
                <div class="team-text">
                    <h2>Divya</h2>
                    <h4>UI/UX Designer</h4>
                    <p>"I found my first freelancer job on Workbook. It has been a great experience and I have offers flowing in!"</p>
                </div>
 
            </div>
            <div class="single-team">
             <img src="img3.jpg" >
             <div class="team-text">
                 <h2>Maha Shree</h2>
                 <h4>CEO, Facebook</h4>
                 <p>"I found the best freelancers here"</p>
             </div>
 
         </div>
         <div class="single-team">
             <img src="img2.jpg" >
             <div class="team-text">
                 <h2>Samraj</h2>
                 <h4>Tailor</h4>
                 <p>"I have boosted my business after joining this platform"</p>
             </div>
 
         </div>
         </div>

    </div>
    <div class="footer">
        <div class="num">
            <h5>
                Number of users:<br>
                <span>127654</span>
            </h5>
            
        </div>
        <div class="num">
            <h5>
                Number of jobs:<br>
                <span>87346582</span>
            </h5>
            
        </div>
        <div class="links" >
            <p id="sign">
                WORK<span>BOOK</span><br>
            </p>
            <p class="l">
                <a href="#"><i class="fa fa-facebook"></i></a>
                <a href="#"><i class="fa fa-twitter"></i></a>
                <a href="#"><i class="fa fa-instagram"></i></a>
            </p>
           

        </div>

    </div>

</body>
</html>