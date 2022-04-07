<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
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

</style>

<div class="container">
        <h1>음식 관리 페이지</h1>
        <div id="foodForm">

            <form class="row g-3">
                <!--수정할 음식 이름 검색-->
                <div class="col-sm-6 m-3">
                    <input type="text" class="form-control" id="searchFood" placeholder="수정할 음식 이름을 입력하세요">
                </div>
                <div class="col-sm-4">
                    <button type="submit" class="btn btn-secondary mb-3">수정</button>
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
                            <option selected value="every">계절 무관</option>
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
                            <option selected >상관 없음</option>
                            <option value="clear">맑음</option>
                            <option value="cloud">흐림</option>
                            <option value="rain">비</option>
                            <option value="snow">눈</option>
                        </select>
                    </div>
                </div>
                <!--이벤트 선택 (있으면 모달로 날짜 입력 받기)-->
                <div class="row m-2">
                    <label for="event" class="col-sm-2 col-form-label">이벤트</label>
                    <div class="col-sm-5">
                        <select class="form-select col-auto" id="event" name="event">
                            <option selected >상관 없음</option>
                            <option value="yes">있음</option> <!--날짜 문자열로 넣기-->
                        </select>
                    </div>
                </div>
                <!--우선순위 (Not Null)-->
                <div class="row m-2">
                    <label for="colFormLabelSm" class="col-sm-2 col-form-label">우선순위</label>
                    <div class="form-check col-sm-3">
                        <input class="form-check-input m-2" type="radio" id="priorityYes" name="priority">
                        <label class="form-check-label" for="priorityYes">
                            Yes
                        </label> 
                    </div>
                    <div class="form-check col-sm-3">
                        <input class="form-check-input m-2" type="radio" id="priorityNo" name="priority">
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
                
                


            </form>

        </div>
    </div>
    
    
</body>
</html>