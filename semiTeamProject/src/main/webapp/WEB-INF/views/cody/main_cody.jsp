<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
 /* 제목 : 도현님 */
 @font-face {
  font-family: "ROKAFSansBold";
  src: url("https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts2201-3@1.0/ROKAFSansBold.woff")
    format("woff");
  font-weight: normal;
  font-style: normal;
}
h1 {
  margin-bottom:20px;
  text-align: center;
  font-family: "ROKAFSansBold";
  font-size: 40px;
  text-shadow: #9c9c9c 4px 4px 0px, 2px 2px 2px rgba(206, 89, 55, 0);
}
* {
  box-sizing: border-box;
}
body {
  background: url(${url}/img/codyBackground.png) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  max-height: 100%;
  max-width: 100%;
}
ul {
  list-style-type: none;
  padding-left: 0;
}
.main-container {
  margin: auto;
  width: 1130px;
}
.cody-main {
  position: fixed;
  width: 60%;
  height: 600px;
  float: left;
  top: 170px;
  left: 170px;
}
.cody-sub {
  width: 40%;
  height: 600px;
  float: right;
}
.cody-sub-container {
  height: 180px;
  display: flex;
  flex-direction: column;
  align-items: center;
  text-align: center;
}
/* ===========버튼 CSS ============*/
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
  margin-right: 5px
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
/*================ 버튼 CSS 끝============== */
/* ===============리스크 시작================= */
.cody-sub-style-list {
  display: flex;
  flex-wrap: wrap;
  justify-content: center;
  opacity: 1;
  transition: all var(--animation-duration) ease-out;
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
  width: 180px;
  height: 180px;
  margin: 7px;
  background-color: white;
  border-radius: 5px;
  -webkit-box-shadow: 13px 14px 46px 8px rgba(0,0,0,0.75);
  -moz-box-shadow: 13px 14px 46px 8px rgba(0,0,0,0.75);
  box-shadow: 13px 14px 46px 8px rgba(0,0,0,0.75);
  
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
  color: bisque;
  text-align: center;
}
.list-description span {
  color: #9c9c9c;
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
/* ===============리스크 끝================= */
/* =============메인 이미지 시작============== */
.cody-main-img {
  position: absolute;
  top: 20px;
  left: 50px;
  width: 500px;
  height: 450px;
  width: 560px;
 
  border: 10px solid #fafafa;
  outline: 3px solid #333;
  box-shadow: 15px 15px #9c9c9c;
}
/* =============메인 이미지 끝============== */
.animate__animated.animate__swing {
  --animate-duration: 1.2s;
}
</style>    
    <h1 class="animate__animated animate__swing">오늘 코디 어때?</h1>
   
    <!--  날씨, 성별 데이터에 따른 코디 가져오기 테스트
    <c:forEach var="vo" items="${vo}">
		<h1>${vo.cname}</h1>
	</c:forEach>
	-->
    <div class="main-container">

      <div class="cody-main">
        <div class="cody-main-img">
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
                <a href=""><span class="spot"></span>ALL</a>
              </div>
            </svg>
          </div>
          <!--Next button -->
          <div class="svg-wrapper">
            <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
              <rect id="shape" height="40" width="150" />
              <div id="text">
                <a href=""><span class="spot"></span>MEN</a>
              </div>
            </svg>
          </div>
          <!--Next button -->
          <div class="svg-wrapper">
            <svg height="40" width="150" xmlns="http://www.w3.org/2000/svg">
              <rect id="shape" height="40" width="150" />
              <div id="text">
                <a href=""><span class="spot"></span>WOMEN</a>
              </div>
            </svg>
          </div>
        </div>

        <div>
            <div class="cody-sub-style-list">
              <a href="#" class="list" target="blank">
                <img src="${url}/img/codyimg/cody01.jpg" alt="" class="list-img" >
                <div class="list-description">
                  <h3>오피스룩</h3>
                  <span>오피스룩 설명</span>
                </div>
              </a>
              <a href="#" class="list" target="blank">
                <img src="${url}/img/codyimg/cody2.jpg"  alt="" class="list-img">
                <div class="list-description">
                  <h3>오피스룩</h3>
                  <span>오피스룩 설명</span>
                </div>
              </a>
              <a href="#" class="list" target="blank">
                <img src="${url}/img/codyimg/cody03.jpg"  class="list-img">
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
  
  </body>
</html>