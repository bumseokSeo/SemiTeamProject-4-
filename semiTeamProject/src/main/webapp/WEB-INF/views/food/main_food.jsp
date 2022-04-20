<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="url" value="<%=request.getContextPath()%>"/>

<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
        margin-top: 140px;
    }
    #desc{
		box-sizing: border-box;
		position: relative;
		width: 350px;
		height: 150px;
		border-radius: 20px;
		font-size: 20px;
		margin-left: 25px;
		background: rgba(247, 242, 208, 0.5);
		justify-content: center; 
		align-items: center;
		border-left: 1px solid rgba(255, 255, 255, 0.5);
		box-shadow: inset 13px 14px 15px rgba(0,0,0,0.05),
		15px 15px 20px rgba(0,0,0,0.05),
		15px 20px 20px rgba(0,0,0,0.05),
		inset -15px -12px 20px rgba(0,0,0,0.05); 
		letter-spacing: 2px;
		opacity: 0.8;
		color: rgb(41, 41, 39);
		transition : transform 0.5s;
	}
	#desc:hover{
		transform: scale(1.2);
		transition : transform 0.5s;
	}
	#content{
		padding: 20px;
		text-align: center;
		font-weight: 600;
		line-height: 40px;
		
	}
    .weatherIcon{
        width: 200px;
        height: 200px;
        background-color: #b1e6fb;
        border-radius: 50px;
        margin: 0 50px;
    }
    #icon{
		position: absolute;
		top: 25%;
		left:-25%;
		z-index: 10;
	}

	#icon>img{
		width: 200px;
		
	}

	#find{
		position: absolute;
		left: 80%;
		top: -20%;
		
	}

	#find>img{
		width: 130px;
	}
	#icon>img:hover{
		transform: scale(1.2);
		transition : transform 0.5s;
	}
    
	#info{
		margin-top: 35px;
		font-size: 22px;
		line-height: 40px;
	}
	#foods{
		display: flex;
		justify-content: center;
		margin-top: 100px;	
	}
	#foodList{
		text-align: center;
		width: 100%;	
	}
	.foodInfo{
		float: left;
		width: 20%;
		font-size: 20px;	
		transition: all 0.3s ease-out;
		margin-bottom:30px;
	}
	.foodInfo:hover{
		transform: translateY(-20px);
	}
	.foodInfo>div{
		margin-bottom: 5px;	
	}
	.foodName{
		font-weight: 600;
		font-size:20px;
	}
	.foodPhoto{
		width: 200px;
		height: 200px;
		margin: 0 auto;	
	}
	.foodPhoto:hover{
		opacity: 0.85;
	}
	.foodPhoto img{
		width: 100%;
		height: 100%;
		border-radius: 70px;
		opacity: 0.9;
		box-shadow: 3px 3px 3px gray;
		
	}
	.foodPhoto img:hover{
		box-shadow: 5px 5px 5px gray;
	}
	.foodDesc{
		font-size: 18px;
		font-weight : 500;
	}
</style>
<script>
    var weatherData = null;
    var params;
	function onGeoOk(position) {
		
		
		const API_KEY = "34f03c607cbd5ac6878b951a96d17bef";
		const lat = position.coords.latitude;
		const lon = position.coords.longitude;
		const url = "https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&lang=kr&appid="+API_KEY+"&units=metric";
	
		fetch(url)
		.then(response => response.json())
		.then(data => {
			var line = "<div>기온 : <span  id='tempInfo'>"+ data.main.temp + "</span></div><br/>";
                line += "<div>날씨 : <span  id='weatherInfo'>" + data.weather[0].description + "</span></div><br/>";
			var info = document.querySelector("#info");
			info.innerHTML = line;
			var weatherIcon = data.weather[0].icon;
			var weatherIconUrl = "http://openweathermap.org/img/wn/"+weatherIcon+"@2x.png"
			var icon = document.querySelector(".weatherIcon");
			icon.src = weatherIconUrl;
			
			weatherData = $("#weatherInfo").text();
			tempData = $("#tempInfo").text();
		
			console.log(weatherData);
			console.log(tempData);
			
			//음식 데이터 추천 받기 위해 날씨 정보를 넘겨줘야 한다. 
			
			params = "weather=" + weatherData + "&temp=" + tempData;
			
			FoodRecommend();
			
		});
	}
	function FoodRecommend(){
		$.ajax({
			
			url : "/getFoodRecommend",
			data : params,
			type : "get",
			
			success : function(result, status){
		
				var tag = "";
				var $result = $(result);
				
				$result.each(function(idx, vo){
					
					tag +="<li class='foodInfo'>";
					tag += "<div class='foodName'>" + vo.fname + "</div>";
					tag += "<div class='foodPhoto'><a href='/map/main_map?fname=" + 
							vo.fname + "'><img src='/img/foodimg/upload/" + vo.foodimg + "'></a></div>";
					
					tag += "<div class='foodDesc'>" + vo.fcategory + "</div></li>"
					
					$("#foodList").html(tag);
				
				});
				 
			}, 
			error : function(error){
				console.log(error.responseText);
			}
			
		}); 
	}
	function onGeoError() {
		alert('위치를 찾을 수 없습니다. ')
	}
	
	navigator.geolocation.getCurrentPosition(onGeoOk,onGeoError);
	
</script>

	<h1 class="animate__animated animate__swing">오늘 음식 어때?</h1>
	<div id="weather">
		<div id="desc">
			<div id="icon">
				<img src="${url}/img/foodimg/pizza1.png">
			</div>
			<div id="content">
			오늘 음식을 추천해 드려요<br>추천 음식을 클릭해 <br/>
				가까운 음식점을 보세요
			</div>
			<div id="find">
				<img src="${url}/img/foodimg/find1.png" alt="">
			</div>
		</div>
		<img class ="weatherIcon" src="" >
		<div id="info"></div>
		
	</div>

	<div id="foods">
		<ul id="foodList"> 
			
		</ul>	
	</div>

</body>
</html>