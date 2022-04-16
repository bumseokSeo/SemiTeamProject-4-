<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<style>
@font-face {
	font-family: 'Cafe24Simplehae';
	src:
		url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Simplehae.woff')
		format('woff');
	font-weight: normal;
	font-style: normal;
}

*, *:before, *:after {
	box-sizing: border-box;
}

@keyframes blink-effect { 50% {
	opacity: 0;
}

}
html, body {
	width: 100%;
	height: 100%;
	margin: 0px;
	padding: 0px;
	overflow-y: hidden;
	font-family: 'Cafe24Simplehae';
}

#fullpage {
	position: relative;
	top: 0px;
	z-index: 9;
	width: 100%;
	height: 100%;
}

.fullsection {
	width: 100%;
	height: 105%;
	position: relative;
}

ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

h1 {
	color: rgb(74, 74, 74);
	position: relative;
	position: absolute;
	left: 50%;
	top: 12%;
	transform: translateX(-50%);
	white-space: nowrap;
	text-shadow: 0 0 10px #FFFFFF;
	font-family: 'Cafe24Simplehae';
	font-weight: bolder;
}

h1:after {
	content: "";
	position: absolute;
	width: 0;
	height: 4px;
	left: 0;
	bottom: -8px;
	background: rgb(74, 74, 74);
	transition: 800ms all ease-in-out;
}

.container {
	margin: 0 auto;
	padding: 0;
	max-width: 100%;
	max-height: 100%;
	width: 100%;
	height: 100%;
	position: relative;
}

.container .one-half {
	position: absolute;
	width: 50%;
	height: 100%;
	overflow: hidden;
}

.container .one-half.left {
	left: 0;
	background: url(img/maincody.jpg) center center no-repeat;
	background-size: cover;
}

.container .one-half.left:before {
	content: "";
	width: 100%;
	height: 100%;
	background: rgba(157, 157, 157, 0.5);
	position: absolute;
}

.container .one-half.right {
	right: 0;
	background: url(img/mainfood.jpg) center center no-repeat;
	background-size: cover;
}

.container .one-half.right:before {
	content: "";
	width: 100%;
	height: 100%;
	background: rgba(157, 157, 157, 0.5);
	position: absolute;
}

.container .one-half.left, .container .one-half.right {
	transition: 1800ms all ease-in-out;
}

.container .one-half.left:before, .container .one-half.right:before {
	transition: 1800ms all ease-in-out;
}

.container.left-is-hovered .left {
	width: 85%;
}

.container.left-is-hovered .left h1:after {
	margin-top: -50px;
	width: 100%;
}

.container.left-is-hovered .right {
	width: 15%;
}

.container.left-is-hovered .right:before {
	background: rgba(0, 0, 0, 0.65);
	z-index: 2;
}

.container.right-is-hovered .right {
	width: 85%;
}

.container.right-is-hovered .right h1:after {
	width: 100%;
}

.container.right-is-hovered .left {
	width: 15%;
}

.container.right-is-hovered .left:before {
	background: rgba(0, 0, 0, 0.65);
	z-index: 2;
}

#weather {
	position: fixed;
	text-align: center;
	width: 400px;
	height: 400px; top : 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	top: 50%; left : 50%; transform : translate( -50%, -50%);
	font-weight: 500;
}

#weather span:first-child {
	animation: blink-effect 1s step-end infinite;
}

#weather span:nth-child(2n) {
	display: block;
	font-size: 58px;
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
	text-decoration: none;
	color: #FFFAE8;
	transform: scale(1.18) rotate(-5deg);
}

.submenu {
	display: flex;
	justify-content: space-around;
	visibility: hidden;
	align-items: center;
}

.submenu a {
	text-align: center;
	font-size: 28px;
	color: #333333;
	transition: all 400ms ease-in;
}

#scrollimg {
	width: 70px;
	height: 70px;
	position: relative;
	bottom: -68%;
	left: 48%;
}

#section0 span {
  position: absolute;
  bottom: 32%;
  left: 50%;
  width: 30px;
  height: 30px;
  margin-left: -12px;
  border-left: 4px solid black;
  border-bottom: 4px solid black;
  -webkit-transform: rotate(-45deg);
  transform: rotate(-45deg);
  -webkit-animation: sdb05 1.5s infinite;
  animation: sdb05 1.5s infinite;
}

#section0 p {
  position: absolute;
  bottom: 20%;
  left: 50%;
  font-size: 24px;
  margin-left: -12px;
  transform: translate(-48px, -30px);

}


@-webkit-keyframes sdb05 {
  0% {
    -webkit-transform: rotate(-45deg) translate(0, 0);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    -webkit-transform: rotate(-45deg) translate(-20px, 20px);
    opacity: 0;
  }
}

@keyframes sdb05 {
  0% {
    transform: rotate(-45deg) translate(0, 0);
    opacity: 0;
  }
  50% {
    opacity: 1;
  }
  100% {
    transform: rotate(-45deg) translate(-20px, 20px);
    opacity: 0;
  }
}

</style>

<div class="submenu">

	<a href="${url}/map/map.jsp">지도확인</a> <a href="/map/main_map">지도</a>

	<c:if test="${logId!='master'}">
		<a id="main_codylink" href="${url}/cody/main_cody">코디추천</a>
	</c:if>
	<c:if test="${logId=='master'}">
		<a href="${url}/master/master_modify_cody">코디관리</a>
	</c:if>

	<c:if test="${logId != 'master' }">
		<a href="${url}/food/main_food">음식추천</a>
	</c:if>
	<c:if test="${logId == 'master' }">
		<a href="${url}/master/master_food">음식관리</a>
	</c:if>

