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
   
   #delbtn{
   	margin-left: 850px;
   }
	

	#memberEdit{
		padding-top:100px;
		padding-left:100px;
		border: 1px solid gray;
		width:1130px;
		margin:0px auto;
		
		font-size: 1em;
		overflow:auto;
		
	
	}
	
	#memberEdit li{
		float:left;
		width:20%;
		margin-bottom: 30px;
		
	}
	#memberEdit li:nth-child(2n){
		float:left;
		width:80%;
	}
	
	#memberEdit li:last-of-type{
		float:left;
		margin:0px;
		width:100%;
		
	}
	.form-control-lg, #profile{
		width:90%;
	}
	#preview{
		width:70%;
		height:575.67px;
		overflow: hidden;
	}
	
	
	#resetbtn{
		width:300px;
		margin-left: 32.5px;
		margin-bottom: 100px;
	}
	#submitbtn{
		width:300px;
		margin-left: 265px;
		margin-bottom: 100px;
		
	}
	
	#review{
		width:1130px;
		height:1000px;
		margin-top:100px;
		border: 1px solid gray;
		margin:0px auto;
		overflow:auto;
	}
	
	
</style>
<script>

$(function(){
	$('#profile').change(function() {//이미지 첨부되면 실행
		
		setImage(this, '#preview');
	});

});

	function formcheck(){
		
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
		
		

		return true;
	}
	//이미지 미리보기
	function setImage(input, preview) {
		$('#preview').css("display","block");//display설정 변경
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				$(preview).attr('src', e.target.result);
			}
			reader.readAsDataURL(input.files[0]);
		}
	};
	
	function delCheck(){
		//회원탈퇴
		if(confirm("탈퇴할경우 지난 리뷰들이 모두 삭제됩니다.\n탈퇴하시겠습니까?")){
			location.href="${url}/member/memberDelete?userid=${vo.userid}"
		}
		
	}
</script>
	<div id="memberEdit">
		<button type="button" onclick="delCheck()" class="btn btn-danger" id="delbtn">회원탈퇴</button>
		<form method="post" action="${url}/member/memberEditOk" onsubmit="return formcheck()" enctype="multipart/form-data">
			<h1>마이페이지</h1>
			<ul>
				<li>아이디</li>
				<li><input class="form-control form-control-lg" type="text" name="userid" id="userid" maxlength="20" disabled="disabled" value="${vo.userid}">	
				</li>
				<li>비밀번호</li>
				<li><input class="form-control form-control-lg" type="password" placeholder="비밀번호" name="userpwd" id="userpwd"></li>
				<li>비밀번호 확인</li>
				<li><input class="form-control form-control-lg" type="password" placeholder="비밀번호 확인" name="userpwd2" id="userpwd2"></li>
				<li>닉네임</li>
				<li><input class="form-control form-control-lg" type="text" placeholder="2~8자리의 영문,숫자,한글조합" name="username" id="username" maxlength="8" value="${vo.username}"></li>
				<li>이메일</li>
				<li><input class="form-control form-control-lg" type="text" placeholder="" name="email" id="email" value="${vo.email}"></li>
				<li>프로필 사진 등록
				</li>
					<li><input type="file" class="form-control-file border" name="imgName" id="profile" accept="image/jpeg,image/png,image/bmp,image/tiff,image/gif"/></li>
				<li></li>
				<li>
					<img src='' id="preview" style="display: none" class="rounded-circle"/>
				</li>
				<li>
					<input type="reset" value="취소" id="resetbtn" class="btn btn-danger"/>
					<input type="submit" value="등록" id="submitbtn" class="btn btn-secondary"/>
				</li>
			</ul>
		</form>
	</div>
	<div id="review">
		<ul>
			
		</ul>
	
	</div>

</body>
</html>