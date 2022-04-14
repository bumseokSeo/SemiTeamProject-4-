<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<script>
$(function(){
	// 이미지 클릭시 이미지 모달
		$(".Cimg").click(function(){
			$(".modal").show();
			// 이미지 가져오기
			var imgSrc = $(this).attr("src");
			var imgAlt = $(this).attr("alt");
			$(".modalBox img").attr("src", imgSrc);
			$(".modalBox img").attr("alt", imgAlt);
			
			// 이미지 텍스트 가져오기
			var imgTit =  $(this).next("p").text();
			//$(".modalBox p").text(imgTit);
			
			var imgStyle = $(this).next().next().val();
			$(".modalBox p").text(imgStyle);
			
	   // 이미지에 alt값을 가져와 제목으로
			//$(".modalBox p").text(imgAlt);
		});
		
		//.modal안에 button을 클릭하면 .modal닫기
		$(".modal button").click(function(){
			$(".modal").hide();
		});
		
		//.modal밖에 클릭시 닫힘
		$(".modal").click(function (e) {
	    if (e.target.className != "modal") {
	      return false;
	    } else {
	      $(".modal").hide();
	    }
	});
		
	$(document).ready(function(){
		//heart 정보 가져오기
		$.ajax({
			url: "/heartSelect",
			type:"get",
			success: function(result){
				var idx = "";
				var num = "";
				$(result).each(function(){
					idx = this.cname.indexOf(".");
					num = this.cname.substring(1,idx);
					$("#eheart"+num).css("display", "none");
					$("#fheart"+num).css("display", "block");
				});
			},
			error: function(e){
				console.log(e.responseText);
			}
		});
	});
	
});


	//arrow updown
	$(function() {
	    $(window).scroll(function() {
	        if ($(this).scrollTop() > 600) {
	            $('.ScrollButton').fadeIn();
	        } else {
	            $('.ScrollButton').fadeOut();
	        }
	    });
	        
	    $("#TopButton").click(function() {
	        $('html').animate({scrollTop : 0}, 600);
	    });
	 
	    $("#BottomButton").click(function() {
	        $('html, body').animate({scrollTop : ($(document).height())}, 600);
	    });
	});
	
function heartInsert(cname){//emptyheart 클릭
	var idx = cname.substring(1, cname.indexOf('.'));
	
	$.ajax({
		url: "/heartInsert",
		data: "cname="+cname,
		type: "post",
		success: function(result){
			if(result>0){
				$("#eheart"+idx).css("display","none");
				$("#fheart"+idx).css("display", "block");
			}
		},
		error : function(e){
			console.log(e.responseText);
		}		
	});
}

function heartDelete(cname){	//fullheart 클릭
	var idx = cname.substring(1, cname.indexOf('.'));
	$.ajax({
		url: "/heartDelete",
		data: "cname="+cname,
		type: "post",
		success: function(result){
			if(result>0){
				$("#eheart"+idx).css("display","block");
				$("#fheart"+idx).css("display", "none");
			}
		},
		error : function(e){
			console.log(e.responseText);
		}		
	});
}

</script>
<style>
@font-face {
  font-family: "ROKAFSansBold";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts2201-3@1.0/ROKAFSansBold.woff")
  format("woff");
  font-weight: normal;
  font-style: normal;
}

html,
body {
  background-image: linear-gradient(to top, #d5d4d0 0%, #d5d4d0 1%, #eeeeec 31%, #efeeec 75%, #e9e9e7 100%);
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  max-height: 100%;
  max-width: 100%;
  background-repeat: no-repeat;
  background-attachment: fixed;
  background-position: center top;
  
}

.main-container {
  width: 1300px;
  height: 100%;
  margin-top: 100px;
  margin:0 auto;
  position: relative;
}

.cody-sub {
  float: left;
  width: 28%;
  height: 100%;
  margin-top: 50px;
}




/* ======================오른쪽 imgList 모달창 시작==================== */

section {
  float: right;
  width: 70%;
  height: 100%;
}


.imgC>img {
  width: 250px;
  height: 250px;
  
}

.imgC>img:hover {
  cursor: zoom-in;
}

.imgList-row {
  display: flex;
  justify-content: space-around;
  margin-top: 60px;
}

.imgC p {
  text-align: center;
  color:gray;
}

.modal {
  display: none;
	z-index: 1000;
	width: 100%;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.7);
  
}

.modal button {
  position: absolute;
	top: 3rem;
	right: 3rem;
	background: transparent;
	border: 0;
	color: #ffffff;
	font-size: 3rem;
  cursor: pointer;
}

.modalBox {
  position: relative;
	top: 20%;
	left: 50%;
	transform: translate(-50%, -20%);
	background-color: #ffffff;
	width: 30%;
	height: 30%;
	text-align: center;

}

.modalBox img {
  width: 100%;
  
}

.modalBox p {
	color: #ffffff;
	background-color: #000;
	font-size: 18px;
	padding: 10px;
}

