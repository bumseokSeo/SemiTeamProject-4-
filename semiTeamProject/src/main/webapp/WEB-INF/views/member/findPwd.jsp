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
a:hover{
	text-decoration: underline;
	color: black;
}
h1 {
	margin-right: 100px;
	font-size: 40px;
	text-align: center;
	margin-bottom: 50px;
}
#findform {
	padding: 60px 0 80px 100px;
	width: 1130px;
	margin: 0px auto;
	font-size: 1em;
	overflow: auto;
	margin-bottom: 200px;
	background-color: rgba( 255, 255, 255, 0.4 );
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
	line-height: 40px;
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
#findpwdbtn {
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
}
</style>
<script>
	function formcheck() {
		var userid = document.getElementById("userid");
		
		if(document.getElementById("userid").value==""){
			alert("아이디를 입력해주세요");
			userid.focus();
			return false;
		}
		
		var email = document.getElementById("email");

		if (email.value == "") {
			alert("이메일을 입력해주세요");
			email.focus();
			return false;
		}

		var answer = document.getElementById("answer");

		if (answer.value == "") {
			alert("답변을 입력해주세요");
			answer.focus();
			return false;
		}
		return true;
	}

</script>
<div id="findform">
	<form method="post" action="${url}/member/findPwdOk"
		onsubmit="return formcheck()">
		<h1>비밀번호 찾기</h1>
		<ul>
			<li>아이디</li>
			<li><input class="form-control form-control-lg" type="text" name="userid" id="userid" maxlength="20"></li>
			<li>가입한 이메일</li>
			<li><input class="form-control form-control-lg" type="text"
				placeholder="이메일" name="email" id="email">
			</li>
			<li><label for="sel_ask">질문을 선택하세요:</label></li>
			<li>
				<select class="form-control form-control-lg" id="ask" name="ask" style="width:90%">
					    <option value="school">입학했던 초등학교 이름은?</option>
					    <option value="travel">가장 기억에 남는 여행지는?</option>
					    <option value="born">내가 태어난 장소는?</option>
					    <option value="motto">나의 좌우명은?</option>
					    <option value="treasure">나의 보물1호는?</option>
					    <option value="book">인상 깊게 읽은 책 제목은?</option>
					    <option value="character">내가 좋아하는 캐릭터는?</option>
					    <option value="friend">유년시절 가장 생각나는 친구 이름은?</option>
				</select>
			</li>
			<li>답변</li>
			<li><input class="form-control form-control-lg" type="text" placeholder="" name="answer" id="answer"></li>
			<li><input type="submit" value="비밀번호 초기화하기"
				id="findpwdbtn" class="btn btn-secondary"/></li>
		</ul>
	</form>
	<div class="loginBottom">
		<div>
			<a href="/member/findId" title="아이디 찾기">아이디 찾기</a>
		</div>
		<div>
			<a href="/member/memberForm" title="회원가입">회원가입</a>
		</div>
	</div>
</div>
</body>
</html>