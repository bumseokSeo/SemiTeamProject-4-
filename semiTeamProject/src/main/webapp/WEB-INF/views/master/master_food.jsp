<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
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
		background: url(${url}/img/mainbackG.png) center center no-repeat;
		background-size: cover;
		background-attachment: fixed;
		font-family: 'Cafe24Simplehae';
	}


     ul, li{
           list-style-type: none;
           margin: 0;
           padding: 0;
   
       }
     .container{
          width: 1300px;
          height: 100%;
     }
     h1 {
           margin-bottom: 50px;
      }
      a{
          text-decoration: none;
          color: black;
      }
      a:hover{
         text-decoration: none;
         color:black;
      }
      input[type=button] { 
           background: rgb(108, 109, 105);
           border: none;
      }
      #foodForm{
            width : 100%;
      }
      
      #adminForm{
         width: 68%;
         padding: 50px;
         margin: 0 auto;
         margin-top: 30px;
	     background-color: rgba( 255, 255, 255, 0.4 );
	     border: 1px solid #bdbdbd;
	     border-radius: 5px;
	    -webkit-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	    -moz-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
    	 box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
      }
      #deleteDate{
          text-decoration: none;
          color: midnightblue;
      }
      #deleteDate:hover{
          color: gray;
      }
      #eventSelected{
          font-size: 17px;
          text-align: center;
          font-weight: bold;
      }
      #eventYes{
            color: blue;
            display : none;
      }
    
      #priorityForm{
          display: none;
      }
      #foodPhoto{
            width : 80%;
            height : 50%;
            margin: 0 auto;
      }
      #buttons input[type=button]{
			width: 122px;
  			height: 48px;
  			margin: 20px 30px 0 30px;
      }
      
      #foodList{
           width: 120px;
           height: 50px;
           margin-bottom: 30px;
           margin-left: 20px;
           border: none;
      }
      #alertDate{
          display: none;
          color: blueviolet;
      }
      .day{
          display: none;
      }
      
      #photoDelete{
            display: none;
      }
      #foodimgName{
            color : gray;
      }
     
       #modalFood{
           justify-content: center;
           align-items: center;
           overflow-y: auto;
       }
       #modalFood .modal-dialog{
           overflow-y: initial !important;
       }
       #modalFood .modal-title{
           margin: 10px 30px;
       }
       #modalFood .modal-body{
           overflow-y: auto;
           height: 100%;
           margin-bottom:30px;
       }
       #foodCategory{
        width: 100%;
        margin-top:20px;
        text-align: center;
        height : 60px;
        font-size: 20px;
        
       }
      #foodCategory ul{
            text-align: center;
            display: flex;
            flex-flow: row nowrap;
            justify-content:space-around;
            width: 100%;
       }
       #foodAll{
             margin: 20px;
       }
       #foods{
             background: yellow;
       }
       .eachFood{
           width: 25%;
           float: left;
           text-align: center;
           margin-bottom: 30px;       
       }
       .foodName{
           font-weight: bold;
           font-size:17px;
       }
       .foodPicture{
           width:150px !important;
           border-radius: 20px;
           object-fit:cover;
           height: 150px;
           max-width: 100%;
       }
       #otherPageLink{
      text-align: center;
      font-size: 20px;
   }
   
	label {
		font-weight: 700;
	}
	#otherMasterPage{
		position: relative;
		display: flex;
		justify-content: space-around;
		width:1150px;
		margin: 0 auto;
		margin-top: 30px;
		font-size: 1.5em;	
		font-weight: 700;
	}
	#otherMasterPage a:hover {
	   color: #5584AC;
	}
	#otherMasterPage a:nth-child(3){
		color: #5584AC;
	}
      
