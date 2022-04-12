<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script> 
    
<style>
	
	   body{
	       background-color: rgb(228, 231, 234);
	   }
	   #foodForm{
	       background-color: #f5f4f4;
	       width: 650px;
	       margin: 0 auto;
	       margin-top: 200px;
	       font-family: 'NanumSquare',san-serif;
	       border-radius: 20px;
	       margin-bottom : 50px;
	   }
	   #foodNameFixed{
	       display: none;
	   }
	   #deleteDate{
	       text-decoration: none;
	       color: black;
	   }
	   #deleteDate:hover{
	       color: gray;
	   }
	   #eventSelected{
	       font-size: 17px;
	       text-align: center;
	       font-weight: bold;
	   }
	   #priorityForm{
	       display: none;
	   }
	   #cancel{
	       margin:0 50px;
	       width: 70px;
	   }
	   #add{
	       margin-right:50px;
	       width: 70px;
	   }
	   #modify{
	       width: 70px;
	   }
	   #alertDate{
	       display: none;
	       color: blueviolet;
	   }
	
	   .day{
	       display: none;
	   }

</style>
<script>
    $(function(){
    	
    	var flagSeason = false;
    	var flagTemp = false;
    	var flagWeather = false;
    	var flagEvent = false;
    	
        //검색 버튼 클릭하면 DB에서 해당 음식 정보 끌어오기
        //검색 버튼 클릭시 해당 음식이 DB에 없다면 없는 음식이라고 알리기


        //검색 버튼 클릭시 
        $("#searchButton").click(function(){
            //수정할 음식을 입력 안했을 때
            if($("#searchFood").val()==''){
                alert('수정할 음식을 입력하세요.');
                $("#searchFood").focus();
                return false;
            }
          	//음식이름은 기본키여서 수정 불가
            $("#fname").attr("disabled", true);
            //수정할 음식을 검색했기 때문에 추가 버튼은 안보이게
            $("#add").css('visibility', 'hidden');
            
            //검색 버튼 클릭시 submit
            /*
            $("#adminForm").attr("action", "foodSearch");
            $("#adminForm").submit(function(){
            	
            	
            });*/
            
            var searchFood = $("#searchFood").val();
            
            /*
            $.ajax({
            	url : "/getFoodData",
            	data : "searchFood=" + searchFood,
            	method : 'post',
            	success : function(result){
            		
            	},
            	error : function(error){
            		
            	}
            	
            	
            });
            */
            

        });
        
        //취소 버튼 클릭시 초기화
        $("#cancel").click(function(){

        	$(".searchForm").css('visibility','visible');
            $("#searchFood").val('');
            $("#fname").val('');
            $("#fname").attr("disabled", false);
            $("#fcategory").val('');
            $(".form-select option:eq(0)").prop("selected", true);
            $(".form-check").attr("checked", false);
            $("#foodimg").val('');
            $("#add").css('visibility', 'visible');
		    $("#modify").css('visibility', 'visible');
        });

        //추가 버튼 클릭 시
        $("#add").click(function(){

            if($("#fname").val()==''){
                alert('음식 이름을 입력하세요.');
                $("#fname").focus();
                return false;
            }
            if($("#fcategory").val()==''){
                alert("음식 종류를 입력하세요. (ex.한식, 양식, 중식, 일식, 디저트..)");
                $("#fcategory").focus();
                return false;
            }

            if($("#foodimg").val()==''){
                alert("음식 이미지 파일을 선택해 업로드 하세요.");
                return false;
            }
            
            //추가 버튼 클릭시 submit
            $("#adminForm").attr("action", "foodAdd");
            
            $("#adminForm").submit();
            
        });
       
        //파일 이름 중복 확인
        $("#foodimg").change(function(){
        	
        	var file = $("#foodimg").val();
        	console.log(file);
        	
        	var fileName = file.substring(file.lastIndexOf("\\")+1);
        	console.log(fileName);
        	
        	$.ajax({
        		url : '/fileNameCheck',
        		data : "fileName=" + fileName,
        		method : "post",
        		
        	 	success : function(result){
        	 		
        	 		if(result>0){
        	 			alert('동일한 이름의 이미지 파일이 있습니다. 추가하려는 음식 이름과 같은 이름의 사진 파일을 업로드하세요');
        	 			$("#foodimg").val('');
        	 			return false;		
        	 		}
        	 	},
        	 	error : function(error){
        	 		console.log(error.responseText);	 		
        	 	}	
        	});
        });
        
        //수정 버튼 클릭 시
        $("#modify").click(function(){
        	
        	//수정 버튼 클릭 시 submit
        	 $("#adminForm").attr("action", "foodModify");
             
             $("#adminForm").submit();
        });
       
		//음식 추가시 검색창, 수정 버튼 안보이게 처리
		 $("#fname").focus(function(){
		     
		     $(".searchForm").css('visibility','hidden');
		     $("#modify").css('visibility', 'hidden');
		     
		 });
		
		function priorityChange(){
			 if(flagSeason == false && flagTemp==false && flagWeather==false && flagEvent==false){	 
				 $("#priorityNo").prop("checked", true);
			 }
		}
        
        //우선 순위 라디오 버튼은 select에서 모두 첫번째 항목일때  N 체크 
        //select에서 선택한 항목이 한개라도 첫번째가 아니면 저절로 Y 체크
        //화면에서는 보이지 않는 부분
        $("#season").change(function(){
           var season = $("#season option:selected").val();
        
           if(season != 'allseason'){
            $("#priorityYes").prop("checked", true);
            flagSeason=true;
           }
           if(season == 'allseason'){
            flagSeason=false;
           }
           priorityChange();

        });

        $("#temp").change(function(){
           var temp = $("#temp option:selected").val();

           if(temp != '0'){
            $("#priorityYes").prop("checked", true);
            flagTemp = true;
           }
           if(temp == '0'){
            flagTemp = false;
           }
           priorityChange();
        });

        $("#weather").change(function(){
           var weather = $("#weather option:selected").val();

           if(weather != 'allweather'){
            $("#priorityYes").prop("checked", true);
            flagWeather = true;
           }
           if(weather == 'allweather'){
        	 flagWeather = false;
           }
           priorityChange();
        });

        $("#event").change(function(){
            var event = $("#event option:selected").val();

            if(event != 'no'){
                 $("#priorityYes").prop("checked", true);
                 //모달창 띄우기
                 $(".modal").modal('show');
                 $("#eventDate").val('');   
                 flagEvent = true;
             }

            if(event == 'no'){
             $("#eventSelected").html('');
             $("#eventSelected").css('display', 'none');
             $("#deleteDate").css('display', 'none');
             flagEvent = false;
            }
            priorityChange();

         });  
        
      //모달창 닫히지 배경클릭, esc 입력해도 닫히지 않게
        $(".modal").modal({
            backdrop : 'static',
            keyboard : false
        });

        // X 버튼 클릭하면 모달 닫히게
        $(".btn-close").click(function(){
            $(".modal").modal('hide');
            //이벤트 상관 없음으로 변경
            $("#event option:eq(0)").prop("selected", true);
            $("#eventDate").val('');
            flagEvent = false;
            priorityChange();
        });

        //날짜 확인 버튼 클릭시
        $("#eventButton").click(function(){

            var eventDate = $("#eventDate").val();
            //날짜 입력 값 없을 경우
            if(eventDate==''){
                //날짜 입력 알리기
                $("#alertDate").css('display', 'inline-block');
            }
            //날짜 선택 -> 날짜 입력 알리기 안보이게 설정
            $("#eventDate").change(function(){
                $("#alertDate").css('display', 'none');
                
            });
            //날짜 입력 값 있으면 모달창 내리기
            if(eventDate !=''){
                $(".modal").modal('hide');
                
            	/////이벤트 있음의 value에 이벤트 날짜 넣기
                $("#event option:eq(1)").val(eventDate);
                console.log($("#event option:eq(1)").val());
                
                ////////선택된 날짜 나타나게 하기
                $("#eventSelected").html(eventDate);
                $("#eventSelected").css('display', 'inline-block');
                $("#deleteDate").css('display', 'inline-block');
                
                flagEvent = true; 
            }

            //날짜 선택한 뒤 날짜 삭제 버튼 클릭
            $("#deleteDate").click(function(){
                $("#eventSelected").html('');
                $("#eventSelected").css('display', 'none');
                $("#deleteDate").css('display', 'none');

              //이벤트 없음으로 되돌리기
                $("#event option:eq(0)").prop("selected", true);
                
                flagEvent = false;
                priorityChange();
              
                //이벤트 저장된 값 초기화
               $("#event option:eq(1)").val('');  
               console.log($("#event option:eq(1)").val());           
            })
        });
    });

