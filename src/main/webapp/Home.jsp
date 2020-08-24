<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="ISO-8859-1">
<title>WEATHER PREDICTOR</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="font/Rimouski.css">
        
    
    
    <style>
    <link rel="stylesheet" href="style.css">
*{
    font-family: "Rimouski";
}

body{
	margin: 0;
	padding: 0;
	height: 100vh;
	background:  #2F323A;
	background: url("https://images.unsplash.com/photo-1496289600608-2f3625967342?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60");
	background-size: cover;
}
#intro {
    position: absolute;
    padding: 15px 25px;
    background-color: black;
}

#weatherContainer {
    background-color: rgba(0, 0, 0, 0.25);
    box-shadow: 1px 1px 5px black;
    padding: 50px;
    border-radius: 10px;
    position: absolute;
    visibility: hidden;
    
}
#weatherContainer h1 {
    margin: 5px;
    font-size: 42px;
    font-family: "Lucida Sans Unicode", "Lucida Grande", sans-serif;
    position:right;

    
}
::placeholder{
	color:black;
}
#searchContainer {
    padding: 40px;
    position: absolute;
    
}
#searchContainer input {
    width: 200px;
    text-align: center;

}
#searchContainer button {
    background-color:#53c68c;
    color: white;
    width: 100px;
}
.searchControl {
    box-shadow: 2px 2px 5px black;
    border: none;
    border-radius: 5px;
    padding: 5px;
    position:center;
    
}
::placeholder{
	color:white;
    opacity:0.3;
    }
@media (min-width: 768px) {

    #searchContainer input,
    #searchContainer button {
        width: 45vh;
        height: 12vh;
        left:50;
    }
}
#weatherMain {
    display: block;
    margin-bottom: 20px;


}
#weatherMain div {
    display: inline-block;

}
#weatherDescriptionHeader {
    font-size: 28px;
    vertical-align: 50%;
}
#temperature {
    font-size: 38px;
    vertical-align: 25%;
}
.bottom-details {
    display: block;
    font-size: 24px;
    text-align: right;
}
hr {
    margin-bottom: 20px;
}
::placeholder{
	color:white;
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
	color:black;
}

</style>
</head>

<body>

