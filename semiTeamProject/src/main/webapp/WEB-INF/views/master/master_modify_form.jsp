<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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
#d1 {
   width: 800px;
   margin: 0 auto;
}   

#codyFrm {
   width: 800px;
   float: left;
   padding: 50px;
   padding-top: 30px;
   margin-top: 30px;
   margin-bottom:20px;
   border: 1px solid #bdbdbd;
   border-radius: 5px;
   -webkit-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
   -moz-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
   box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
   background-color: rgba( 255, 255, 255, 0.4 );
  
   
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

#codyImg {
   width: 200px;
   margin:0px auto;
   margin-bottom: 35px;
   display: flex;
   justify-content: center;
}

textarea {
   resize: none;
}
#canclebtn{
   width:160px;
   margin-left:85px;
   margin-right:200px;
   
}
#submitbtn{
   width:160px;
}

.addimage {
   text-align: center;
   margin-bottom: 15px;
}

#plus {
   width: 80px;
   height: 80px;
   margin-bottom: 15px;
}

#canclebtn, #submitbtn {
	margin-top: 30px;
}
</style>

<script>
$(function() {
   
	$("#submitbtn").click(function(){
		if(!confirm("수정하시겠습니까?")){
			return false;
		}
	});
	
	$("#canclebtn").click(function(){
		if(!confirm("이전페이지로 이동합니다.")){
			return false;
		}
		history.back();
	});
	
   $("#codyFrm").submit(function() {
      event.preventDefault();
      
      if ($("#temp").val() == '') {
         alert("온도를 입력하세요.");
         $("#temp").focus();
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
         url: '/codyUpdate',
         data: params,
         method:"post",
         processData: false,
         contentType: false,
         success:function(result){
            if(result>0){
               alert("수정되었습니다.");
               location.reload();
            }
         },
         error:function(e){
            console.log(e.responseText);
            alert("수정 실패하였습니다.");
         }
      });
   });
});

</script>
      <h1>코디 수정</h1><hr/>
   <div id="d1">
      <form method="post" action="/codyUpdate" id="codyFrm" enctype="multipart/form-data">
         <img src="${url}/img/codyimg/codyupload/${vo[0].cname}" id="codyImg" title="코디 이미지는 수정할 수 없습니다."/>
            <div class="addimage">
               <input type="hidden" name="cname" value="${vo[0].cname}" id="cname"/>
            </div>
         <ul>
            <li>온도</li>
            <li><input type="text" class="form-control" name="temp" id="temp" value="${vo[0].temp}"></li>
            <li>날씨</li>
            <li>
               <select class="form-control" name="weather" id="weather">
  					<option<c:if test="${vo[0].weather==null}"> selected</c:if>>선택</option>
					<option value="clear"<c:if test="${vo[0].weather=='clear'}"> selected</c:if>>맑음</option>
                  	<option value="rain"<c:if test="${vo[0].weather=='rain'}"> selected</c:if>>비</option>
					<option value="snow"<c:if test="${vo[0].weather=='snow'}"> selected</c:if>>눈</option>
               </select>
            </li>
            <li><label for="sex">성별</label></li>
            <li>
               <select class="form-control" name="sex" id="sex">
                      <option>선택</option>
                      <option value="m"<c:if test="${vo[0].sex=='m'}"> selected</c:if>>남성</option>
                      <option value="f"<c:if test="${vo[0].sex=='f'}"> selected</c:if>>여성</option>
               </select>
            </li>
            <li>스타일</li>
            <li>
               <select class="form-control" name="style" id="style">
                      <option>선택</option>
                      <option value="casual"<c:if test="${vo[0].style=='casual'}"> selected</c:if>>캐주얼룩</option>
                      <option value="modern"<c:if test="${vo[0].style=='modern'}"> selected</c:if>>모던룩</option>
                      <option value="street"<c:if test="${vo[0].style=='street'}"> selected</c:if>>스트릿룩</option>
                      <option value="office"<c:if test="${vo[0].style=='office'}"> selected</c:if>>오피스룩</option>
                      <option value="walk"<c:if test="${vo[0].style=='walk'}"> selected</c:if>>산책룩</option>
                      <option value="special"<c:if test="${vo[0].style=='special'}"> selected</c:if>>스페셜룩</option>
               </select>
            </li>
            <li><label for="info">상세설명</label></li>
            <li>
                 <textarea class="form-control" rows="2" name="info" id="info">${vo[0].info}</textarea>
              </li>
         </ul>
         <input type="button" value="취소" id="canclebtn" class="btn btn-danger"/>
         <input type="submit" value="수정" id="submitbtn" class="btn btn-secondary"/>
      </form>
   </div>
</body>
</html>