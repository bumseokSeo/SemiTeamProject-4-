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

        });

        //취소 버튼 클릭시 초기화
        $("#cancel").click(function(){

            $("#searchFood").val('');
            $("#foodName").val('');
            $("#foodCategory").val('');
            $(".form-select option:eq(0)").prop("selected", true);
            $(".form-check").attr("checked", false);
            $("#foodImageFile").val('');
        });

        //추가 버튼 클릭 시
        $("#add").click(function(){

            if($("#foodName").val()==''){
                alert('음식 이름을 입력하세요.');
                $("#foodName").focus();
                return false;
            }

            if($("#foodCategory").val()==''){
                alert("음식 종류를 입력하세요. (ex.한식, 양식, 중식, 일식..)");
                $("#foodCategory").focus();
                return false;
            }

            if($("#foodImageFile").val()==''){
                alert("음식 이미지 파일을 선택해 업로드 하세요.");
                return false;
            }

        });

       /*  
        //수정 버튼 클릭 시
        $("#modify").click(function(){

            if(cnt==0){
                alert("수정한 사항이 없습니다.");
                return false;
            }
            
        });
 */
        
        
        //우선 순위 라디오 버튼은 select에서 모두 첫번째 항목일때  N 체크 
        //select에서 선택한 항목이 한개라도 첫번째가 아니면 저절로 Y 체크
        //화면에서는 보이지 않는 부분
        $("#seasons").change(function(){
           var season = $("#seasons option:selected").val();
           
           console.log(season);

           if(season != 'allseason'){
            $("#priorityYes").prop("checked", true);
           }

           if(season == 'allseason'){
            $("#priorityNo").prop("checked", true);
           }

        });

        $("#temp").change(function(){
           var temp = $("#temp option:selected").val();

           if(temp != '0'){
            $("#priorityYes").prop("checked", true);
           }

           if(temp == '0'){
            $("#priorityNo").prop("checked", true);
           }

        });

        $("#weather").change(function(){
           var weather = $("#weather option:selected").val();

           if(weather != 'allweather'){
            $("#priorityYes").prop("checked", true);
           }

           if(weather == 'allweather'){
            $("#priorityNo").prop("checked", true);
           }

        });

        $("#event").change(function(){
            var event = $("#event option:selected").val();

            if(event != 'no'){
                 $("#priorityYes").prop("checked", true);
                 //모달창 띄우기
                 $(".modal").modal('show');
                 $("#eventDate").val('');
             }

            if(event == 'no'){
             $("#priorityNo").prop("checked", true);
             $("#eventSelected").html('');
             $("#eventSelected").css('display', 'none');
             $("#deleteDate").css('display', 'none');
            }

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
                
                
                ////////선택된 날짜 나타나게 하기
                $("#eventSelected").html(eventDate);
                
                $("#eventSelected").css('display', 'inline-block');
                $("#deleteDate").css('display', 'inline-block');

            }

            //날짜 선택한 뒤 날짜 삭제 버튼 클릭
            $("#deleteDate").click(function(){
                $("#eventSelected").html('');
                $("#eventSelected").css('display', 'none');
                $("#deleteDate").css('display', 'none');

                //이벤트 없음으로 되돌리기
                $("#event option:eq(0)").prop("selected", true);

            })

        });



    });

</script>

<div class="container">
        <h1>음식 관리 페이지</h1>
        <div id="foodForm">

            <form class="row g-3">
                <!--수정할 음식 이름 검색-->
                <div class="col-sm-6 m-3">
                    <input type="text" class="form-control" id="searchFood" placeholder="수정할 음식 이름을 입력하세요">
                </div>
                <div class="col-sm-4">
                    <input type="button" class="btn btn-secondary mb-3" id="searchButton" value="검색">
                </div>

                <!--음식 이름 작성 (Not Null)-->
                <div class="row m-2">
                    <label for="foodName" class="col-sm-2 col-form-label ">음식이름</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control " id="foodName" name="foodName" placeholder="음식이름">
                    </div>
                </div>
                <!--음식 종류 작성 (Not Null)-->
                <div class="row m-2">
                    <label for="foodCategory" class="col-sm-2 col-form-label ">음식종류</label>
                    <div class="col-sm-5">
                      <input type="text" class="form-control " id="foodCategory" name="foodCategory" placeholder="음식종류">
                    </div>
                </div>
                <!--계절 선택 (Not Null)-->
                <div class="row m-2">
                    <label for="seasons" class="col-sm-2 col-form-label">계절</label>
                    <div class="col-sm-5">
                        <select class="form-select col-auto" id="seasons" name="seasons">
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
                            <option value="yes">있음</option> 
                        </select>
                    </div>
                    <span class="col-sm-3" class="day" id="eventSelected"></span>
                    <a class="col-sm-2 day" id="deleteDate">삭제</a>
                </div>
                <!--우선순위 (Not Null)-->
                <div class="row m-2" id="priorityForm">
                    <label class="col-sm-2 col-form-label">우선순위</label>
                    <div class="form-check col-sm-3">
                        <input class="form-check-input m-2" type="radio" id="priorityYes" name="priority">
                        <label class="form-check-label" for="priorityYes">
                            Yes
                        </label> 
                    </div>
                    <div class="form-check col-sm-3">
                        <input class="form-check-input m-2" type="radio" id="priorityNo" name="priority" checked="checked">
                        <label class="form-check-label" for="priorityNo">
                            No
                        </label>
                    </div>
                </div>
                <!--음식 사진 파일 업로드 (Not Null)-->
                <div class="row m-2">
                    <label class="col-sm-2 col-form-label" for="foodImageFile">음식 사진</label>
                    <input type="file" class="col-sm-5" id="foodImageFile">
                </div>
                
                <div class="m-2">
                    <button type="submit" class="btn btn-secondary mb-3" id="cancel">취소</button>
                    <button type="submit" class="btn btn-secondary mb-3" id="add">추가</button>
                    <button type="submit" class="btn btn-secondary mb-3" id="modify">수정</button>
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