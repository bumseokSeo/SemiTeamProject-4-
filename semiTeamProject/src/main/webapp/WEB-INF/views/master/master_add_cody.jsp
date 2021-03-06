<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
@import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');

*{
  box-sizing: border-box;
}
@font-face {
   font-family: 'Cafe24Simplehae';
   src:
      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Simplehae.woff')
      format('woff');
   font-weight: normal;
   font-style: normal;
}

body {
	background: url(${url}/img/mainbackG.png);
	background-size: cover;
	font-family: 'Cafe24Simplehae';
}

body,ul,li{
	padding:0;
	margin:0;
	list-style-type: none;
}

/*폼 css*/

 a {color: black;  text-decoration: none;}
 a:link { text-decoration: none;}
 a:visited { text-decoration: none;}
 a:hover { color: black; text-decoration: none;}
 
h1 {
  margin-bottom: 50px;
}

.main-container {
  width: 1300px;
  height: 100%;
  margin:0 auto;
  position: relative;
  margin-bottom:50px;
  overflow:auto;
}

.menu-category {
  float: left;
  width: 10%;
  display: flex;
  flex-direction: column;
  font-size: 22px;
  font-weight: 800;
  margin-top: 8px;
  margin-right:30px;
}

.menu-category>a:last-child{
	color: #5584AC;
}

.menu-category>a {
  margin: 16px;
}

.menu-category>a:hover{
	color: #5584AC;
	transition-duration:300ms;
	
}

#formdiv{
	width:90%;
	height:100%;
	margin:0 auto;
	margin-top: 30px;
}

#codyFrm {
	width: 65%;
	border: 1px solid #bdbdbd;
	border-radius: 5px;
	padding: 50px;
	margin:0 auto;
	margin-top: 30px;
	margin-bottom:20px;
    background-color: rgba( 255, 255, 255, 0.4 );
    border: 1px solid #bdbdbd;
    border-radius: 5px;
    -webkit-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	-moz-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
}

#codyFrm>input[type=text] {
	width: 300px;
}
#codyFrm>ul>li{
	float:left;
	width:20%;
	margin-bottom:30px;
	font-weight: 700;
	line-height: 30px;
}
#codyFrm>ul>li:nth-child(2n){
	width:80%;
}
#file { /*input file*/
	display: none
}

#preview {
	width: 200px;
	margin-bottom:20px;
}

#plus {
	width: 30px;
}

textarea {
	resize: none;
}
#resetbtn{
	width:160px;
	margin-left:85px;
	margin-right:200px;
}
#submitbtn{
	width:160px;
}

#resetbtn, #submitbtn {
	margin-top: 30px;
}

</style>

<script>
$(function() {
	
	$('#file').change(function() {//이미지 첨부되면 실행
		setImage(this, '#preview');
	});

	$("#codyFrm").submit(function() {
		event.preventDefault();
		
		var file = $("#file").val();
		if (file == '') {
			alert("이미지를 첨부하세요.");
			$("#file").focus();
			return false;
		}
		
		var idx = file.lastIndexOf("\\")+1;
		$("#cname").val(file.substring(idx));
		console.log($("#cname").val());
		
		//cname 중복확인
		$.ajax({
			url: '/cnameCheck',
			data: "cname="+$("#cname").val(),
			method:"post",
			success:function(result){
				if(result>0){
					alert("중복된 파일명입니다.\n파일을 다시 업로드해 주세요.");
					$("#file").focus();
					return false;
				}
			},
			error:function(e){
				console.log(e.responseText);
			}
		});
		
		if ($("#temp").val() == '') {
			alert("온도를 입력하세요.");
			$("#temp").focus();
			return false;
		}
		
		var reg= /[1-8]{1}/;
		if(!reg.test($("#temp").val())){
			alert("온도는 1~8 사이의 숫자 1개만 입력해주세요.\n28도 이상 : 8\n  23~27도 : 7\n  20~22도 : 6\n  17~19도 : 5\n  12~16도 : 4\n    9~10도 : 3\n     5~8도 : 2\n  4도 이하 : 1");
			return false;
		}
			
		if ($("#weather").val() == '선택') {
			$("#weather").val('');
		}

		if ($("#sex").val() == '선택') {
			alert("성별을 선택하세요.");
			$("#sex").focus();
			return false;
		}

		if ($("#style").val() == '선택') {
			alert("스타일을 선택하세요.");
			$("#style").focus();
			return false;
		}
		
		var params = new FormData($("#codyFrm")[0]);
		console.log(params);
		
		$.ajax({
			url: '/codyInsert',
			data: params,
			method:"post",
			processData: false,
			contentType: false,
			success:function(result){
				if(result>0){
					alert("코디가 등록되었습니다.");
					location.reload();
				}
			},
			error:function(e){
				console.log(e.responseText);
				alert("코디 등록 실패하였습니다.");
			}
		});
	});
});

//이미지 미리보기
function setImage(input, preview) {
	if (input.files && input.files[0]) {
		var reader = new FileReader();
		reader.onload = function(e) {
			$(preview).attr('src', e.target.result);
		}
		reader.readAsDataURL(input.files[0]);
	}
};
</script>

	<h1>Manager Page</h1><hr/>
	<div class="main-container">
		<div class="menu-category">
        	<a href="${url}/master/master_modify_cody"> 코디수정 </a>
       	 	<a href="${url}/master/master_add_cody"> 코디추가 </a>
     	</div>
     	<div id="formdiv">
			<form method="post" action="/codyInsert" id="codyFrm" enctype="multipart/form-data">
				<img src="" id="preview"/>
				<ul>
					<li>이미지 추가</li>
					<li>
						<input type="file" name="filename" id ="file"/>
						<input type="hidden" name="cname" value="" id="cname"/>
						<a href="javascript:document.getElementById('file').click();"><img src="${url}/img/plus_icon.png"/ id="plus"></a>
					</li>
					<li>온도</li>
					<li><input type="text" class="form-control" name="temp" id="temp"></li>
					<li>날씨</li>
					<li>
						<select class="form-control" name="weather" id="weather">
								<option>선택</option>
						    	<option value="clear">맑음</option>
						    	<option value="rain">비</option>
						    	<option value="snow">눈</option>
						</select>
					</li>
					<li><label for="sex">성별</label></li>
					<li>
						<select class="form-control" name="sex" id="sex">
								<option>선택</option>
						    	<option value="m">남성</option>
						    	<option value="f">여성</option>
						</select>
					</li>
					<li>스타일</li>
					<li>
						<select class="form-control" name="style" id="style">
						    	<option>선택</option>
						    	<option value="casual">캐주얼룩</option>
						    	<option value="modern">모던룩</option>
						    	<option value="street">스트릿룩</option>
						    	<option value="office ">오피스룩</option>
						    	<option value="walk">산책룩</option>
						    	<option value="special">스페셜룩</option>
						</select>
					</li>
					<li><label for="info">상세설명</label></li>
					<li>
	  					<textarea class="form-control" rows="2" name="info" id="info"></textarea>
	  				</li>
				</ul>
				<input type="reset" value="취소" id="resetbtn" class="btn btn-danger"/>
				<input type="submit" value="등록" id="submitbtn" class="btn btn-secondary"/>
			</form>
		</div>
	</div>
</body>
</html>