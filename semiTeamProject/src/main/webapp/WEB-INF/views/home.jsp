<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
@font-face {
	font-family: "GongGothicBold";
	src:
		url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_20-10@1.0/GongGothicBold.woff")
		format("woff");
	font-weight: normal;
	font-style: normal;
}

body {
	margin:0;
	background: url(${url}/img/구름.gif) no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}


#weather {
	position: fixed;
	display: flexbox;
	align-items: center;
	text-align: center;
	width: 400px;
	height: 400px;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	color: #4d4d4d;
}

#weather span:first-child {
	display: block;
	font-size: 50px;
}

#weather span:last-child {
	display: inline-block;
	font-size: 24px;
}

.submenu a:link {
	text-decoration: none;
	color: #333333;
}

.submenu a:visited {
	text-decoration: none;
	color: #333333;
}

.submenu a:active {
	text-decoration: none;
	color: #333333;
}

.submenu a:hover {
	text-decoration: underline;
	color: #518070;
	transform: scale(1.5);
	font-family: "GongGothicBold";
}

.submenu {
	display: flex;
	justify-content: space-around;
	visibility: hidden;
	transition: all 300ms ease-in;
}

.submenu a {

	font-family: "GongGothicBold";
	text-align: center;
	font-size: 54px;
	color: #333333;
	text-shadow: 2px 2px 0px #ffffff, 5px 4px 0px rgba(0, 0, 0, 0.15);
}

.submenu-a-cody {
	position: absolute;
	bottom: 200px;
	left:350px;
}

.submenu-a-food {
	position: absolute;
	bottom: 200px;
	right:350px;
}

@keyframes blink-effect { 50% {opacity: 0;}}
.blink {
	animation: blink-effect 1s step-end infinite;
	/* animation-name: blink-effect; animation-duration: 1s; animation-iteration-count:infinite; animation-timing-function:step-end; */
	text-align: center;
	position: absolute;
	top: 140px;
	left: 50%;
	transform: translate(-50%, 0);
}
</style>

<p class="blink">Click Me ↓</p>
<div id="weather" class="rotate-center" onmouseenter="return mouseenter"
	ondblclick="dbmouse()">
	<span></span> <span></span>
</div>
<div class="submenu">


	<div class="submenu-a submenu-a-cody"><a href="${url}/cody/main_cody.jsp">코디추천</a></div> 
	<div class="submenu-a submenu-a-food"><a href="${url}/food/main_food.jsp">음식추천</a></div> 
	<a href="/map/main_map">지도</a>

	<c:if test="${logId!='master'}">
		<div class="submenu-a submenu-a-cody"><a id="main_codylink" href="">코디추천</a></div>
	</c:if>
	<c:if test="${logId=='master'}">
		<div class="submenu-a submenu-a-cody"><a href="${url}/master/master_cody">코디관리</a></div>
	</c:if>

	<div class="submenu-a submenu-a-food"><a href="/food/main_food">음식추천</a></div> 
	
	
	<c:if test="${logId != 'master' }">
		<div class="submenu-a submenu-a-food"><a href="/food/main_food">음식추천</a></div> 
	</c:if>
	<c:if test="${logId == 'master' }">
		<div class="submenu-a submenu-a-food"><a href="/master/master_food">음식관리</a></div> 
	</c:if>
	
</div>

<script>
     function onGeoOk(position) {
      const API_KEY = "f5c60c534d9d9d62379dd9a1123c1983";
       const lat = position.coords.latitude;
       const lon = position.coords.longitude;
       
       const url = "https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&lang=kr&appid="+API_KEY+"&units=metric";
       fetch(url)
         .then((response) => response.json())
         .then((data) => {
           const weather = document.querySelector("#weather span:first-child");
           const city = document.querySelector("#weather span:last-child");
           city.innerText = data.name;
           weather.innerHTML = data.weather[0].main +'/'+ data.main.temp;
           //cody temp 단계 설정
           var temp = data.main.temp;
			if(temp<=4) {
				temp = 1;
			}else if(temp>4&&temp<=8){
				temp = 2;				
			}else if(temp>8&&temp<=11){
				temp = 3;				
			}else if(temp>11&&temp<=16){
				temp = 4;				
			}else if(temp>16&&temp<=19){
				temp = 5;				
			}else if(temp>19&&temp<=22){
				temp = 6;				
			}else if(temp>22&&temp<=27){
				temp = 7;				
			}else if(temp>28){
				temp = 8;				
			}
           $("#main_codylink").attr("href","/cody/main_cody?temp="+temp);//cody_href
         });
     }
     
     function onGeoError() {
       alert("위치를 찾을 수 없습니다. ");
     }

     navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
     
     const weather = document.querySelector('#weather');
     const submenu = document.querySelector('.submenu');

     function mouseenter(e) {
       submenu.style.visibility = "visible"

     }
     
    function dbmouse(e) {
      submenu.style.visibility = "hidden"
    }

    weather.addEventListener("click",mouseenter)
    weather.addEventListener("dblclick",dbmouse)
</script>
</body>
</html>