</style>
<script>
    $(function(){
       
       var flagSeason = false;
       var flagTemp = false;
       var flagWeather = false;
       var flagEvent = false;
       
       //우선순위 확인 함수
       function priorityChange(){
          if(flagSeason == false && flagTemp==false && flagWeather==false && flagEvent==false){    
             $("#priorityNo").prop("checked", true);
          }
          else{
             $("#priorityYes").prop("checked", true);
          }
      }
       
       //이미지 미리보기 함수
       function imagePreview(input, expression){
          if(input.files && input.files[0]){
             var reader = new FileReader();
             
             reader.onload = function(e){
                $(expression).attr('src', e.target.result);         
             }
             reader.readAsDataURL(input.files[0]);
          }
       }
       
       //사진 지우기
       function photoDelete(){
         $("#foodPhoto").attr("src", "");
         $("#photoDelete").css("display", "none");
         $("#foodimg").val('');
         $("#foodPhoto").css('display', 'none');
         $("#foodimgName").text("");
               
       }

        function eventDelete(){
            $("#eventYes").css('display', 'none');
            $("#eventSelected").html('');
            $("#eventSelected").css('display', 'none');
            $("#deleteDate").css('display', 'none');
        }   

       //수정할 음식 검색란에 focus
       $("#searchFood").focus(function(){
          $("#add").css('visibility', 'hidden');
          
          if($("#foodPhoto").attr("src") == undefined){
             $("#photoDelete").css('display', 'none');
             
          }else if($("#foodPhoto").attr("src") != ''){
             $("#foodPhoto").css('display','block');   
             $("#photoDelete").css('display', 'block');
          }
          else{
             $("#foodPhoto").css('display','none');
             $("#photoDelete").css('display', 'none');
          }
       });
       
       
       //음식 이름에 focus
       $("#fname").focus(function(){
          $("#add").css('visibility', 'visible');
          
          if($("#fname").attr("readonly")){
             $("#add").css('visibility', 'hidden');
             $("#modify").css('visibility', 'visible');
             $(".searchForm").css('visibility', 'visible');
             
          }
       });       
       
        //검색 버튼 클릭시 
        $("#searchButton").click(function(){
            //수정할 음식을 입력 안했을 때
            if($("#searchFood").val()==''){
                alert('수정할 음식을 입력하세요.');
                $("#searchFood").focus();
                return false;
            }
             //음식이름은 기본키여서 수정 불가
            $("#fname").attr("readonly", true);
            //수정할 음식을 검색했기 때문에 추가 버튼은 안보이게
            $("#add").css('visibility', 'hidden');
           
            //검색 버튼 클릭하면 음식 정보 가져오기
            var searchFood = $("#searchFood").val();
            
            $.ajax({
               url : "/getFoodData",
               data : "searchFood=" + searchFood,
               method : 'post',
               success : function(result){
                  
                  if(result==""){
                     alert('존재하지 않는 음식입니다.\n');
                     $("#cancel").click();
                     return false;
                  }
                  
                  console.log(result);
                  $("#fname").val(result.fname);
                  $("#fcategory").val(result.fcategory);
                  $("#season").val(result.season).prop("selected", true);
                  $("#temp").val(result.temp).prop("selected", true);
                  
                  if(result.season !="allseason"){
                     flagSeason = true;
                  }else{
                     flagSeason=false;
                  }
                  
                  if(result.temp!="0"){
                     flagTemp = true;
                  }else{
                     flagTemp = false;
                  }
                  
                  if(result.weather==null){
                     $("#weather option:eq(0)").prop("selected", true);
                     flagWeather=false;
                  }else{
                     $("#weather").val(result.weather).prop("selected", true);
                     flagWeather=true;
                  }
                  
                  if(result.event==null){
                     $("#event option:eq(0)").prop("selected", true);
                     flagEvent=false;
                  }else{
                     $("#event option:eq(1)").prop("selected", true);
                     $("#event option:eq(1)").val(result.event);
                     var event = result.event;
                     var idx = event.indexOf("-");
                     console.log(idx);
                     
                     //월일만 보이게 하기
                     
                     $("#eventYes").css('display', 'inline-block');
                     $("#eventSelected").html(event.substr(idx+1));
                        $("#eventSelected").css('display', 'inline-block');
                        $("#deleteDate").css('display', 'inline-block');
                        flagEvent=true;
                  }
                  
                   //날짜 선택한 뒤 날짜 삭제 버튼 클릭
                  $("#deleteDate").click(function(){
                     eventDelete();
                      
                    //이벤트 없음으로 되돌리기
                      $("#event option:eq(0)").prop("selected", true);
                      
                      flagEvent = false;
                      priorityChange();
                    
                      //이벤트 저장된 값 초기화
                     $("#event option:eq(1)").val('');  
                     console.log($("#event option:eq(1)").val());           
                  })
                  
                  //우선순위 반영
                  priorityChange();
                  
                  //3.
                  //음식 사진 가져오기
                  $("#foodPhoto").attr("src", "/img/foodimg/upload/"+result.foodimg);
                  $("#photoDelete").css("display", "inline-block");
                  $("#foodPhoto").css("display", "block");
                  $("#foodimgName").text("저장되어 있는 이미지 파일 : " + result.foodimg);
                  
                  /* imagePreview(this, "#foodPhoto"); */
                  
                  $("#photoDelete").click(function(){
                     photoDelete();
                     
                  });
                  
               },
               error : function(error){
                  console.log(error.responseText);   
                  
               }
            });
        });
        
        //취소 버튼 클릭시 초기화
        $("#cancel").click(function(){
           
           //수정할 음식 입력 검색란 보이게 하기
            $(".searchForm").css('visibility','visible');
            $("#searchFood").val('');
            
            //텍스트 입력란은 공백으로 초기화
            $("#fname").val('');
            $("#fname").attr("readonly", false);
            $("#fcategory").val('');
            //선택란은 기본값으로 변경
            $(".form-select option:eq(0)").prop("selected", true);
            $("#weather option:eq(0)").prop("selected", true);
            $(".form-check").attr("checked", false);
            $("#add").css('visibility', 'visible');
            $("#modify").css('visibility', 'visible');
            
            eventDelete();//

          //이벤트 없음으로 되돌리기
            $("#event option:eq(0)").prop("selected", true);
            
           flagSeason = false;
           flagTemp = false;
           flagWeather = false;
           flagEvent = false;
           
           priorityChange();
           
           photoDelete();
           
        });

        //추가 버튼 클릭 시
        $("#add").click(function(){
           
           var standard = /\s/g;
           var fname = $("#fname").val();

            if(fname=='' || fname.match(standard)){
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
      //음식 추가시 검색창, 수정 버튼 안보이게 처리
         $("#fname").focus(function(){
            
             if($("#searchFood").val()==''){
                $("#modify").css('visibility', 'hidden');
                $(".searchForm").css('visibility','hidden');
             }
             
         });
       
        //파일 변경
        $("#foodimg").change(function(){
           
           //이미지 미리보기
           imagePreview(this, "#foodPhoto");
           $("#photoDelete").css("display", "inline-block");
           $("#foodPhoto").css('display', 'block');
           
           $("#photoDelete").click(function(){
             photoDelete();
          });
    
        });
        
        //수정 버튼 클릭 시
        $("#modify").click(function(){
           
           if($("#fname").val()==''){
              alert('수정할 음식을 검색하세요');
              $("#searchFood").focus();
              return false;
           }
           if($("#fcategory").val()==''){
                alert("음식 종류를 입력하세요. (ex.한식, 양식, 중식, 일식, 디저트..)");
                $("#fcategory").focus();
                return false;
            }
            if($("#foodimg").val()=='' && $("#foodPhoto").attr("src") == ''){
                alert("음식 이미지 파일을 선택해 업로드 하세요.");
                return false;
            }
            
           //수정 버튼 클릭 시 submit
            $("#adminForm").attr("action", "foodModify");
             
             $("#adminForm").submit();
        });
       
      
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
                 $("#modalEvent").modal('show');
                 $("#eventDate").val('');   
                 flagEvent = true;
             }

            if(event == 'no'){
                eventDelete();//
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
            $("#modalEvent").modal('hide');
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
                $("#modalEvent").modal('hide'); 
                
               //이벤트 있음의 value에 이벤트 날짜 넣기
                $("#event option:eq(1)").val(eventDate);
               $("#eventSend").text(eventDate);
                console.log($("#event option:eq(1)").val());
                
                //선택된 날짜 나타나게 하기
                
               var idx = eventDate.indexOf("-");
               console.log(idx);
                     
               //월일만 보이게 하기
               
               $("#eventYes").css('display', 'inline-block');
               $("#eventSelected").html(eventDate.substr(idx+1));
                $("#eventSelected").css('display', 'inline-block');
                $("#deleteDate").css('display', 'inline-block');
                
                flagEvent = true; 
            }

            //날짜 선택한 뒤 날짜 삭제 버튼 클릭
            $("#deleteDate").click(function(){
                eventDelete(); 

              //이벤트 없음으로 되돌리기
                $("#event option:eq(0)").prop("selected", true);
                
                flagEvent = false;
                priorityChange();
              
                //이벤트 저장된 값 초기화
               $("#event option:eq(1)").val('');  
               console.log($("#event option:eq(1)").val());           
            })
        });

        //음식 리스트 클릭시 음식 모달창 //
        $("#foodList").click(function(){
            $("#total").click();
            
            $("#modalFood").modal('show');
        });
        ////음식 리스트에 음식 카테고리에 해당하는 음식 보이게 하기
        $(".foodType").click(function(){
                
            var type = $(this).text();
            
            $.ajax({
                url: '/showfoods',
                data : 'foodType=' + type,
                method: 'post',
                
                success: function(result){
                    var tag = "";
                    var $result = $(result);
                   
                    $result.each(function(idx,vo){
                           tag+= "<li class='eachFood'>";
                           tag += "<span class='foodName'>" + vo.fname+ "</span><br/>";
                           tag += "<img class='foodPicture img-fluid' src='/img/foodimg/upload/" + vo.foodimg + "'><br/>";////////////////
                           tag += "<span class='foodCate'>" + vo.fcategory + "</span></li>";
                    
                        $("#foods").html(tag);
                    });
                },
                error: function(error){
                    console.log(error.responseText);
                }
            });
        });
        
        $("#foodClose").click(function(){
            $("#modalFood").modal('hide');

        });
    });

