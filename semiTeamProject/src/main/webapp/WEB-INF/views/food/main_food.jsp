<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="url" value="<%=request.getContextPath()%>"/>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<script>

	
    var weatherData = null;
	function onGeoOk(position) {
		
		
		const API_KEY = "34f03c607cbd5ac6878b951a96d17bef";

		const lat = position.coords.latitude;
		const lon = position.coords.longitude;
		const url = "https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&lang=kr&appid="+API_KEY+"&units=metric";
	
		fetch(url)
		.then(response => response.json())
		.then(data => {

			var line = "<div>기온 : "+ data.main.temp + "</div><br/>";
                line += "<div>날씨 : <span  id='weatherInfo'>" + data.weather[0].description + "</span></div><br/>";
				line += "<input type='button' id='b'/>"
			var info = document.querySelector("#info");

			info.innerHTML = line;

			var weatherIcon = data.weather[0].icon;
			var weatherIconUrl = "http://openweathermap.org/img/wn/"+weatherIcon+"@2x.png"

			var icon = document.querySelector(".weatherIcon");
			icon.src = weatherIconUrl;
			
			weatherData = $("#weatherInfo").text();
			$('#b').val(weatherData);
			alert(weatherData);
			
			$.ajax({
				
				url : "/getFoodRecommend",
				data : "weather=" + weatherData,
				method : "post",
				
				success : function(result){
					
				},
				error : function(error){
					console.log(error.responseText);
				}
				
				
				
			}); 
			
		
		});
	}
	
	function onGeoError() {
		alert('위치를 찾을 수 없습니다. ')
	}
	

	navigator.geolocation.getCurrentPosition(onGeoOk,onGeoError);
	
	//음식 데이터 추천 받기 위해 날씨 정보를 넘겨줘야 한다. 
	$(document).ready(function(){
		
		
		
		
		/* 
		if(weatherData==null){
			return;
		}
		
		$.ajax({
			
			url : "/getFoodRecommend",
			data : "weather=" + weatherData,
			method : "post",
			
			success : function(result){
				
			},
			error : function(error){
				console.log(error.responseText);
			}
			
			
			
		});  */
		
		
		
	});
	 
	$(function(){
	
		$('#b').click(function(){
			alert('in');
			
		})	
	})

    

</script>

<style>

	
	
	ul, li{
		list-style-type: none;
		margin: 0;
		padding: 0;
	}
	body{
		
		background: url(${url}/img/foodBackground.png);
		background-size: cover;
		
	}
	
    #weather{
        display: flex;
        justify-content: center;
        margin-top: 200px;
    }
    .weatherIcon{
        width: 200px;
        height: 200px;
        background-color: rgb(218, 217, 217);
        border-radius: 10px;
        margin: 0 50px;
		opacity: 0.5;
    }
	#info{
		margin-top: 20px;
		font-size: 20px;
		line-height: 40px;
		font-family: 'NanumSquare',san-serif;
	}
	#foods{
		display: flex;
		justify-content: center;
		margin-top: 150px;	
	}
	#foodList{
		text-align: center;
		width: 100%;	
	}
	.foodInfo{
		float: left;
		width: 20%;
		font-size: 20px;	
	}
	.foodInfo>div{
		margin-bottom: 5px;	
		font-family: 'NanumSquare',san-serif;
	}
	.foodPhoto{
		width: 200px;
		height: 200px;
		margin: 0 auto;	
	}
	.foodPhoto:hover{
		opacity: 0.7;
	}
	.foodPhoto img{
		width: 100%;
		height: 100%;
		border-radius: 60px;
	}
	.foodDesc{
		font-size: 17px;
	}
</style>

	<h1 class="animate__animated animate__swing">오늘 음식 어때?</h1>
	<div id="weather">
		<img class ="weatherIcon" src="" >
		<div id="info"></div>
		
	</div>

	<div id="foods">
		<ul id="foodList"> 
			<li class="foodInfo">
				<div>김치찌개</div>
				<div class="foodPhoto"><img src="${url}/img/foodimg/김치찌개.jpg" alt=""></div>
				<div class="foodDesc">한식</div>
			</li>
			<li class="foodInfo">
				<div>짜장면</div>
				<div class="foodPhoto"><img src="${url}/img/foodimg/짜장면.jpg" alt=""></div>
				<div class="foodDesc">중식</div>
			</li>
			<li class="foodInfo">
				<div>감자탕</div>
				<div class="foodPhoto"><img src="${url}/img/foodimg/감자탕.jpg" alt=""></div>
				<div class="foodDesc">한식</div>
			</li>
			<li class="foodInfo">
				<div>떡볶이</div>
				<div class="foodPhoto"><img src="${url}/img/foodimg/떡볶이.jpg" alt=""></div>
				<div class="foodDesc">분식</div>
			</li>
			<li class="foodInfo">
				<div>파스타</div>
				<div class="foodPhoto"><img src="${url}/img/foodimg/파스타.jpg" alt=""></div>
				<div class="foodDesc">양식</div>
			</li>
			
		</ul>	
	</div>

</body>
</html>