/* ======================오른쪽 imgList 모달창 끝==================== */


/* ===============왼쪽 버튼 CSS ===============*/

.cody-sub-container {
  height: 170px;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}

#workarea {
  position: absolute;
  width: 100%;
  height: 100%;
  background-color: #1e1a3e;
}

#personal {
  color: black;
  text-decoration:none;
  position:absolute;
  bottom:15px;
  right:2%;
}

.spot {
  position: absolute;
  width: 100%;
  height: 100%;
  top: 0;
  left: 0;
}

.svg-wrapper {
  margin-top: 0;
  position: relative;
  width: 150px;
  height: 40px;
  display: inline-block;
  border-radius: 3px;
  margin-left: 5px;
  margin-right: 5px;
}

#shape {
  stroke-width: 6px;
  fill: transparent;
  stroke: black;
  stroke-dasharray: 85 400;
  stroke-dashoffset: -220;
  transition: 1s all ease;
}

#text {
  font-family: "ROKAFSansBold";
  margin-top: -35px;
  text-align: center;
}

#text a {
  color: #9c9c9c;
  text-decoration: none;
  font-weight: 100;
  font-size: 1.1em;
}


.svg-wrapper:hover #shape {
  stroke-dasharray: 50 0;
  stroke-width: 3px;
  stroke-dashoffset: 0;
  stroke: coral;
}
/*================왼쪽 버튼 CSS 끝============== */


/* ===============왼쪽 리스트 시작================= */

.cody-sub-style-list {
  margin-top:10px;
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  opacity: 1;
  transition: all 500ms ease-out;
}

.cody-sub-style-list.anim-out {
  opacity: 0;
  transform: scale(0.9) translateY(40px);
}


.list {
  position: relative;
  display: flex;
  justify-content: center;
  align-items: center;
  width: 150px;
  height: 150px;
  margin: 7px;
  background-color: white;
  border-radius: 3px;
  
}

.list-img {
  width: 100px;
  height: 100px;
}

.list.invisible{
  display: none;
}

.list-description {
  position: absolute;
  top: 0;
  left: 0;
  background-color: #000000;
  width: 100%;
  height: 100%;
  display: flex;
  flex-direction: column;
  justify-content: center;
  opacity: 0;
  transform: translate(10px);
  transition: all 500ms ease-in;
}

.list:hover .list-description {
  opacity: 0.8;
  transform: translate(0px);
  border-radius: 5px;
}

.list-description h3{
  font-size:22px;
  color: bisque;
  text-align: center;
}

.list-description span {
  color: gray;
  text-align: center;
  font-size: 14px;
}

.list-description h3:after {
  display: block;
  position: relative;
  left: 50%;
  content: '';
  width:25px;
  height: 2px;
  margin-left: -12px;
  margin-top: 8px;
  background-color: #9c9c9c;
}

/* ===============왼쪽 리스트 끝================= */


/* ===============arrow updown 시작================= */

.ScrollButton {
  position: fixed;   
  right: 10px;       
  cursor: pointer;   
  z-index: 10;  
  font-size: 20px;
  color: black;     
  display: none;
  right: 24px;
}

#TopButton {

  bottom: 75px;        
}
#BottomButton {

  bottom: 50px;
}
.emptyheart{
	margin-top:3px;
	width:24px !important;
	height:25px !important;
	float:right !important;
}
.fullheart{
	display:none;
	margin-top:3px;
	width:22px !important;
	height:22px !important;
	float:right !important;
}
/* ===============arrow updown 끝================= */


