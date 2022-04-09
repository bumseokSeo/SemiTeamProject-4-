<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>  
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<script>

window.addEventListener("wheel",function (e) {
    e.preventDefault();
  },{ passive: false 
  });

var $html = $("html");
var page = 1;
var lastPage = $(".content").length;

$html.animate({ scrollTop: 0 }, 10);

$(window).on("wheel", function (e) {
  if ($html.is(":animated"))
   return;

  if (e.originalEvent.deltaY > 0) {
    if (page == lastPage) 
    return;
    page++;
  } else if (e.originalEvent.deltaY < 0) {
    if (page == 1) return;
    page--;
  }
  var posTop = (page - 1) * $(window).height();
  $html.animate({ scrollTop: posTop });
});
</script>
    
>>>>>>> 7a18e8e (장현주 : 코디메인페이지 수정)
<style>
 @font-face {
  font-family: "ROKAFSansBold";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts2201-3@1.0/ROKAFSansBold.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}
.title {
  margin-bottom:20px;
  text-align: center;
  font-family: "ROKAFSansBold";
  font-size: 40px;
  text-shadow: #9c9c9c 4px 4px 0px, 2px 2px 2px rgba(206, 89, 55, 0);
}
* {
  box-sizing: border-box;
}

html{overflow: hidden;}
 
html, body{width: 100%; height: 100%;}
 
.content{
	width: 100%; height: 100%;
	
	
	position: relative;
}
/*
.content > h1{
	position: absolute;
	top: 50%; left: 50%;
	transform: translate(-50%,-50%);
 
	font-size: 20em;
	font-weight: bold;
	text-shadow: 4px 4px 4px rgba(0, 0, 0, 0.6);
 
}
*/

.content .img1 {
  width: 1130px;
  height: 600px;
  
}

.content .img6 {
  width: 1130px;
  height: 600px;
  transform: translate( 0%,-10%);
}


.content .img7 {
  width: 1130px;
  height: 600px;
  transform: translate( 0%,-10%);
}



.animate__animated.animate__swing {
  --animate-duration: 1.2s;
}
</style>    
    <h1 class=" title animate__animated animate__swing">오늘 코디 어때?</h1>
   
<<<<<<< HEAD
    <div class="main-container">

      <div class="cody-main">
        <div class="cody-main-img">
        	<!-- temp 단계에 해당하는 코디 이미지 가져오기
            <c:forEach var="vo" items="${vo}">
				<img src="${url}/img/codyimg/codyupload/${vo.cname}"/>
			</c:forEach>
			 -->
        </div>
        <div class="cody-main-text">
      
        </div>
      </div>


      <div class="cody-sub">

        <div class="cody-sub-container">
          <!--start button -->
          <div class="svg-wrapper">
            <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
              <rect id="shape" height="40" width="150" />
              <div id="text">
                <a href="${url}/cody/sub_cody"><span class="spot"></span>ALL</a>
              </div>
            </svg>
          </div>
          <!--Next button -->
          <div class="svg-wrapper">
            <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
              <rect id="shape" height="40" width="150" />
              <div id="text">
                <a href="${url}/cody/sub_cody"><span class="spot"></span>MEN</a>
              </div>
            </svg>
          </div>
          <!--Next button -->
          <div class="svg-wrapper">
            <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
              <rect id="shape" height="40" width="150" />
              <div id="text">
                <a href="${url}/cody/sub_cody"><span class="spot"></span>WOMEN</a>
              </div>
            </svg>
          </div>
        </div>
        <div>
            <div class="cody-sub-style-list">
              <a href="${url}/cody/sub_cody" class="list" target="blank">
                <img src="${url}/img/codyimg/cody01.jpg" alt="" class="list-img" >
                <div class="list-description">
                  <h3>오피스룩</h3>
                  <span>오피스룩 설명</span>
                </div>
              </a>
              <a href="${url}/cody/sub_cody" class="list" target="blank">
                <img src="${url}/img/codyimg/cody2.jpg"  alt="" class="list-img">
                <div class="list-description">
                  <h3>오피스룩</h3>
                  <span>오피스룩 설명</span>
                </div>
              </a>
              <a href="${url}/cody/sub_cody" class="list" target="blank">
                <img src="${url}/img/codyimg/cody03.jpg"  class="list-img">
                <div class="list-description">
                  <h3>오피스룩</h3>
                  <span>오피스룩 설명</span>
                </div>
              </a>
              <a href="${url}/cody/sub_cody" class="list" target="blank">
                <img src="${url}/img/codyimg/cody04.jpg"  class="list-img">
                <div class="list-description">
                  <h3>오피스룩</h3>
                  <span>오피스룩 설명</span>
                </div>
              </a>
              <a href="#" class="list" target="blank">
                <img src="${url}/img/codyimg/cody04.jpg"  class="list-img">
                <div class="list-description">
                  <h3>오피스룩</h3>
                  <span>오피스룩 설명</span>
                </div>
              </a>
               <a href="#" class="list" target="blank">
                <img src="${url}/img/codyimg/cody04.jpg"  class="list-img">
                <div class="list-description">
                  <h3>오피스룩</h3>
                  <span>오피스룩 설명</span>
                </div>
              </a>
            </div>
        </div>
      </div>
    </div>
=======
    <!--  날씨, 성별 데이터에 따른 코디 가져오기 테스트
    <c:forEach var="vo" items="${vo}">
		<h1>${vo.cname}</h1>
	</c:forEach>
	-->
   
<body>
   <div class="content">
      <h1><img class="img1" src="${url}/img/cody_maingif.gif/" alt=""></h1>
    </div>
    <div class="content">
      <h1><img class="img2" src="${url}/img/cody_main2.png/" alt=""></h1>
    </div>
    <div class="content">
      <h1><img class="img3" src="${url}/img/cody_main3.png/" alt=""></h1>
    </div>
    <div class="content">
      <h1><img class="img4" src="${url}/img/cody_main4.png/" alt=""></h1>
    </div>
    <div class="content">
      <h1><img class="img5" src="${url}/img/cody_main5.png/" alt=""></h1>
    </div>
    <div class="content">
      <h1><img class="img6" src="${url}/img/cody_maingif2.gif/" alt=""></h1>
    </div>
    <div class="content">
      <h1><img class="img7" src="${url}/img/cody_mainLast.png/" alt=""></h1>
    </div>
   
</body>
   
  
>>>>>>> 7a18e8e (장현주 : 코디메인페이지 수정)
  </body>
</html>