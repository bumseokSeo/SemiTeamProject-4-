<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <style>


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

      
    </style>

      

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

        
        const url = "https://api.openweathermap.org/data/2.5/weather?lat="+lat+"&lon="+lon+"&lang=kr&appid="+API_KEY+"&units=metric";
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