</script>
   <h1>Manager Page</h1><hr/>

	<div id="otherMasterPage">
		<a href="/member/masterPage">회원 관리</a>
		<a href="/master/master_modify_cody">코디 관리</a>
		<a href="/master/master_food">음식 관리</a>
	</div><br/>
   
   <div class="container">
        <div class="modal fade" data-backdrop = "static" data-keyboard="false" id="modalFood">
            <div class="modal-dialog modal-lg modal-dialog-scrollable " >
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">음식 리스트</h5><hr/>
                        <!-- <h5 class="modal-title"></h5><hr/> -->
                        <button type="button"  class="btn-close"  aria-label="Close" id="foodClose"></button> 
                    </div>
                    <div id="foodCategory">
                        <ul>
                            <li><a href="#" class="foodType" id="total">전체</a></li>
                            <li><a href="#" class="foodType">한식</a></li>
                            <li><a href="#" class="foodType">일식</a></li>    
                            <li><a href="#" class="foodType">중식</a></li>   
                            <li><a href="#" class="foodType">디저트</a></li>    
                            <li><a href="#" class="foodType">기타</a></li>    
                        </ul>
                    </div>
                    <div class="modal-body" >
                        <div id="foodAll">
                            <ul id="foods">
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div id="foodForm">
           <form method="post" id="adminForm" name="adminForm" enctype="multipart/form-data">
              <input type="button" class="btn btn-secondary" id="foodList" value="음식전체보기">
               <div class="row m-2 searchForm">
                   <!--수정할 음식 이름 검색-->
                   <label for="fname" class="col-lg-3 col-form-label my-2">음식 검색</label>
                   <div class="col-lg-8 my-2">
                       <input type="text" class="form-control" id="searchFood" placeholder="수정할 음식 이름을 입력하세요" name="searchFood">
                   </div>
                   <div class="col-lg-1 my-2">
                       <input type="button" class="btn btn-secondary mb-3" id="searchButton" value="검색" > 
                   </div>
                </div>

                <!--음식 이름 작성 (Not Null)-->
                <div class="row m-2 ">
                    <label for="fname" class="col-lg-3 col-form-label my-2">음식이름</label>
                    <div class="col-lg-8 my-2">
                      <input type="text" class="form-control " id="fname" name="fname" placeholder="음식이름">
                    </div>
                </div>
                <!--음식 종류 작성 (Not Null)-->
                <div class="row m-2">
                    <label for="fcategory" class="col-lg-3 col-form-label my-2">음식종류</label>
                    <div class="col-lg-8 my-2">
                      <input type="text" class="form-control " id="fcategory" name="fcategory" placeholder="음식종류">
                    </div>
                </div>
                <!--계절 선택 (Not Null)-->
                <div class="row m-2">
                    <label for="season" class="col-lg-3 col-form-label my-2">계절</label>
                    <div class="col-lg-8 my-2">
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
                    <label for="temp" class="col-lg-3 col-form-label my-2">온도</label>
                    <div class="col-lg-8 my-2">
                        <select class="form-select col-auto" id="temp" name="temp">
                            <option selected value="0">상관 없음</option>
                            <option value="1">25도 이상일 때 추천</option>
                            <option value="2">15도 이하일 때 추천</option>
                        </select>
                    </div>
                </div>
                <!--날씨 선택-->
                <div class="row m-2">
                    <label for="weather" class="col-lg-3 col-form-label my-2">날씨</label>
                    <div class="col-lg-8 my-2">
                        <select class="form-select col-auto" id="weather" name="weather">
                            <option selected value="allweather">상관 없음</option>
                            <option value="clear">맑음</option>
                            <option value="rain">비</option>
                            <option value="snow">눈</option>
                        </select>
                    </div>
                </div>
                <!--이벤트 선택 (있으면 모달로 날짜 입력 받기)-->
                <div class="row m-2" id="eventForm">
                    <label for="event" class="col-lg-3 col-form-label my-2">이벤트</label>
                    <div class="col-lg-8 my-2">
                        <select class="form-select col-auto" id="event" name="event">
                            <option selected value="no">상관 없음</option>
                            <option value="">있음</option> 
                        </select>
                    </div>
                    <div class="col-lg-3 my-2" id="eventYes">날짜</div>
                    <span class="col-lg-3 my-2" class="day" id="eventSelected"></span>
                    <a class="col-lg-2 day my-2" id="deleteDate">삭제</a>
                </div>
                <!--우선순위 (Not Null)-->
                <div class="row m-2"  id="priorityForm">
                    <label class="col-lg-3 col-form-label">우선순위</label>
                    <div class="form-check col-lg-3">
                        <input class="form-check-input m-2" type="radio" id="priorityYes" name="priority" value='Y'>
                        <label class="form-check-label" for="priorityYes">
                            Y
                        </label> 
                    </div>
                    <div class="form-check col-lg-3">
                        <input class="form-check-input m-2" type="radio" id="priorityNo" name="priority" checked="checked" value='N'>
                        <label class="form-check-label" for="priorityNo">
                            N
                        </label>
                    </div>
                </div>
                <!--음식 사진 파일 업로드 (Not Null)-->
                <div class="row m-2">
                    <label class="col-lg-3 col-form-label my-2" for="foodimg">음식 사진</label>
                    <input type="file" class="col-lg-8 my-2" id="foodimg" name="filename" >
                  <button type="button"  class="btn-close my-2"  aria-label="Close" id="photoDelete"></button>
                  <span id="foodimgName" class="my-2 "></span>
                  <img id="foodPhoto" class="my-2"/>
                </div>
                
                <div class="row" id="buttons">
                   <div class="col-lg-12 text-center"> 
                      <input type="button" class="btn btn-secondary mb-2" id="cancel" value="취소">
                       <input type="button" class="btn btn-secondary mb-2" id="add" value="추가">
                       <input type="button" class="btn btn-secondary mb-2" id="modify" value="수정">
                   </div>
                </div>
                <!--날짜 입력 받는 모달창-->
                <div class="modal fade" data-backdrop = "static" data-keyboard="false" id="modalEvent">
                    <div class="modal-dialog">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">이벤트 날짜를 입력하세요.</h5>
                                <button type="button"  class="btn-close"  aria-label="Close"></button>
                            </div>
                            <div class="modal-body" >
                                <input class = "col-sm-5" type="date" name="eventDate" id="eventDate"/>
                                <input  type="button" id="eventButton" value="확인">
                                <span id="alertDate">날짜를 입력하세요.</span>
                            </div>
                        </div>
                    </div>
                </div>
           </form>
        </div>
    </div>
</body>
</html>