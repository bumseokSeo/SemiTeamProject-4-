<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="url" value="<%=request.getContextPath()%>" />
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">

<!-- CSS -->
<link rel="stylesheet" href="${url }/css/map_style.css">

<!-- 아이콘용 -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">


<style>
#top {
	display: none;
}
</style>
<!-- 카카오 api 라이브러리  -->
<!-- services와 clusterer, drawing 라이브러리 불러오기 -->
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=096ec0036610b77d5b4e1aa8571cbb1e&libraries=services,clusterer,drawing"></script>

<!-- bootstrap -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
<script
	src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<script>
	function reviewListAll(id) { // 현재 글의 댓글을 모두 가져오기
		id = "100839945";
		var params = "placeid=" + id; // 32번 글인경우: no=32
		var url = "/review/list?" + params;

		$
				.ajax({
					type : 'get',
					url : url,
					// data:params,
					success : function(result) {

						var $result = $(result); // vo, vo, vo, vo...

						/*<tbody>
						      <c:forEach var="vo" items="${list }">
						      <tr style="text-align:center;">
						         <td style="width:15%;" class="rounded">${vo.reviewimg }</td>
						         <td style="width:40%;text-overflow:ellipsis;">${vo.star}<br> ${vo.content }</td>
						         <td style="width:20%;">${vo.userid }</td>
						         <td style="width:20%;">${vo.writedate}</td>
						      </tr>
						      </c:forEach>

						   </tbody>
						 */
						var tag = "<table><tbody>";

						$result
								.each(function(idx, vo) {
									tag += '<tr style="text-align:center;">'
									tag += '<td style="width:5px height:30px;border-bottom:1px solid #ddd" class="rounded">'
											+ vo.reviewimg + '</td>';
									tag += '<td style="width:40%;text-overflow:ellipsis;;border-bottom:1px solid #ddd">'
											+ '<i class="fa fa-star" style="color: red;"></i>'
											+ vo.star
											+ '<br>'
											+ vo.content
											+ '</td>';
									tag += '<td style="width:20%;border-bottom:1px solid #ddd">'
											+ vo.userid + '</td>';
									tag += '<td style="width:20%;border-bottom:1px solid #ddd">'
											+ vo.writedate + '</td>';

									tag += "</tr>"; // vo의 개수만큼 순환
								});

						tag += "</tbody></table>";

						$("#reviewListBody").html(tag);

					},
					error : function(e) {
						console.log(e.responseText);
					}
				})
	}
	// 댓글----------------------------------------------------------
	$(function() {
		// 댓글 목록을 가져오는 함수

		//reviewListAll(1);

		// 리뷰등록
		$("#evaluation444").submit(function() {

			event.preventDefault(); // form 기본이벤트 제거
			if ($("#content").val() == '') {
				alert("리뷰 입력 후 등록하세요.");
				return;
			} else { // 리뷰을 입력한 경우
				var id = "100839945";
				var params = $("#evaluation444").serialize(); // form에 있는 데이터가 담김

				$.ajax({
					url : '/review/writeOk',
					data : params + "&id=" + id,
					type : 'POST',
					success : function(r) {
						//alert(r);
						$("content").val("");
						// 에러가 안난다면 => 댓글목록이 refresh되어야 한다. 
						reviewListAll(r.id);
					},
					error : function(e) {
						console.log(e.responseText);
					}
				});
			}
		});
		// 현재글의 댓글
		//reviewListAll();
	});
