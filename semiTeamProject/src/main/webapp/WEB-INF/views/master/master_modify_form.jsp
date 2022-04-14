<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<style>
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
   border: 1px solid gray;
   padding: 50px;
   padding-top: 30px;
   margin-top: 30px;
   margin-bottom:20px;
}

#codyFrm>input[type=text] {
   width: 300px;
}
#codyFrm>ul>li{
   float:left;
   width:20%;
   margin-bottom:30px;
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
#resetbtn{
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

</style>

<script>
$(function() {
   
   $("#codyFrm").submit(function() {
      event.preventDefault();
      
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
            alert("중복 확인 에러!?");
         }
      });
      
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

</script>
   <div id="d1">
      <h1>코디 관리자 수정폼</h1>
      <form method="post" action="/codyInsert" id="codyFrm" enctype="multipart/form-data">
         <img src="${url}/img/codyimg/codyupload/f1.jpg" id="codyImg"/>
            <div class="addimage">
               <input type="hidden" name="cname" value="" id="cname"/>
            </div>
         <ul>
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
         <input type="submit" value="수정" id="submitbtn" class="btn btn-secondary"/>
      </form>
   </div>
</body>
</html>