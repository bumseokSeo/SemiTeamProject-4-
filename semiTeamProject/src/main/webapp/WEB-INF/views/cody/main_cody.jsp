<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<style>
html, body {
	width: 100%;
	height: 100%;
	margin: 0;
	padding: 0px;
	overflow: hidden;
	font-family: sans-serif;
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
	height: 100%;
	position: relative;
	text-align: center;
	margin: 0 auto;
}

.fullImg {
	width: 70%;
	height: 80%;
	margin-bottom: -89px;
}
/*코디 이미지*/
.codyImg {
	width: 40%;
	height: 70%;
	margin-top: 50px;
}

.img7 {
	width: 80%;
	height: 80%
}

ul, li {
	margin: 0;
	padding: 0;
	list-style: none;
}

/*=========오른쪽하단 페이징표시======= */
.quick {
	position: fixed;
	right: 20px;
	bottom: 1%;
	transform: translateY(-50%);
	z-index: 100;
}

.quick li {
	width: 10px;
	height: 10px;
	margin-bottom: 10px;
	border-radius: 15px;
	border: 1px solid #87909B;
	cursor: pointer;
}

.quick .on {
	background: #4d4d4d;
}
/*=========오른쪽하단 페이징표시 끝======= */

/*========= 왼쪽 fixed 메뉴 시작 ======= */
a {
	color: black;
	text-decoration: none;
}

a:link {
	text-decoration: none;
}

a:visited {
	text-decoration: none;
}

a:hover {
	color: #87909B;
	text-decoration: none;
}

.sidenav {
	position: fixed;
	width: 180px;
	top: 10%;
	left: 0;
	z-index: 100000;
}

.sidenav .main-buttons {
	list-style-type: none;
	margin: 64px 0;
	padding: 0;
	color: #534439;
}

.sidenav .main-buttons li {
	text-transform: uppercase;
	letter-spacing: 2px;
	font-size: 16px;
	font-weight: 600;
}

.sidenav .main-buttons>li {
	padding: 16px 52px;
	-moz-box-sizing: border-box;
	-webkit-box-sizing: border-box;
	box-sizing: border-box;
}

.sidenav .main-buttons>li:hover, 
.sidenav .main-buttons>li:active,
.sidenav .main-buttons>li:focus {
	background-color: #f29544;
	cursor: pointer;
}

.sidenav .main-buttons>li:hover .hidden {
	opacity: 1;
	visibility: visible;
}

.sidenav .main-buttons>li:hover .hidden,
.sidenav .main-buttons>li:active .hidden,
.sidenav .main-buttons>li:focus .hidden {
	width: 140px;
}

.hidden {
	width: 0;
	padding: 64px 0;
	position: absolute;
	top: 210px;
	left: 40px;
	overflow: hidden;
	list-style-type: none;
	-moz-transition: 0.3s;
	-o-transition: 0.3s;
	-webkit-transition: 0.3s;
	transition: 0.3s;
}

/*
.hidden {
  position: absolute;
  opacity: 0;
  visibility: hidden;
  list-style-type: none;
  top: 278px;
  left: 40px;
}
*/

.hidden li {
	padding: 16px 24px;
}

.hidden li:hover, 
.hidden li:active, 
.hidden li:focus {
	background-color: #f29544;
}
/*========= 왼쪽 fixed 메뉴 끝 ======= */
</style>
</head>
<body>
	<nav class="sidenav">
		<ul class="main-buttons">
			<li><a href="${url}/codyListAll">ALL</a></li>
			<li><a href="${url}/codyGenderList?sex=m">MEN</a></li>
			<li><a href="${url}/codyGenderList?sex=f">WOMEN</a></li>
			<li>STYLE
				<ul class="hidden">
					<li><a href="${url}/codyStyleList?style=casual">Casual</a></li>
					<li><a href="${url}/codyStyleList?style=modern">Modern</a></li>
					<li><a href="${url}/codyStyleList?style=office">Office</a></li>
					<li><a href="${url}/codyStyleList?style=street">Street</a></li>
					<li><a href="${url}/codyStyleList?style=walk">Walk</a></li>
					<li><a href="${url}/codyStyleList?style=special">Special</a></li>
				</ul>
			</li>
		</ul>
	</nav>
	<div id="fullpage">
		<div class="quick">
			<ul></ul>
		</div>
		<div class="fullsection full1" pageNum="1">
			<img class="fullImg" src="${url}/img/cody_maingif.gif/" alt="">
		</div>

		<c:forEach var="vo" items="${vo}" varStatus="status" end="4">
			<div class="fullsection full${status.index+2}"
				pageNum="${status.index+2}">
				<img class="codyImg" src="${url}/img/codyimg/codyupload/${vo.cname}"
					alt="">
			</div>
		</c:forEach>

		<div class="fullsection full7" pageNum="7">
			<img class="fullImg" src="${url}/img/thankyou.png/" alt="">
		</div>
	</div>
