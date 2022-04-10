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
   
    <!--  날씨, 성별 데이터에 따른 코디 가져오기 테스트
    <c:forEach var="vo" items="${vo}">
      <h1>${vo.cname}</h1>
   </c:forEach>
   -->
   
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
</html>