</script>
<title>map메인화면</title>
</head>
<body id="body-pd">

	<div class="l-navbar" id="navbar">
		<nav class="nav">
			<div>
				<div class="nav__brand">
					<ion-icon name="menu-outline" class="nav__toggle" id="nav-toggle"></ion-icon>
					<a href="#" class="nav__logo"></a>
				</div>

				<div class="nav__list">
					<a href="#" class="nav__link active"> <ion-icon
							name="home-outline" class="nav__icon"></ion-icon> <span
						class="nav_name" onclick="toggleDiv()">리뷰 작성하기</span>
					</a> <a href="myReview" class="nav__link"> <ion-icon
							name="chatbubbles-outline" class="nav__icon"></ion-icon> <span
						class="nav_name">내가 쓴 리뷰 목록</span>
					</a>
				</div>
				<a href="#" class="nav__link"> <ion-icon name="log-out-outline"
						class="nav__icon"></ion-icon> <span class="nav_name">이 페이지
						나가기</span>
				</a>
			</div>
		</nav>
	</div>

	<div class="map_wrap" style="position: relative;">
		<div style="z-index: 9">
			<form class="searching" onsubmit="searchPlaces(); return false;">
				<input type="text" name="query" placeholder="우리집 주변의 ${menu}"
					id="keyword">
				<button class="search-btn">검색</button>
			</form>
		</div>
		<div id="map"
			style="width: 100%; height: 100%; position: fixed; left: 0; top: 0; margin: 0 auto; z-index: 1"></div>
		<div id="menu_wrap" class="bg_white">
			<div class="option"></div>
			<ul id="placesList"></ul>
			<div id="pagination"></div>
		</div>
		<div id="review"
			style="margin: 2px; overflow: auto; border: solid #20B2AA; float: left; display: block; width: 450px; height: 100%; position: relative; background-color: white; z-index: 1;">

			<hr />
			<div id="reviewcomment">
				<h5
					style="height: 23px; font-size: 20px; line-height: 24px; text-align: center; margin: 10px;">리뷰작성</h5>
				<div class="evaluation">
					<form id="evaluation" method="post" enctype="multipart/form-data"
						action="/review/writeOk">
						<input type="text" name="pid" id="pid">
						<fieldset>
							<input type="radio" name="star" value="5" id="rate1"><label
								for="rate1">⭐</label> <input type="radio" name="star" value="4"
								id="rate2"><label for="rate2">⭐</label> <input
								type="radio" name="star" value="3" id="rate3"><label
								for="rate3">⭐</label> <input type="radio" name="star" value="2"
								id="rate4"><label for="rate4">⭐</label> <input
								type="radio" name="star" value="1" id="rate5"><label
								for="rate5">⭐</label>
						</fieldset>

						<div style="text-align: center;">
							<textarea name="content" id='content' class="form-control"
								style="width: 100%; height: 80px;"></textarea>
							<input type="file" name="file" id="file" value="사진 업로드"
								style="margin: 3px" /> <input type="submit" value="리뷰 등록"
								class="btn btn-info" style="margin: 5px;" /> <input
								type="hidden" value="id" name="id" />

						</div>
					</form>
					<div class="container">

						<table class="table" id="reviewList">
							<caption class="blind">리뷰 목록으로 별점, 이미지, 내용, 작성자, 작성일자
								정보를 제공</caption>

							<thead>
								<tr style="text-align: center;">
									<th style="width: 15%;">이미지</th>
									<th style="width: 40%;">내용</th>
									<th style="width: 20%;">작성자</th>
									<th style="width: 20%;">작성일</th>
								</tr>
								<c:forEach var="vo" items="${list }">
									<td style="width: 15%;"><img
										src='/img/reviewimg/${vo.reviewimg }/' style="width:60px; height:60px"></td>
									<td style="width: 40%;"><i class="fa fa-star" style="color: red;"></i>${vo.star}<br>${vo.content}</td>
									<td style="width: 20%;">${vo.userid }</td>
									<td style="width: 20%;">${vo.writedate }</td>
									</tr>
								</c:forEach>
							</thead>

						</table>
						<div id="reviewListBody"></div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script>
		// 마커를 담을 배열입니다
		var markers = [];
		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new kakao.maps.LatLng(37.566826, 126.9786567), // 지도의 중심좌표
			level : 3
		// 지도의 확대 레벨
		};
		// 지도를 생성합니다    
		var map = new kakao.maps.Map(mapContainer, mapOption);
		// 장소 검색 객체를 생성합니다
		var ps = new kakao.maps.services.Places();
		var searchOption = {
			location : new kakao.maps.LatLng(37.564968, 126.939909),
			radius : 5000,
			size : 10
		};
		// 검색 결과 목록이나 마커를 클릭했을 때 장소명을 표출할 인포윈도우를 생성합니다
		var infowindow = new kakao.maps.InfoWindow({
			zIndex : 1
		});
		// 키워드로 장소를 검색합니다
		searchPlaces();

		// 키워드 검색을 요청하는 함수입니다
		function searchPlaces() {
			navigator.geolocation.getCurrentPosition(function(position) {
				var lat = position.coords.latitude, // 위도
				lon = position.coords.longitude; // 경도
				var locPosition = {
					location : new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
					radius : 5000,
					size : 10
				};
				// 마커와 인포윈도우를 표시합니다        
				var keyword = document.getElementById('keyword').value;
				// 장소검색 객체를 통해 키워드로 장소검색을 요청합니다
				ps.keywordSearch('${menu}', placesSearchCB, locPosition);
			});
		}
		// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
		function placesSearchCB(data, status, pagination) {
			if (status === kakao.maps.services.Status.OK) {
				// 정상적으로 검색이 완료됐으면
				// 검색 목록과 마커를 표출합니다
				displayPlaces(data);
				// 페이지 번호를 표출합니다
				displayPagination(pagination);
			} else if (status === kakao.maps.services.Status.ZERO_RESULT) {
				alert('검색 결과가 존재하지 않습니다.');
				return;
			} else if (status === kakao.maps.services.Status.ERROR) {
				alert('검색 결과 중 오류가 발생했습니다.');
				return;
			}
		}
		// 검색 결과 목록과 마커를 표출하는 함수입니다
		function displayPlaces(places) {
			var listEl = document.getElementById('placesList'), menuEl = document
					.getElementById('menu_wrap'), fragment = document
					.createDocumentFragment(), bounds = new kakao.maps.LatLngBounds(), listStr = '';
			// 검색 결과 목록에 추가된 항목들을 제거합니다
			removeAllChildNods(listEl);
			// 지도에 표시되고 있는 마커를 제거합니다
			removeMarker();
			for (var i = 0; i < places.length; i++) {
				// 마커를 생성하고 지도에 표시합니다
				var placePosition = new kakao.maps.LatLng(places[i].y,
						places[i].x), marker = addMarker(placePosition, i), itemEl = getListItem(
						i, places[i]); // 검색 결과 항목 Element를 생성합니다
				// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
				// LatLngBounds 객체에 좌표를 추가합니다
				bounds.extend(placePosition);
				// 마커와 검색결과 항목에 mouseover 했을때
				// 해당 장소에 인포윈도우에 장소명을 표시합니다
				// mouseout 했을 때는 인포윈도우를 닫습니다
				(function(marker, title) {
					kakao.maps.event.addListener(marker, 'mouseover',
							function() {
								displayInfowindow(marker, title);
							});
					kakao.maps.event.addListener(marker, 'mouseout',
							function() {
								infowindow.close();
							});
					itemEl.onmouseover = function() {
						displayInfowindow(marker, title);
					};
					itemEl.onmouseout = function() {
						infowindow.close();
					};
				})(marker, places[i].place_name);
				fragment.appendChild(itemEl);
			}
			// 검색결과 항목들을 검색결과 목록 Element에 추가합니다
			listEl.appendChild(fragment);
			menuEl.scrollTop = 0;
			// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
			map.setBounds(bounds);
			addplaces(places);
		}
		// 검색결과 항목을 Element로 반환하는 함수입니다
		// 음식점 이름 클릭시 마커로 이동하는것도 좋을듯?
		// 마커 클릭시 마커 모양 변화 주기?

		function addplaces(places) {

			$.ajax({
				type : 'post',
				url : '/map/addplace',
				contentType : 'application/json; charset=UTF-8',
				data : JSON.stringify(places),
				success : function(res) {
				},
				error : function(e) {
					alert(e.responseText);
				}
			});
		}
		function getListItem(index, places) {
			var el = document.createElement('li'), itemStr = '<span class="markerbg marker_'
					+ (index + 1)
					+ '"></span>'
					+ '<div class="info">'
					+ '   <h5>'
					+ places.place_name
					+ '</h5>' //음식점과 마커 링크 하기               
					+ '<div> 4.3 | '
					+ '<input type="button" value="리뷰" onclick="toggleDiv('
					+ places.id + ')">' + "123" + "건" + '</input>' + '</div>'; //DB에서 별점평균, 리뷰 수 가져오기 + 별모양 css 만들기 
			if (places.road_address_name) {
				itemStr += '    <span>' + places.road_address_name + '</span>'
						+ '   <span class="jibun gray">' + places.address_name
						+ '</span>';
			} else {
				itemStr += '    <span>' + places.address_name + '</span>';
			}
			itemStr += '  <span class="tel">' + places.phone + '</span>'
					+ '</div>';
			el.innerHTML = itemStr;
			el.className = 'item';
			return el;
		}

		function toggleDiv(id) {
			const div = document.getElementById('review');
			$('#pid').val(id);
			if (div.style.display === 'block') {
				div.style.display = 'none';
			} else {
				div.style.display = 'block';
				reviewListAll(id);
			}

		}

		// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
		function addMarker(position, idx, title) {
			var imageSrc = 'https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/marker_number_blue.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
			imageSize = new kakao.maps.Size(36, 37), // 마커 이미지의 크기
			imgOptions = {
				spriteSize : new kakao.maps.Size(36, 691), // 스프라이트 이미지의 크기
				spriteOrigin : new kakao.maps.Point(0, (idx * 46) + 10), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
				offset : new kakao.maps.Point(13, 37)
			// 마커 좌표에 일치시킬 이미지 내에서의 좌표
			}, markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize,
					imgOptions), marker = new kakao.maps.Marker({
				position : position, // 마커의 위치
				image : markerImage
			});
			marker.setMap(map); // 지도 위에 마커를 표출합니다
			markers.push(marker); // 배열에 생성된 마커를 추가합니다
			return marker;
		}
		// 지도 위에 표시되고 있는 마커를 모두 제거합니다
		function removeMarker() {
			for (var i = 0; i < markers.length; i++) {
				markers[i].setMap(null);
			}
			markers = [];
		}
		// 검색결과 목록 하단에 페이지번호를 표시는 함수입니다
		function displayPagination(pagination) {
			var paginationEl = document.getElementById('pagination'), fragment = document
					.createDocumentFragment(), i;
			// 기존에 추가된 페이지번호를 삭제합니다
			while (paginationEl.hasChildNodes()) {
				paginationEl.removeChild(paginationEl.lastChild);
			}
			for (i = 1; i <= pagination.last; i++) {
				var el = document.createElement('a');
				el.href = "#";
				el.innerHTML = i;
				if (i === pagination.current) {
					el.className = 'on';
				} else {
					el.onclick = (function(i) {
						return function() {
							pagination.gotoPage(i);
						}
					})(i);
				}
				fragment.appendChild(el);
			}
			paginationEl.appendChild(fragment);
		}
		// 검색결과 목록 또는 마커를 클릭했을 때 호출되는 함수입니다
		// 인포윈도우에 장소명을 표시합니다
		function displayInfowindow(marker, title) {
			var content = '<div style="padding:5px;z-index:1;">' + title
					+ '</div>';
			infowindow.setContent(content);
			infowindow.open(map, marker);
		}
		// 검색결과 목록의 자식 Element를 제거하는 함수입니다
		function removeAllChildNods(el) {
			while (el.hasChildNodes()) {
				el.removeChild(el.lastChild);
			}
		}
	</script>

	<!-- IONICONS -->
	<script src="https://unpkg.com/ionicons@5.2.3/dist/ionicons.js"></script>
	<!-- JS -->
	<script src="../js/map.js"></script>
</body>
</html>