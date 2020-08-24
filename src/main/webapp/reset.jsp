<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>

<style>
	body{
	font-family:"Rimouski";
	margin: 0;
	padding: 0;
	height: 100vh;
	background:  #2F323A;
	background: url("https://images.unsplash.com/photo-1578070181910-f1e514afdd08?ixlib=rb-1.2.1&auto=format&fit=crop&w=500&q=60");
	background-size: cover;
}
footer {
	 text-align:"left";
	 background-color:#56a0d3;
	 color:red;
	 position:fixed;
	 bottom: 0;
	 width:100%;
	 opacity:0.9;
     opacity: 1; 
     background-color: rgba(0,0,0,0.6);

	 }
::placeholder{
	color:white;
}

.form{
	background: #000;
	z-index: 1;
	font-family:"Rimouski" ;
	position: absolute;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	width: 400px;
	padding: 0 45px 30px 45px;
	text-align: center;
	border-radius: 10px;
	opacity: 0.4;
}

.form h2{
	color: #fff;
	font-size: 28px;
	font-weight: 500;
	text-align: center;
	text-transform: uppercase;
}

.form .icons i{
	color: #fff;
	font-size: 25px;
	margin: 0 30px 30px 30px;
	transition: 0.8s;
	transition-property: color, transform;
}

.form .icons i:hover{
	color: #06C5CF;
	transform: scale(1.3);
}

.form input{
	outline: 0;
	background: none;
	font-size: 15px;
	color: #fff;
	text-align: center;
	width: 265px;
	margin-bottom: 30px;
	padding: 15px;
	box-sizing: border-box;
	border: 2.5px solid #2E86DE;
	border-radius: 25px;
	transition: 0.5s;
	transition-property: width;
}

.form input:hover{
	width: 300px;
}

.form input:focus{
	width: 300px;
}

.form button{
	outline: 0;
	background: none;
	color: #fff;
	font-size: 14px;
	text-transform: uppercase;
	width: 150px;
	padding: 15px;
	border: 2.5px solid #10AC84;
	border-radius: 25px;
	cursor: pointer;
	transition: 0.5s;
	transition-property: background, transform;
}

.form button:hover, .form button:active, .form button:focus{
	background: #10AC84;
	transform: scale(1.1);
}

.form .options{
	color: #bbb;
	font-size: 14px;
	margin: 20px 0 0;
}

.form .options a{
	text-decoration: none;
	color: #06C5CF;
}
</style>
<meta charset="ISO-8859-1">
<title>RESET PASSWORD</title>
<link rel="stylesheet" href="font/Rimouski.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">WEATHER PREDICTOR</a>
    </div>
     <ul class="nav navbar-nav navbar-right">
        <li><a href="SignIn.jsp"><span class="glyphicon glyphicon-user"></span>  SIGN IN</a></li>
      </ul>
    </div>
 </nav>
 <body>
<div class="form">
			<!--login form start-->
			<form class="reset-form" action="resetPassword" onsubmit="return validateForm()" method="post">
				<h2>RESET PASSWORD</h2><br></br>
				<input id="text" autocomplete="off" type="text" name="otp" value="" placeholder="OTP" required>
				<input id="password" autocomplete="off" type="password" name="password" value="" placeholder="PASSWORD" required>
				<input id="password" autocomplete="off" type="password" name="password" value="" placeholder=" CONFORM PASSWORD" required>
				<button type="submit" name ="button" value="Submit">SUBMIT<a href="Login.jsp"> </a></button><br></br>
				
				
			</form>
			<!--login form end-->
		</div>
		<!--form area end-->
</body>
<footer><center>
  <p>Copyright &copy; <script>document.write(new Date().getFullYear());
 </script><a href ="https://sites.google.com/view/ranjitprasath3/home"  target="_blank">,<b>ranjitsivakumar007@gmail.com</b></p>
	</footer>
</html>