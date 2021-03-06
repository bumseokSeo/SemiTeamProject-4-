<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
@font-face {
   font-family: 'Cafe24Simplehae';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Simplehae.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}
body {
	margin: 0;
	padding: 0;
	background: url(${url}/img/mainbackG.png) center center no-repeat;
	background-size: cover;
	background-attachment: fixed;
	font-family: 'Cafe24Simplehae';
}
ul, li {
	margin: 0;
	padding: 0;
}
li {
	list-style-type: none;
	font-size: 18px;
	font-weight: 700;
}
a:link, a:visited {
	text-decoration: none;
	color: black;
}
h1 {
	margin-right: 100px;
	font-size: 40px;
	text-align: center;
	margin-bottom: 50px;
}
#loginForm {
	padding-top: 60px;
	padding-left: 100px;
	width: 1130px;
	margin: 0px auto;
	font-size: 17px;
	overflow: auto;
	margin-bottom: 200px;
    border: 1px solid #bdbdbd;
    border-radius: 5px;
    -webkit-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
    -moz-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
    box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
    background-color: rgba( 255, 255, 255, 0.4 );
}
#loginForm li {
	float: left;
	width: 20%;
	margin-bottom: 30px;
	line-height: 48px;
}
#loginForm li:nth-child(2n) {
	float: left;
	width: 80%;
}
#loginForm li:last-of-type {
	float: left;
	margin: 0px;
	width: 100%;
}
.form-control-lg {
	width: 90%;
}
#rememberIdLi{
	width:100%;
	margin-left: 23px;
}
#rememberIdLi>input{
	margin-top: 18px;
}
#submitbtn {
	width: 92%;
	margin-left: 0px auto;
	height:70px;
	margin-bottom: 50px;
	font-weight: 700;
}
.loginBottom {
	margin-right: 100px;
	margin-bottom: 500px;
}
.loginBottom div {
	float: left;
	width: 50%;
	text-align: center;
	font-weight: 700;
}

/*비밀번호 폰트 깨짐 해결*/
#userpwd{
	font-family:sans-serif;
}
#userpwd::placeholder{
	font-family:Cafe24Simplehae;
}
a:hover{
	text-decoration: underline;
	color: black;
}

</style>

<script>
	$(function() {
	    cookieCheck();
	});
	function formcheck() {
		var userid = document.getElementById("userid");
		if (userid.value == "") {
			alert("아이디를 입력해주세요");
			userid.focus();
			return false;
		}
		var userpwd = document.getElementById("userpwd");
		if (userpwd.value == "") {
			alert("비밀번호를 입력해주세요");
			userpwd.focus();
			return false;
		}
		saveid();
		return true;
	}
	
	function saveid(){
		//체크박스가 체크상태일 때 쿠키를 저장
		if(document.getElementById("rememberId").checked){//체크값이 true인경우
			//변수=값;path=/;expires=날짜;
			var now = new Date();
			now.setDate(now.getDate()+365);
			var cookieData = "userid="+userid.value+";path=/;expires="+now+";";
			document.cookie =cookieData;
			document.cookie = "rememberId=on;path=/;expires="+now+";";
		}else{
			var now = new Date();
			now.setDate(now.getDate()-365);
			var cookieData = "userid="+userid.value+";path=/;expires="+now+";";
			document.cookie =cookieData;
			document.cookie = "rememberId=on;path=/;expires="+now+";";
		}
	}
	
	function cookieCheck(){
		var cookieid = getCookie("userid");
        if(cookieid !=""){
        	$("input:checkbox[id='rememberId']").prop("checked", true);
            $('#userid').val(cookieid);
        }
	}
	
    function getCookie(Name) {
        var search = Name + "=";
        
        if (document.cookie.length > 0) { // 쿠키가 설정되어 있다면 
            offset = document.cookie.indexOf(search);
            if (offset != -1) { // 쿠키가 존재하면 
                offset += search.length;
                end = document.cookie.indexOf(";", offset);
                // 쿠키 값의 마지막 위치 인덱스 번호 설정 
                if (end == -1){
                	end = document.cookie.length;
                }  
                return unescape(document.cookie.substring(offset, end));
            }
        }
        return "";
    }
</script>
<div id="loginForm">
	<form method="post" action="${url}/member/loginOk"
		onsubmit="return formcheck()">
		<h1>로그인</h1>
		<ul>
			<li>아이디</li>

			<li><input class="form-control form-control-lg" type="text"
				placeholder="아이디" name="userid" id="userid">
			</li>
			<li>비밀번호</li>
			<li><input class="form-control form-control-lg" type="password"
				placeholder="비밀번호" name="userpwd" id="userpwd"></li>
			<li id="rememberIdLi">
				<input class="form-check-input" type="checkbox" value="rememberId" id="rememberId"/> 
				<label class="form-check-label"> 아이디 저장하기 </label>
			</li>
			<li> <input type="submit" value="로그인"
				id="submitbtn" class="btn btn-secondary"/></li>
		</ul>
	</form>
	<div class="loginBottom">
		<div>
			<a href="/member/findId" title="아이디 찾기">아이디</a>/<a href="/member/findPwd" title="비밀번호 찾기">비밀번호 찾기</a>
		</div>
		<div>
			<a href="/member/memberForm" title="회원가입">회원가입</a>
		</div>
	</div>
</div>
</body>
</html>