<div id="searchContainer">
     <input class="searchControl" type="text" style="text-transform:uppercase" placeholder="ENTER THE LOCATION"id="searchInput"><br>
       <button class="searchControl" id="searchBtn">SEARCH</button>
        </div>
        <div id="weatherContainer">
            <div id="weatherDescription">
                <h1 id="cityHeader"></h1>
                <div id="weatherMain">
                    <div id="temperature"></div>
                    <div id="weatherDescriptionHeader"></div>
                    <div><img id="documentIconImg"></div>
                </div>
                <hr>
                <div id="windSpeed" class="bottom-details"></div>
                <div id="humidity" class="bottom-details"></div>
                <div id="Pressure" class="bottom-details"></div>
              
            </div>
        </div>
        <script >
        let appId = "e14d56c61109b492e00dff083177f0eb";
        let units = 'metric'; 
        let searchMethod; // q means searching as a string.

        function getSearchMethod(searchTerm) {
            if(searchTerm.length === 5 && Number.parseInt(searchTerm) + '' === searchTerm)
                searchMethod = 'zip';
            else 
                searchMethod = 'q';
        }

        function searchWeather(searchTerm) {
            getSearchMethod(searchTerm);
            fetch(`http://api.openweathermap.org/data/2.5/weather?${searchMethod}=${searchTerm}&APPID=${appId}&units=${units}`)
                             .then((result) =>  {
                    return result.json();
                }).then((res) => {
                    init(res);
            });
        }

        function init(resultFromServer) {
            switch (resultFromServer.weather[0].main) {
                case 'Clear':
                    document.body.style.backgroundImage = "url(https://images.unsplash.com/photo-1566321343730-237ec35e53f3?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60)";
                    break;
                
                case 'Clouds':
                    document.body.style.backgroundImage = "url(https://images.pexels.com/photos/1048269/pexels-photo-1048269.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500)";
                    break;

                case 'Rain':
                    document.body.style.backgroundImage = "url(https://images.unsplash.com/photo-1530454411895-dc5536962cab?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60)";
                    break;
                case 'Drizzle':
                    document.body.style.backgroundImage = "url(https://images.unsplash.com/uploads/1412612985680bf8dc817/c3aacb90?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60)";
                    break;
                case 'Haze':
                    document.body.style.backgroundImage = "url(https://images.pexels.com/photos/1287075/pexels-photo-1287075.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500)";
                    break;

                case 'Mist':
                    document.body.style.backgroundImage = "url(https://images.unsplash.com/photo-1556485689-33e55ab56127?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60)";
                    break;    
                
                case 'Thunderstorm':
                    document.body.style.backgroundImage = "url(https://images.unsplash.com/photo-1463171515643-952cee54d42a?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60)";
                    break;
                
                case 'Snow':
                    document.body.style.backgroundImage = "url(https://images.unsplash.com/photo-1537210249814-b9a10a161ae4?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=500&q=60)";
                    break;
              

                default:
                    break;
            }

            let weatherDescriptionHeader = document.getElementById('weatherDescriptionHeader');
            let temperatureElement = document.getElementById('temperature');
            let humidityElement = document.getElementById('humidity');
            let windSpeedElement = document.getElementById('windSpeed');
            let precipitation = document.getElementById('Pressure');
            
            
            let cityHeader = document.getElementById('cityHeader');

            let weatherIcon = document.getElementById('documentIconImg');
            weatherIcon.src = 'http://openweathermap.org/img/w/' + resultFromServer.weather[0].icon + '.png';

            let resultDescription = resultFromServer.weather[0].description;
            weatherDescriptionHeader.innerText = resultDescription.charAt(0).toUpperCase() + resultDescription.slice(1);
            temperatureElement.innerHTML = Math.floor(resultFromServer.main.temp) + '&#176;';
            windSpeedElement.innerHTML = 'Wind Speed: ' + Math.floor(resultFromServer.wind.speed) + ' meter/s';
            cityHeader.innerHTML = resultFromServer.name;
            humidityElement.innerHTML = 'Humidity levels: ' + resultFromServer.main.humidity +  '%';
            precipitation.innerHTML ='Pressure: ' + resultFromServer.main.pressure + 'mb' ;
           
            setPositionForWeatherInfo();
        }

        function setPositionForWeatherInfo() {
            let weatherContainer = document.getElementById('weatherContainer');
            let weatherContainerHeight = weatherContainer.clientHeight;
            let weatherContainerWidth = weatherContainer.clientWidth;

            weatherContainer.style.left = `calc(50% - ${weatherContainerWidth/2}px)`;
            weatherContainer.style.top = `calc(50% - ${weatherContainerHeight/1.3}px)`;
            weatherContainer.style.visibility = 'visible';
        }

        document.getElementById('searchBtn').addEventListener('click', () => {
            let searchTerm = document.getElementById('searchInput').value;
            if(searchTerm)
                searchWeather(searchTerm);
        });
        </script>
        
        <script async defer src="https://maps.googleapis.com/maps/api/js?key=appId&callback=initMap"
  type="text/javascript"></script>
        <%
        response.setHeader("Cache-Control","no-cache,no-store,must-revalidate");
        if((String)session.getAttribute("userName")==null)
       	 response.sendRedirect("SignIn.jsp");	 
        %>

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
        <li><a href="<%=request.getContextPath()%>/signOut"><span class="glyphicon glyphicon-user"></span> LOGOUT</a></li>
      
      </ul>
    </div>
 </nav>

 
</body>
<iframe  align="right" width="500" height="650" src="https://embed.windy.com/embed2.html?lat=17.309&lon=91.934&detailLat=31.583&detailLon=91.846&width=650&height=450&zoom=3&level=surface&overlay=wind&product=ecmwf&menu=&message=true&marker=true&calendar=now&pressure=&type=map&location=coordinates&detail=true&metricWind=default&metricTemp=default&radarRange=-1" frameborder="0"></iframe>
<footer><center>
  <p>Copyright &copy; <script>document.write(new Date().getFullYear());
 </script><a href ="https://sites.google.com/view/ranjitprasath3/home"  target="_blank">,<b>ranjitsivakumar007@gmail.com</b></p>
	</footer>
</html>