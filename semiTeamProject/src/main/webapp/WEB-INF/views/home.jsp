<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <style>
      @import url("https://fonts.googleapis.com/css2?family=Archivo+Black&display=swap");

      * {
        box-sizing: border-box;
        font-family: "Archivo Black", sans-serif;
      }

      html {
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

      .nav-containor {
        display: flex;
        justify-content: space-between;
      }

      .navLogo-taxtDes {
        margin: 0 auto;
        margin-left: 15px;
      }

      .dropbtn {
        background-color: transparent;
        color: #4d4d4d;
        padding: 16px;
        font-size: 32px;
        border: none;
        cursor: pointer;
      }
      .dropdown {
        position: relative;
        display: inline-block;
      }
      .dropdown-content {
        display: none;
        position: absolute;
        top: 55px;
        right: 30px;
        background-color: #f9f9f9;
        min-width: 160px;
        box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0.2);
        z-index: 1;
      }
      .dropdown-content a {
        color: black;
        padding: 12px 16px;
        text-decoration: none;
        display: block;
      }
      .dropdown-content a:hover {
        background-color: #f1f1f1;
      }
      .dropdown:hover .dropdown-content {
        display: block;
      }
      .dropdown:hover .dropbtn {
        background-color: transparent;
        transition: all 500ms 0s ease;
        transform: scale(1.18);
      }
    </style>
  </head>
  <body>
    <div class="main-container">
      <div class="nav-containor">
        <div class="nav-logo">
          <h3 class="navLogo-taxt"><img src="" alt="" /></h3>
        </div>
        <div class="dropdown">
          <button class="dropbtn">
            <i class="fa-solid fa-bars"></i>
          </button>
          <div class="dropdown-content">
            <a href="#">링크1</a>
            <a href="#">링크2</a>
            <a href="#">링크3</a>
          </div>
        </div>
      </div>

      <div id="weather" class="rotate-center">
        <span></span>
        <span></span>
      </div>
    </div>
    <script>
      

      function onGeoOk(position) {
    	const API_KEY = "f5c60c534d9d9d62379dd9a1123c1983";
        const lat = position.coords.latitude;
        const lon = position.coords.longitude;
        const lang = "kr";
        
        const url = "https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&appid="+API_KEY+"&units=metric&lang=kr";
        fetch(url)
          .then((response) => response.json())
          .then((data) => {
            const weather = document.querySelector("#weather span:first-child");
            const city = document.querySelector("#weather span:last-child");
            city.innerText = data.name;
            weather.innerHTML = data.weather[0].main +'/'+ data.main.temp;
          });
      }
      function onGeoError() {
        alert("위치를 찾을 수 없습니다. ");
      }

      navigator.geolocation.getCurrentPosition(onGeoOk, onGeoError);
    </script>
  </body>
</html>