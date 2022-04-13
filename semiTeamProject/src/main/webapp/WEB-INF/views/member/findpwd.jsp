<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<style>
body {
	margin: 0;
	padding: 0;
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

#loginForm {
	padding-top: 100px;
	padding-left: 100px;
	border: 1px solid gray;
	width: 1130px;
	margin: 0px auto;
	font-size: 1em;
	overflow: auto;
}

#loginForm li {
	float: left;
	width: 20%;
	margin-bottom: 30px;
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


#submitbtn {
	width: 90%;
	margin-left: 0px auto;
	height:70px;
	margin-bottom: 100px;
}

.loginBottom {
	margin-right: 100px;
	margin-bottom: 500px;
}

.loginBottom div {
	float: left;
	width: 50%;
	text-align: center;
}
</style>
<script>
	$(function() {

	  
	});

</script>
<div id="loginForm">
	<form method="post" action="${url}/member/loginOk"
		onsubmit="return formcheck()">
		<h1>비밀번호 찾기</h1>
		<ul>
			<li>아이디</li>

			<li><input class="form-control form-control-lg" type="text"
				placeholder="아이디" name="userid" id="userid"> <!-- <input type="text" id="idcheck" value='N' disabled/> -->
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
			<a href="/member/findId" title="아이디 찾기">아이디</a>
		</div>
		<div>
			<a href="/member/memberForm" title="회원가입">회원가입</a>
		</div>
	</div>
</div>
</body>
</html>