</script>

<div class="container">
        <h1>음식 관리 페이지</h1>
        <div id="foodForm">
        
        	<form method="post" id="adminForm" name="adminForm" enctype="multipart/form-data">
	            <div class="row g-3 searchForm">
	                <!--수정할 음식 이름 검색-->
	                <div class="col-sm-6 m-3">
	                    <input type="text" class="form-control" id="searchFood" placeholder="수정할 음식 이름을 입력하세요" name="searchFood">
	                </div>
	                <div class="col-sm-4">
	                    <input type="button" class="btn btn-secondary mb-3" id="searchButton" value="검색" > 
	                </div>
                </div>

                <!--음식 이름 작성 (Not Null)-->
                <div class="row m-2">
                    <label for="fname" class="col-sm-2 col-form-label ">음식이름</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control " id="fname" name="fname" placeholder="음식이름">
                    </div>
                    <span class="col-sm-2" id="foodNamechk"></span>
                    <input class = "col-sm-3" type="text" name="foodNameFixed" id="foodNameFixed" value="">
                </div>
                <!--음식 종류 작성 (Not Null)-->
                <div class="row m-2">
                    <label for="fcategory" class="col-sm-2 col-form-label ">음식종류</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control " id="fcategory" name="fcategory" placeholder="음식종류">
                    </div>
                </div>
                <!--계절 선택 (Not Null)-->
                <div class="row m-2">
                    <label for="season" class="col-sm-2 col-form-label">계절</label>
                    <div class="col-sm-5">
                        <select class="form-select col-auto" id="season" name="season">
                            <option selected value="allseason">계절 무관</option>
                            <option value="spring">봄</option>
                            <option value="summer">여름</option>
                            <option value="fall">가을</option>
                            <option value="winter">겨울</option>
                        </select>
                    </div>
                </div>
                <!--온도 선택 (Not Null)-->
                <div class="row m-2">
                    <label for="temp" class="col-sm-2 col-form-label">온도</label>
                    <div class="col-sm-5">
                        <select class="form-select col-auto" id="temp" name="temp">
                            <option selected value="0">상관 없음</option>
                            <option value="1">25도 이상일 때 추천</option>
                            <option value="2">15도 이하일 때 추천</option>
                        </select>
                    </div>
                </div>
                <!--날씨 선택-->
                <div class="row m-2">
                    <label for="weather" class="col-sm-2 col-form-label">날씨</label>
                    <div class="col-sm-5">
                        <select class="form-select col-auto" id="weather" name="weather">
                            <option selected value="allweather">상관 없음</option>
                            <option value="clear">맑음</option>
                            <option value="cloud">흐림</option>
                            <option value="rain">비</option>
                            <option value="snow">눈</option>
                        </select>
                    </div>
                </div>
                <!--이벤트 선택 (있으면 모달로 날짜 입력 받기)-->
                <div class="row m-2" id="eventForm">
                    <label for="event" class="col-sm-2 col-form-label">이벤트</label>
                    <div class="col-sm-5">
                        <select class="form-select col-auto" id="event" name="event">
                            <option selected value="no">상관 없음</option>
                            <option value="">있음</option> 
                        </select>
                    </div>
                    <span class="col-sm-3" class="day" id="eventSelected"></span>
                    <a class="col-sm-2 day" id="deleteDate">삭제</a>
                </div>
                <!--우선순위 (Not Null)-->
                <div class="row m-2"  >
                    <label class="col-sm-2 col-form-label">우선순위</label>
                    <div class="form-check col-sm-3">
                        <input class="form-check-input m-2" type="radio" id="priorityYes" name="priority" value='Y'>
                        <label class="form-check-label" for="priorityYes">
                            Y
                        </label> 
                    </div>
                    <div class="form-check col-sm-3">
                        <input class="form-check-input m-2" type="radio" id="priorityNo" name="priority" checked="checked" value='N'>
                        <label class="form-check-label" for="priorityNo">
                            N
                        </label>
                    </div>
                </div>
                <!--음식 사진 파일 업로드 (Not Null)-->
                <div class="row m-2">
                    <label class="col-sm-2 col-form-label" for="foodimg">음식 사진</label>
                    <input type="file" class="col-sm-5" id="foodimg" name="filename">
                </div>
                
                <div class="m-2">
                    <input type="button" class="btn btn-secondary mb-3" id="cancel" value="취소">
                    <input type="button" class="btn btn-secondary mb-3" id="add" value="추가">
                    <input type="button" class="btn btn-secondary mb-3" id="modify" value="수정">
                </div>
                <!--날짜 입력 받는 모달창-->
                <div class="modal fade" data-backdrop = "static" data-keyboard="false">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">이벤트 날짜를 입력하세요</h5>
                                <button type="button"  class="btn-close"  aria-label="Close"></button>
                            </div>
                            <div class="modal-body" >
                                <input class = "col-sm-5" type="date" name="eventDate" id="eventDate"/>
                                <input  type="button" id="eventButton" value="확인">
                                <span id="alertDate">날짜를 입력하세요</span>
                            </div>
                        </div>
                    </div>
                </div>

           </form>

        </div>
    </div>
    
</body>
</html>