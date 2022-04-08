<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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
  background: url(${url}/img/codyBackground.png) no-repeat center center fixed;
  -webkit-background-size: cover;
  -moz-background-size: cover;
  -o-background-size: cover;
  background-size: cover;
  max-height: 100%;
  max-width: 100%;
}

.main-container {
  position: relative;
  top: 30px;
  width: 1130px;
  height: 100%;
  margin: 0 auto;

}

a {
  text-decoration: none;
}

a:hover {
  text-decoration: underline;

}

/* ================사이드nav메뉴 시작================ */
.sidenav {
  position: fixed;
  width: 240px;
  top: 50px;
  left: 0;
}

.sidenav .main-buttons, a {
  list-style-type: none;
  margin: 64px 0;
  padding: 0;
  color: #534439;
}

.sidenav .main-buttons li {
  text-transform: uppercase;
  letter-spacing: 2px;
  font-family: "ROKAFSansBold";
  font-size: 16px;
  font-weight: 600;
}

.sidenav .main-buttons > li {
  padding: 16px 52px;
  -moz-box-sizing: border-box;
  -webkit-box-sizing: border-box;
  box-sizing: border-box;
}

.sidenav .main-buttons > li:hover,
 .sidenav .main-buttons > li:active,
  .sidenav .main-buttons > li:focus {
  background-color: #F29544;
  cursor: pointer;
}

.sidenav .main-buttons > li:hover .hidden {
  opacity: 1;
  visibility: visible;
}

.sidenav .main-buttons > li:hover .hidden, 
.sidenav .main-buttons > li:active .hidden, 
.sidenav .main-buttons > li:focus .hidden {
  width: 190px;
}

/* .hidden {
  width: 0;
  height: 600px;
  padding: 64px 0;
  position: absolute;
  top: 0;
  right: 0;
  overflow: hidden;
  list-style-type: none;
  background-color: #ffffffb2;
  -moz-transition: 0.3s;
  -o-transition: 0.3s;
  -webkit-transition: 0.3s;
  transition: 0.3s;
} */

.hidden {
  position: absolute;
  opacity: 0;
  visibility: hidden;
  list-style-type: none;
  top: 330px;
  right: 0;
}

.hidden li {
  padding: 16px 24px;
}

.hidden li:hover, 
.hidden li:active, 
.hidden li:focus {
  background-color: #F29544;
}

/* ===============사이드nav메뉴 끝============== */



.main-list-img.madal>img {
  width: 320px;
  height: 320px;
  border-radius: 5px;
  -webkit-box-shadow: 10px 10px 28px 0px rgba(0,0,0,0.63);
  -moz-box-shadow: 10px 10px 28px 0px rgba(0,0,0,0.63);
  box-shadow: 10px 10px 28px 0px rgba(0,0,0,0.63);
}


.main-list-group {
  margin-top: 20px;
  padding: 15px;
  width: 1100px;
  display: flex;
  justify-content: space-between;

}

.main-list-img.madal>span {
  display: block;
  text-align: center;
}

</style>    
    
    <div class="main-container">
      <nav class="sidenav">
        <ul class="main-buttons">
          <li>
            HOME
          </li>
          <li>
            ALL
          </li>
          <li>
            MEN
          </li>
          <li>
            WOMEN
          </li>
          <li>
            STYLE
            <ul class="hidden">
              <li>캐주얼룩</li>
              <li>모던룩</li>
              <li>오피스룩</li>
              <li>스트릿룩</li>
              <li>산책룩</li>
              <li>바캉스룩</li>
            </ul>
          </li>
        </ul>
      </nav>
      <section>
        <div class="main-list ">

          <div class="main-list-group">
            <div class="main-list-img madal">
              <img src="img/JJANG.jpg" alt="">
              <span>이미지 출처</span>
            </div>
  
            <div class="main-list-img madal">
              <img src="img/JJANG.jpg" alt="">
              <span>이미지 출처</span>
            </div>
  
            <div class="main-list-img madal">
              <img src="img/JJANG.jpg" alt="">
              <span>이미지 출처</span>
            </div>
          </div>

          <div class="main-list-group">
            <div class="main-list-img madal">
              <img src="img/JJANG.jpg" alt="">
              <span>이미지 출처</span>
            </div>
  
            <div class="main-list-img madal">
              <img src="img/JJANG.jpg" alt="">
              <span>이미지 출처</span>
            </div>
  
            <div class="main-list-img madal">
              <img src="img/JJANG.jpg" alt="">
              <span>이미지 출처</span>
            </div>
          </div>

        </div>
      </section>
    </div>
  </body>
</html>

