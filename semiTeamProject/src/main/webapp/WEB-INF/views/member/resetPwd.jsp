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

* {
	box-sizing: border-box;
}

body {
	background: url(${url}/img/mainbackG.png) center center no-repeat;
	background-size: cover;
	background-attachment: fixed;
	font-family: 'Cafe24Simplehae';
	margin: 0;
	padding: 0;
	font-weight: 700
}


ul, li {
	margin: 0;
	padding: 0;
}

li {
	list-style-type: none;
	font-size: 1em;
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

#findform {
	padding-top: 60px;
	padding-left: 100px;
	width: 1130px;
	margin: 0px auto;
	font-size: 1em;
	overflow: auto;
	margin-bottom: 200px;
    border: 1px solid #bdbdbd;
    border-radius: 5px;
    -webkit-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
   -moz-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
   box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);		
	margin-bottom: 80px;
}

#findform li {
	float: left;
	width: 20%;
	margin-bottom: 30px;
	line-height: 42px;
}

#findform li:nth-child(2n) {
	float: left;
	width: 80%;
}

#findform li:last-of-type {
	float: left;
	margin: 0px;
	width: 100%;
}

.form-control-lg {
	width: 90%;
}



#submitbtn {
	width: 92%;
	margin-left: 0px auto;
	height:70px;
	margin-bottom: 100px;
}

/*비밀번호 폰트깨짐 처리*/
#userpwd, #userpwd2{
	font-family:sans-serif;
}

</style>
<script>
	function formcheck() {
		//비밀번호
		var userpwd = document.getElementById("userpwd");
		var reg = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[$@$!%*#?&])[A-Za-z\d$@$!%*#?&]{8,16}$/;
	
		if(userpwd.value==""){
			alert("비밀번호를 입력해주세요");
			userpwd.focus();
			return false;
		}
		if(!reg.test(userpwd.value)){
			alert("비밀번호는 8~16자리 영문,숫자,특수문자가 각각\n1개 이상 존재해야합니다");
			userpwd.focus();
			return false;
		}
		
		//비밀번호확인
		var userpwd2 = document.getElementById("userpwd2");
		
		if(userpwd2.value==""){
			alert("비밀번호를 확인해주세요");
			userpwd2.focus();
			return false;	
		}
		if(userpwd2.value != userpwd.value){
			alert("비밀번호가 일치하지 않습니다");
			userpwd2.focus();
			return false;
		}
	}

</script>
<div id="findform">
	<form method="post" action="${url}/member/resetPwdOk"
		onsubmit="return formcheck()">
		<h1>비밀번호 변경</h1>
		<ul>
			<li>아이디 찾기</li>
			<li><input class="form-control form-control-lg" type="text" placeholder="아이디" name="userid" id="userid" maxlength="20" disabled="disabled" value="${tempUserId}"></li>
			<li>새로운 비밀번호</li>
			<li><input class="form-control form-control-lg" type="password" placeholder="비밀번호" name="userpwd" id="userpwd"></li>
			<li>비밀번호 확인</li>
			<li><input class="form-control form-control-lg" type="password" placeholder="비밀번호 확인" name="userpwd2" id="userpwd2"></li>
			<li><input type="submit" value="비밀번호 변경" id="submitbtn" class="btn btn-secondary"/></li>
		</ul>
	</form>
</div>

</body>
</html>