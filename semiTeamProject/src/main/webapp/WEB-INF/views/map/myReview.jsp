<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	@font-face {
	   font-family: 'Cafe24Simplehae';
	   src:
	      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Simplehae.woff')
	      format('woff');
	   font-weight: normal;
	   font-style: normal;
	}
	
	* {
		box-sizing: border-box;
	}
	
	body {
		background: url(${url}/img/mainbackG.png) center center no-repeat;
		background-size: cover;
		background-attachment: fixed;
		font-family: 'Cafe24Simplehae';
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
	#myreview{
		width:1130px;
		height:1100px;
		padding:49px;
		overflow:hidden;
		margin: 0 auto;
	    background-color: rgba( 255, 255, 255, 0.4 );
	    border: 1px solid #bdbdbd;
	    border-radius: 5px;
	    -webkit-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	   -moz-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	   box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);		
	}		
	}
	#myreview2{	
		border: 1px solid gray;
		width:1030px;
		height:1000px;
		overflow:auto;
	}
	.reviewul{
		overflow:hidden;
		width:100%;
		height:60px;
		text-align:center;
		border-bottom: 1px solid black;
		font-weight: 700;
	}
	.reviewul>li{
		padding-top: 20px;
		float: left;
		width:12%;
	}
	.reviewul>li:nth-child(6n+5) {
		padding-top: 0px;
	}
	
	.reviewul>li:nth-child(6n+1) {
		width:15%;
		white-space:nowrap; /*줄 안바꿈*/
      	overflow : hidden; /*넘친 내용 숨기기 */
      	text-overflow : ellipsis/* 넘친텍스트 ...처리 */
	}
	.reviewul>li:nth-child(6n+2) {/*리뷰내용부분*/
		width:39%;
		white-space:nowrap; /*줄 안바꿈*/
      	overflow : hidden; /*넘친 내용 숨기기 */
      	text-overflow : ellipsis;/* 넘친텍스트 ...처리 */
      	padding-left: 15px;
	}
	.reviewul>li:last-of-type {
		width: 9%;
		padding: 10px;
	}
	#reviewimg{
		width:60px;
		height:60px;
	}
	
	/*모달css*/
	.modal {
	display: none;
	z-index: 500;
	width: 100%;
	height: 100vh;
	position: fixed;
	top: 0;
	left: 0;
	background-color: rgba(0, 0, 0, 0.3);
}

.modal button {
	position: absolute;
	top: 3rem;
	right: 3rem;
	background: transparent;
	border: 0;
	color: #ffffff;
	font-size: 3rem;
}

.modalBox {
	position: relative;
	top: 20%;
	left: 50%;
	transform: translate(-50%, -20%);
	background-color: #ffffff;
	width: 40%;
	height: 40%;
	text-align: center;
}

.modalBox img {
	width: 100%;
}

.modalBox p {
	color: #ffffff;
	background-color: #000;
	font-size: 2rem;
	padding: .2rem;
}
</style>
<script>
$(function(){
	

	
	function myReviewListAll(){
		var url = "${url}/map/myReviewListAll";
		var params = "userid=${logId}";
		$.ajax({
			url:url,
			data:params,
			success:function(result){
				
				var $result = $(result);
				var tag = "";
				
				$result.each(function(index, vo){
					tag += "<form method='post' id='memberform'>";
					tag +="<ul class='reviewul'>";
					tag +="<li>"+vo.place_name+"</li><li>"+vo.content+"</li><li><i class='fa fa-star' style='color: red;'></i>"+vo.star+"</li>";
					if(vo.modifydate=='' || vo.modifydate==null){
						tag +="<li>"+vo.writedate+"</li>";
					}
					if(vo.modifydate!='' && vo.modifydate!=null){
						tag +="<li>"+vo.modifydate+"</li>";
					}
					
					if(vo.reviewimg=='' || vo.reviewimg==null){
						tag +="<li style='padding-top:20px;'>없음</li>";
					}
					if(vo.reviewimg!='' && vo.reviewimg!=null){
						tag +="<li><div class='imgC'><img alt='크게보기' id='reviewimg' src='${url}/img/reviewimg/"+vo.reviewimg+"'></div></li>";
					}
					
						
					tag +="<li><input type='button' value='리뷰삭제' title='"+vo.reviewno+"'class='btn btn-danger' id='delbtn'></input></li></ul></form>";
				});
				$("#d1").html(tag);
			},
			error:function(e){
				console.log(e.resopnseText);
			}
		});
	}
	
	$(document).on('click','#memberform input[value=리뷰삭제]',function(){
		
		if(confirm('삭제하겠습니까?')){
			var params = "reviewno="+$(this).attr("title");
			$.ajax({
				url:'${url}/map/myreviewDeleteOk',
				data:params,
				
				success:function(result){
					myReviewListAll();
				},
				error:function(e){
					console.log(e.resopnseText);
				}
			});
		}
	});
	
	
	$(document).on('click','.imgC',function(){
		console.log("모달클릭");
		$(".modal").show();
		// 해당 이미지 가겨오기
		var imgSrc = $(this).children("img").attr("src");
		var imgAlt = $(this).children("img").attr("alt");
		$(".modalBox img").attr("src", imgSrc);
		$(".modalBox img").attr("alt", imgAlt);
		
		// 해당 이미지 텍스트 가져오기
		//var imgTit =  $(this).children("p").text();
		//$(".modalBox p").text(imgTit);
		
   // 해당 이미지에 alt값을 가져와 제목으로
		$(".modalBox p").text(imgAlt);
	});
	
	//.modal안에 button을 클릭하면 .modal닫기
	$(".modal button").click(function(){
		$(".modal").hide();
	});
	
	//.modal밖에 클릭시 닫힘
	$(".modal").click(function (e) {
    if (e.target.className != "modal") {
      return false;
    } else {
      $(".modal").hide();
    }
  });
	myReviewListAll();
});
</script>
<h1>나의 지난 리뷰</h1>
<div id="myreview">
    <div id="myreview2">
    	<ul class="reviewul">
    		<li>가게 이름</li>
			<li>리뷰 내용</li>
			<li>별점</li>
			<li>작성일</li>
			<li style="padding-top: 20px;">이미지</li>
			<li></li>
		</ul>
    	<div id="d1">
    	</div>
    </div>
</div>
	<!-- 팝업 될 곳 -->
	<div class="modal">
		<button>&times;</button>
		<div class="modalBox">
			<img src="" alt="">
			<p></p>
		</div>
	</div>
</body>
</html>