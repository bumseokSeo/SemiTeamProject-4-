<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

	<h1>코디 관리자 페이지</h1>
	<div id="d1">
		<form method="get" action="/" id="codyFrm">
			<img src="" id="preview"/>
			<ul>
				<li>이미지 추가</li>
				<li>
					<input type="file" name="cname" id ="file"/>
					<a href="javascript:document.getElementById('file').click();"><img src="image/plus_icon.png"/></a>
				</li>
				<li>온도</li>
				<li><input type="text" class="form-control" name="temp" id="temp"></li>
				<li>날씨</li>
				<li>
					<select class="form-control" name="weather" id="weather">
							<option>선택</option>
					    	<option>clear</option>
					    	<option>rain</option>
					    	<option>snow</option>
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
					    	<option>캐주얼룩</option>
					    	<option>모던룩</option>
					    	<option>스트릿룩</option>
					    	<option>오피스룩</option>
					    	<option>산책룩</option>
					    	<option>바캉스룩</option>
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
</body>
</html>