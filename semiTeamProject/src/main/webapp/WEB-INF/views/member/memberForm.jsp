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
	}
	
	ul, li {
		margin: 0;
		padding: 0;
	}
	
	li {
		list-style-type: none;
		font-size: 1em;
	}
	
	ul a:link, ul a:visited {
		text-decoration: none;
		color: black;
	}
	h1{
      margin-right:100px;
      font-size: 40px;
      text-align: center;
      margin-bottom: 50px;
      
   }
	
	#memberForm{
		padding-top:100px;
		padding-left:100px;
		width:1130px;
		margin:0px auto;
		font-size: 1em;
		overflow:auto;
	    background-color: rgba( 255, 255, 255, 0.4 );
	    border: 1px solid #bdbdbd;
	    border-radius: 5px;
	    -webkit-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	   -moz-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	   box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	}
	#memberForm li{
		float:left;
		width:20%;
		margin-bottom: 30px;
		line-height: 2.5;
		font-weight: 700;
		
	}
	#memberForm li:nth-child(2n){
		float:left;
		width:80%;
		
	}
	
	#memberForm li:last-of-type{
		float:left;
		margin:0px;
		width:100%;
		
	}
	.form-control-lg{
		width:90%;
	}
	
	
	#resetbtn{
		width:300px;
		margin: 30px 0 100px 32.5px;
	}
	#submitbtn{
		width:300px;
		margin: 30px 0 100px 265px;
	}
	

	
</style>
<script>

$(function(){
	//아이디 중복검사
	$("#userid").keyup(function(){
		var reg = reg = /^[0-9a-zA-Z]{6,20}$/;
		var userid=$("#userid").val();
		if(userid != '' && reg.test(userid)){
			var url = "${url}/member/memberIdCheck";
			
			$.ajax({
				url : url,
				data : "userid="+userid,
				type : "POST",
				success:function(result){
					if(result>0){//중복된 아이디임
						
						$("#idcheck").css("display","inline");
						$("#idcheck").html("사용불가능합니다.");
						$("#idcheck").css("color","red");
					}
					else{//사용가능
						$("#idcheck").css("display","inline");
						$("#idcheck").html("사용가능합니다.");
						$("#idcheck").css("color","blue");
					}
				},
				error:function(error){
					console.log(error.responseText);
				}
			});
		}else{//id 최소 최대길이 조건으로 사용불가
			$("#idcheck").css("display","inline");
			$("#idcheck").html("아이디는 영문,숫자조합 6~20자리입니다.");
			$("#idcheck").css("color","red");
			
		}
		
	});
});
	function formcheck(){
		var userid = document.getElementById("userid");
		if(document.getElementById("userid").value==""){
			alert("아이디를 입력해주세요");
			userid.focus();
			return false;
		}
		var idcheck = document.getElementById("idcheck").innerHTML
		if (idcheck != '사용가능합니다.') {
			alert("아이디를 확인해주세요");
			userid.focus();
			return false;
		}
		
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
		
		//닉네임
		reg = /^[가-힣0-9a-zA-Z]{2,8}$/;
		var username = document.getElementById("username");
		
		if(username.value==""){
			//공백인경우
			alert("닉네임을 입력하세요");
			username.focus();
			return false;
		}
		if(!reg.test(username.value)){
			alert("닉네임을 2글자 이상 입력해주세요");
			username.focus();
			return false;
		}	
		var reg = /^\w{6,12}[@]{1}[a-zA-Z]{2,8}[.]{1}[a-zA-Z]{2,4}([.][a-zA-Z]{2,4})?$/;
		var email = document.getElementById("email");
		if(email.value==""){
			//공백인경우
			alert("이메일을 입력하세요");
			email.focus();
			return false;
		}
		if(!reg.test(email.value)){
			alert("이메일을 확인해주세요 입력해주세요");
			email.focus();
			return false;
		}
		
		var answer = document.getElementById("answer");
		if(answer.value==""){
			//공백인경우
			alert("질문과 답변을 확인해주세요");
			answer.focus();
			return false;
		}
		return true;
	}
</script>
	<div id="memberForm">
		<form method="post" action="${url}/member/memberOk" onsubmit="return formcheck()">
			<h1>회원가입</h1>
			<ul>
				<li>아이디</li>
					
				<li><input class="form-control form-control-lg" type="text" placeholder="아이디" name="userid" id="userid" maxlength="20">
					<span id="idcheck" style="display: none"></span>
				</li>
				<li>비밀번호</li>
				<li><input class="form-control form-control-lg" type="password" placeholder="비밀번호" name="userpwd" id="userpwd"></li>
				<li>비밀번호 확인</li>
				<li><input class="form-control form-control-lg" type="password" placeholder="비밀번호 확인" name="userpwd2" id="userpwd2"></li>
				<li>닉네임</li>
				<li><input class="form-control form-control-lg" type="text" placeholder="2~8자리의 영문,숫자,한글조합" name="username" id="username" maxlength="8"></li>
				<li>이메일</li>
				<li><input class="form-control form-control-lg" type="text" placeholder="" name="email" id="email"></li>
				<li><label for="sel_sex">성별을 선택하세요:</label></li>
				<li>
					<select class="form-control form-control-lg" id="sex" name="sex" style="width:90%">
					    	<option value="m">남성</option>
					    	<option value="f">여성</option>
					</select>
				</li>
				<li style="margin-bottom: 10px;"><label for="sel_ask" style="font-size: 0.5em;">질문을 선택하세요<br>(계정 분실시 사용됩니다)</label></li>
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
				<li>
					<input type="reset" value="취소" id="resetbtn" class="btn btn-danger"/>
					<input type="submit" value="등록" id="submitbtn" class="btn btn-secondary"/>
				</li>
			</ul>
		</form>
	</div>
</body>
</html>