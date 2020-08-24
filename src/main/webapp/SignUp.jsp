<!DOCTYPE html>
<html lang="en" dir="ltr">
	<head>
	<script type="text/javascript">
	function validateForm()
{
var email = document.getElementById("email");
var name=  document.getElementById("name");
if (email.value == "" || name.value=="")
	{
	alert("NO BLANK VALUES");
	return false;
	
	}
else
	{
	 return true;
	}

}
</script>
	<style>
body{
	font-family: "Rimouski"
	margin: 0;
	padding: 0;
	height: 100vh;
	background:  #2F323A;
	background: url("https://images.unsplash.com/photo-1448067686092-1f4f2070baae?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60");
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
	font-family: "Rimouski";
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
	
	
		<meta charset="utf-8">
		<title>SIGNUP</title>
		<link rel="stylesheet" href="style.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
	</head>
	<meta charset="utf-8">
		<title>WEATHER PREDICTOR</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.0/css/all.min.css">
		<meta name="viewport" content="width=device-width, initial-scale=1">
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>

<nav class="navbar navbar-inverse">
  <div class="container-fluid">
    <div class="navbar-header">
      <button type="button" class="navbar-toggle" data-toggle="collapse" data-target="#myNavbar">
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>                        
      </button>
      <a class="navbar-brand" href="#">WEATHER PREDICTOR</a>
    </div>
      <ul class="nav navbar-nav navbar-right">
        <li><a href="SignIn.jsp"><span class="glyphicon glyphicon-user"></span>  LOGIN</a></li>
      </ul>
    </div>
 </nav>

		<!--form area start-->
		<div class="form">
			<!--login form start-->
			<form class="Signup-form" action="generateOtp" onsubmit="return validateForm()" method="post">
				<h2>SIGNUP</h2>
				
				<input id ="name" autocomplete="off" type="text" name="Name" value="" placeholder="Name" >
				<input id="email" autocomplete="off" type="email" name="Email" value="" placeholder="Email">
				
				<button type="submit" name="button">JOIN<a href="Mail.jsp"></a></button>
				<p class="options"> Registered? <a href="SignIn.jsp">GO TO YOUR ACCOUNT</a></p>
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


































































































<!---->
