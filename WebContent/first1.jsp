<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>How it works</title>
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
h4 {
	color: black;
	font-size: 2rem;
	margin-top: 5px;
	line-height: 2.5rem;
	font-weight: 300;
	letter-spacing: .05rem;
}
#work img
{
	padding-right: 100px;
	padding-bottom: 75px;
	padding-top: 50px;
}
img
{
	padding-left: 100px;
	padding-bottom: 75px;
	padding-top: 50px;
}
h1 {

	font-size: 4rem;
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
	background-image: url(./img/a8.jpeg);
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
h4
{
    display: block;
	width: fit-content;
	font-size: 2rem;
	position: relative;
	
}
h3
{
    display: block;
	width: fit-content;
	font-size: 3rem;
	position: relative;
	
}
.steps
{
    color:black;
    padding:50px;
    margin:10px;
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
	color: transparent;
	animation: text_reveal .5s ease forwards;
	animation-delay: 1s;
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
/

/* Keyframes */
@keyframes hamburger_puls {
	0% {
		opacity: 1;
		transform: scale(1);
	}
	100% {
		opacity: 0;
		transform: scale(1.4);
	}
}
@keyframes text_reveal_box {
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
}
/* End Keyframes */

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

  
  </style>
</head>
<body>
  <section id="header">
    <div class="header container">
      <div class="nav-bar">
        <div class="brand">
          <h1><b>WORK BOOK</b></h1>
        </div>
        <div class="nav-list">
          <div class="hamburger"><div class="bar"></div></div>
          <ul>
            <li><a href="First.jsp" data-after="About">About</a></li>
            <li><a href="#work" data-after="About">How it works</a></li>
          </ul>
        </div>
      </div>
    </div>
  </section>
  <section id="hero">
    <div class="hero container">
      <div>
        <h1><span></span></h1>
        
        <h3 style="color: white;">The ways in which freelancers can help your business are plenty.<span></span></h3>
        <h3 style="color:  crimson;">Follow the simple steps given below and be on your way to find your perfect freelancer!<span></span></h3>
        <a href="employer_signup.jsp" type="button" class="cta">POST A JOB</a>
      </div>
    </div>
  </section>
  <section id="work">
    <div class="about container">
      <div class="col-left">
        <div>
        </div>
      </div>
      <div class="col-right">
        <h1 style="color:  crimson; padding-left:125px"><b>How to hire a freelancer?</b><span></span></h1>
        <h3 style="padding-left:100px ; padding-right:100px; padding-top: 60px">1. Post your project</h3>
    <h4 style="padding-left:150px;padding-right:100px">Fill in a few details of your project. Give us a crisp definition of what is required out of the job. Freelancers will find you and raise bids from which you can choose your perfect freelancer.</h4>
    <h3 style="padding-left:100px; padding-top: 25px;">2. Find your freelancer</h3>
    <h4 style="padding-left:150px ;padding-right:100px">Alternatively, you can check out the profiles of freelancers catering to your needs by entering keywords. Compare and choose the freelancers who you think are the best fit for the job and contact them easily!</h4>
    <h3 style="padding-left:100px ;padding-top: 25px" >3. Payment and Negotiations</h3>
    <h4 style="padding-left:150px ;padding-right:100px">Once you contact our safe, and well certified freelancers, you can negotiate payments with them. Get ready to kick-start your project !</h4>
      </div>
      <img id="image1" src="img/a7.jpg">
    </div>
  </section>
  <section id="work">
    <div class="about container">
      <div class="col-left">
        <div>
        </div>
      </div>
      <img src="img/a6.jpg">
      <div class="col-right">
        <h1 style="color:  crimson; padding-left:50px"><b>How to become a freelancer?</b><span></span></h1>
        <h3 style="padding-left:50px ; padding-right:100px; padding-top: 60px">1. Set-up your account</h3>
    <h4 style="padding-left:100px;padding-right:100px">Set up your account by entering a few details that we will ask you. Provide an introduction to yourself and the type of work you do. You are all set to work now!</h4>
    <h3 style="padding-left:50px; padding-top: 25px;">2. Browse through projects</h3>
    <h4 style="padding-left:100px ;padding-right:100px">Check out the projects that employers will put out. Choose the projects you like and enter the bidding process!</h4>
    <h3 style="padding-left:50px ;padding-top: 25px" >3. Get a call from a potential employer</h3>
    <h4 style="padding-left:100px ;padding-right:100px">Some potential employers might contact you and offer you work after taking a look at your profile. So make sure that you make your profile look attractive!</h4>
    <h3 style="padding-left:50px ;padding-top: 25px" >4. Negotiate the payment and seal the deal</h3>
    <h4 style="padding-left:100px ;padding-right:100px">Go through your employer’s terms and conditions and negotiate if necessary. If the project seems like the perfect fit for you, congratulations on securing a job on our platform!</h4>
    </div>
    </div>
  </section>
  <script src="./app.js"></script>
</body>
</html>