</style>    
	<div class="main-container">
    <h1 class="animate__animated animate__swing">Cody List</h1>
		<div class="cody-sub">
			<div class="cody-sub-container">
				<!--start button -->
				<div class="svg-wrapper">
					<svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
						<rect id="shape" height="40" width="150" />
						<div id="text">
							<a href="${url}/codyListAll"><span class="spot"></span>ALL</a>
						</div>
					</svg>
				</div>
				<!--Next button -->
				<div class="svg-wrapper">
					<svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
						<rect id="shape" height="40" width="150" />
						<div id="text">
							<a href="${url}/codyGenderList?sex=m"><span class="spot"></span>MEN</a>
						</div>
					</svg>
				</div>
				<!--Next button -->
				<div class="svg-wrapper">
					<svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
						<rect id="shape" height="40" width="150" />
						<div id="text">
							<a href="${url}/codyGenderList?sex=f"><span class="spot"></span>WOMEN</a>
						</div>
					</svg>
				</div>
				<!--Next button -->
				<div class="svg-wrapper">
					<svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
						<rect id="shape" height="40" width="150" />
						<div id="text">
							<a href="${url}/codyHeartList"><span class="spot"></span>MY PICK</a>
						</div>
					</svg>
				</div>
			</div>

	
				<div class="cody-sub-style-list">
					<a href="${url}/codyStyleList?style=casual" class="list" target="blank">
						<img src="${url}/img/codyimg/casualimg.jpg"  alt="" class="list-img" >
						<div class="list-description">
							<h3>Casual</h3>
							<span>캐주얼룩</span>
						</div>
					</a>
					<a href="${url}/codyStyleList?style=modern" class="list" target="blank">
						<img src="${url}/img/codyimg/modernimg.jpg" alt="" class="list-img">
						<div class="list-description">
							<h3>Modern</h3>
							<span>모던룩</span>
						</div>
					</a>
					<a href="${url}/codyStyleList?style=office" class="list" target="blank">
						<img src="${url}/img/codyimg/officeimg.jpg" alt="" class="list-img">
						<div class="list-description">
							<h3>Office</h3>
							<span>오피스룩</span>
						</div>
					</a>
					<a href="${url}/codyStyleList?style=street" class="list" target="blank">
						<img src="${url}/img/codyimg/streetimg.jpg" alt="" class="list-img">
						<div class="list-description">
							<h3>Street</h3>
							<span>스트릿룩</span>
						</div>
					</a>
					<a href="${url}/codyStyleList?style=walk" class="list" target="blank">
						<img src="${url}/img/codyimg/walkimg.jpg" alt="" class="list-img">
						<div class="list-description">
							<h3>Walk</h3>
							<span>산책룩</span>
						</div>
					</a>
					<a href="${url}/codyStyleList?style=special" class="list" target="blank">
						<img src="${url}/img/codyimg/specialimg.jpg" alt="" class="list-img">
						<div class="list-description">
							<h3>Special</h3>
							<span>스페셜룩<br/>(파티 or 바캉스)</span>
						</div>
					</a>
				</div>
		</div>

  <section>
  	<div class="imgList">
  		<c:if test="${vo!=null}">
	  		<c:forEach var="i" begin="1" end="${len}">
		  		<div class="imgList-row">
			  		<c:forEach var="j" begin="${3*i-3}" end="${3*i-1}">
						<div class="imgC">
							<c:if test="${vo[j]!=null}">
					    		<img src="${url}/img/codyimg/codyupload/${vo[j].cname}" alt="모달할 이미지" class="Cimg">
					    		<p>${vo[j].info}
					    		<c:set var="idx" value="${fn:indexOf(vo[j].cname,'.')}"/>
								<a href="javascript:heartInsert('${vo[j].cname}');"><img src="${url}/img/codyimg/heart1.png" class="emptyheart" id="eheart${fn:substring(vo[j].cname,1,idx)}"/></a>
								<a href="javascript:heartDelete('${vo[j].cname}');"><img src="${url}/img/codyimg/heart2.png" class="fullheart" id="fheart${fn:substring(vo[j].cname,1,idx)}"/></a>
					    		</p>
					    		<input type="hidden" id = ".styleVal" value="${vo[j].style}"/>
					    	</c:if>
					    	<c:if test="${vo[j]==null}">	<!-- 자리 채울 이미지 -->
					    		<img src="${url}/img/codyimg/none.png">
				    		</c:if>
				    	</div>
			    	</c:forEach>
			  	</div>
	  		</c:forEach>
  		</c:if>
  		<c:if test="${hVO!=null}">
  		  	<c:forEach var="i" begin="1" end="${hlen}">
		  		<div class="imgList-row">
			  		<c:forEach var="j" begin="${3*i-3}" end="${3*i-1}">
						<div class="imgC">
							<c:if test="${hVO[j]!=null}">
					    		<img src="${url}/img/codyimg/codyupload/${hVO[j].cname}" alt="모달할 이미지" class="Cimg">
					    		<p>
					    		<c:set var="idx" value="${fn:indexOf(hVO[j].cname,'.')}"/>
								<a href="javascript:heartInsert('${hVO[j].cname}');"><img src="${url}/img/codyimg/heart1.png" class="emptyheart" id="eheart${fn:substring(hVO[j].cname,1,idx)}"/></a>
								<a href="javascript:heartDelete('${hVO[j].cname}');"><img src="${url}/img/codyimg/heart2.png" class="fullheart" id="fheart${fn:substring(hVO[j].cname,1,idx)}"/></a>
					    		</p>
					    	</c:if>
					    	<c:if test="${hVO[j]==null}">	<!-- 자리 채울 이미지 -->
					    		<img src="${url}/img/codyimg/none.png">
				    		</c:if>
				    	</div>
			    	</c:forEach>
			  	</div>
	  		</c:forEach>
  		</c:if>
  	</div>
  </section>
	
	<!-- 팝업 될 곳 -->
	<div class="modal">
		<button>&times;</button>
		<div class="modalBox">
			<img src="" alt="">
			<c:if test="${hVO==null}">
				<p></p>
			</c:if>
		</div>
	</div>
	
</div>

<!-- arrow updown -->
<a id="TopButton" class="ScrollButton">
	<i class="fa-solid fa-arrow-up"></i>
</a>
<a id="BottomButton" class="ScrollButton">
	<i class="fa-solid fa-arrow-down"></i>
</a>
</body>
</html>

