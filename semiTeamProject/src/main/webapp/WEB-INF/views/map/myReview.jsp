<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<style>
	body {
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
		
		border: 1px solid gray;
		width:1130px;
		height:1100px;
		padding:49px;
		overflow:hidden;
		margin: 0 auto;
		
	
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
		height:50px;
		text-align:center;
		
		
		border-bottom: 1px solid black;
	}
	.reviewul>li{
		padding-top: 10px;
		float: left;
		width:18%;
	}/*
	.reviewul>li:nth-child(5n+3) {
		width: 25%;
	}
	.reviewul>li:nth-child(5n+4) {
		width: 15%;
	}*/
	.reviewul>li:last-of-type {
		
		width: 9%;
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
					tag +="<li>"+vo.placeid+"</li><li>"+vo.content+"</li><li>"+vo.star+"</li>";
					tag +="<li>"+vo.writedate+"</li><li>"+vo.reviewimg+"</li>";
						
					tag +="<li><input type='button' value='회원탈퇴' title='"+vo.userid+"'class='btn btn-danger' id='delbtn'></input></li></ul></form>";
				});
				$("#d1").html(tag);
			},
			error:function(e){
				console.log(e.resopnseText);
			}
		});
	}
	
	$(document).on('click','#memberform input[value=회원탈퇴]',function(){
		
		if(confirm('탈퇴처리 시키겠습니까?')){
			var params = "userid="+$(this).attr("title");
			$.ajax({
				url:'${url}/member/memberDeleteOk',
				data:params,
				success:function(result){
					memberListAll();
				},
				error:function(e){
					console.log(e.resopnseText);
				}
			});
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
			<li>이미지</li>
		</ul>
    	<div id="d1">
    	</div>
    </div>
    
    
</div>

</body>
</html>