</div>
<div class="container">
	<div id="fullpage">
		<div class="quick">
			<ul></ul>
		</div>
		<div class="fullsection full1" pageNum="1">
			<div id="weather" class="rotate-center"
				onmouseenter="return mouseenter" ondblclick="dbmouse()">
				<span>Click Me ↓</span> <span></span> <span></span>
			</div>
			<section id="section0" class="demo">
			  <span></span>
			  <p>Scroll Down</p>
			</section>
		</div>

		<div class="fullsection full2" pageNum="2">
			<div class="container">
				<div class="one-half left">
					<a href="#"><h1>오늘 코디 어때?</h1></a>

				</div>
				<div class="one-half right">
					<h1>오늘 음식 어때?</h1>

				</div>
			</div>

		</div>
	</div>
</div>


<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script>


function onGeoOk(position) {
 const API_KEY = "34f03c607cbd5ac6878b951a96d17bef";
  const lat = position.coords.latitude;
  const lon = position.coords.longitude;
  
  const url = "https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&lang=kr&appid="+API_KEY+"&units=metric";
  fetch(url)
    .then((response) => response.json())
    .then((data) => {
      const weather = document.querySelector("#weather span:nth-child(2n)");
      const city = document.querySelector("#weather span:last-child");
      //city.innerText = data.name;
      weather.innerHTML = data.weather[0].description +'/'+ data.main.temp;
      
      // 날씨에 따른 배경화면 변경
         let weatherinfo = data.weather[0].main;

      if (weatherinfo == "Rain") {
           document.body.style.background = "url(${url}/img/raining.png) no-repeat center center fixed",
           document.body.style.backgroundSize = "cover";
           document.body.style.color = "#ffffff";
      } else if (weatherinfo == "Clouds") {
           document.body.style.background = "url(${url}/img/구름.gif) no-repeat center center fixed",
           document.body.style.backgroundSize = "cover";
           document.body.style.color = "#4d4d4d";
      } else if (weatherinfo == "Clear") {
             document.body.style.background = "url(${url}/img/blueblue.gif) no-repeat center center fixed";
            document.body.style.backgroundSize = "cover";
            document.body.style.color = "#4d4d4d";
      } else {
           document.body.style.background = "url(${url}/img/bluesky.png) no-repeat center center fixed",
           document.body.style.backgroundSize = "cover";
           document.body.style.color = "#4d4d4d";
      }
      
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
weather.addEventListener("dbclick",dbmouse)


  // ============================================== 스크롤 이벤트 ==================================================
     
  $(document).ready(function () {
    fullset();
    quickClick();
  });
  
  function fullset() {
    var pageindex = $("#fullpage > .fullsection").size(); 
    for (var i = 1; i <= pageindex; i++) {
      $("#fullpage > .quick > ul").append("<li></li>");
    }
    $("#fullpage .quick ul :first-child").addClass("on");

    $(window).bind("mousewheel", function (event) {
      var page = $(".quick ul li.on");
      if ($("body").find("#fullpage:animated").length >= 1) return false;
      //마우스 휠을 위로
      if (event.originalEvent.wheelDelta >= 0) {
        var before = page.index();
        if (page.index() >= 0)
          page.prev().addClass("on").siblings(".on").removeClass("on");
        var pagelength = 0;
        for (var i = 1; i < before; i++) {
          pagelength += $(".full" + i).height();
        }
        if (page.index() > 0) {
          page = page.index() - 1;
          $("#fullpage").animate({ top: -pagelength + "px" }, 1000, "swing");
        }
      } else {
        var nextPage = parseInt(page.index() + 1); //다음페이지번호
        var lastPageNum = parseInt($(".quick ul li").size()); //마지막 페이지번호

        if (page.index() <= $(".quick ul li").size() - 1) {
          page.next().addClass("on").siblings(".on").removeClass("on");
        }

        if (nextPage < lastPageNum) {
          //마지막 페이지가 아닐때만 animate !
          var pagelength = 170;
          for (var i = 1; i < nextPage + 1; i++) {
            //총 페이지 길이 구하기
            //ex) 현재 1번페이지에서 2번페이지로 내려갈때는 1번페이지 길이 + 2번페이지 길이가 더해짐
            pagelength += $(".full" + i).height();
          }
          $("#fullpage").animate({ top: -pagelength + "px" }, 1000, "swing");
        }
      }
    });
    
    $(window).resize(function () {
      var resizeindex = $(".quick ul li.on").index() + 1;

      var pagelength = 0;
      for (var i = 1; i < resizeindex; i++) {
        //총 페이지 길이 구하기
        pagelength += $(".full" + i).height();
      }

      $("#fullpage").animate({ top: -pagelength + "px" }, 0);
    });
  }
  
  
  // 사이드 퀵버튼 클릭 이동
  function quickClick() {
    $(".quick li").click(function () {
      var gnbindex = $(this).index() + 1;
      var length = 0;
      for (var i = 1; i < gnbindex; i++) {
        length += $(".full" + i).height();
      }
      if ($("body").find("#fullpage:animated").length >= 1) return false;
      $(this).addClass("on").siblings("li").removeClass("on");

      $("#fullpage").animate({ top: -length + "px" }, 800, "swing");
      return false;
    });
  }
  // ============================================== 스크롤 이벤트 끝 ==================================================

  // =============================================두번째 화면 마우스 이벤트 =================================================

  var $l = $(".left");
  var $r = $(".right");


  $l.mouseenter(function () {
    $(".container").addClass("left-is-hovered");
  }).mouseleave(function () {
    $(".container").removeClass("left-is-hovered");
    
  });

  $r.mouseenter(function () {
    $(".container").addClass("right-is-hovered");
  }).mouseleave(function () {
    $(".container").removeClass("right-is-hovered");
    
  });
 

  // =============================================두번째 화면 마우스 이벤트 =================================================


</script>
</body>
</html>