</body>

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script type="text/javascript"
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
<script>
	$(document).ready(function() {
		fullset();
		quickClick();
	});
	function fullset() {
		var pageindex = $("#fullpage > .fullsection").size(); //fullpage 안에 섹션이(.fullsection) 몇개인지 확인하기
		for (var i = 1; i <= pageindex; i++) {
			$("#fullpage > .quick > ul").append("<li></li>");
		}
		$("#fullpage .quick ul :first-child").addClass("on"); //일단 화면이 로드 되었을때는 퀵버튼에 1번째에 불이 들어오게
		//마우스 휠 이벤트
		$(window).bind(
				"mousewheel",
				function(event) {
					var page = $(".quick ul li.on");
					//alert(page.index()+1);  // 현재 on 되어있는 페이지 번호
					if ($("body").find("#fullpage:animated").length >= 1)
						return false;
					//마우스 휠을 위로
					if (event.originalEvent.wheelDelta >= 0) {
						var before = page.index();
						if (page.index() >= 0)
							page.prev().addClass("on").siblings(".on")
									.removeClass("on"); //퀵버튼옮기기
						var pagelength = 0;
						for (var i = 1; i < before; i++) {
							pagelength += $(".full" + i).height();
						}
						if (page.index() > 0) {
							//첫번째 페이지가 아닐때 (index는 0부터 시작임)
							page = page.index() - 1;
							$("#fullpage").animate({
								top : -pagelength + "px"
							}, 1000, "swing");
						} else {
							alert("첫 번째 페이지입니다.");
						}
					} else {
						// 마우스 휠을 아래로
						var nextPage = parseInt(page.index() + 1); //다음페이지번호
						var lastPageNum = parseInt($(".quick ul li").size()); //마지막 페이지번호
						//현재페이지번호 <= (마지막 페이지 번호 - 1)
						//이럴때 퀵버튼옮기기
						if (page.index() <= $(".quick ul li").size() - 1) {
							page.next().addClass("on").siblings(".on")
									.removeClass("on");
						}

						if (nextPage < lastPageNum) {
							//마지막 페이지가 아닐때만 animate !
							var pagelength = 0;
							for (var i = 1; i < nextPage + 1; i++) {
								//총 페이지 길이 구하기
								//ex) 현재 1번페이지에서 2번페이지로 내려갈때는 1번페이지 길이 + 2번페이지 길이가 더해짐
								pagelength += $(".full" + i).height();
							}
							$("#fullpage").animate({
								top : -pagelength + "px"
							}, 1000, "swing");
						} else {
							// 현재 마지막 페이지 일때는
							alert("마지막 페이지입니다.");
						}
					}
				});
		$(window).resize(function() {
			//페이지가 100%이기때문에 브라우저가 resize 될때마다 스크롤 위치가 그대로 남아있는것을 방지하기 위해
			var resizeindex = $(".quick ul li.on").index() + 1;

			var pagelength = 0;
			for (var i = 1; i < resizeindex; i++) {
				//총 페이지 길이 구하기
				//ex) 현재 1번페이지에서 2번페이지로 내려갈때는 1번페이지 길이 + 2번페이지 길이가 더해짐
				pagelength += $(".full" + i).height();
			}

			$("#fullpage").animate({
				top : -pagelength + "px"
			}, 0);
		});
	}
	// 사이드 퀵버튼 클릭 이동
	function quickClick() {
		$(".quick li").click(function() {
			var gnbindex = $(this).index() + 1;
			var length = 0;
			for (var i = 1; i < gnbindex; i++) {
				length += $(".full" + i).height();
			}
			if ($("body").find("#fullpage:animated").length >= 1)
				return false;
			$(this).addClass("on").siblings("li").removeClass("on");

			$("#fullpage").animate({
				top : -length + "px"
			}, 800, "swing");
			return false;
		});
	}
</script>
</html>
