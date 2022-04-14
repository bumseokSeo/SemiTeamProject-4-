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
	#master{
		border: 1px solid gray;
		width:1500px;
		height:1100px;
		padding:49px;
		overflow:hidden;
		margin: 0 auto;
		margin-bottom: 100px;
	}
	#memberlst{
		position:relative;
		border: 1px solid gray;
		width:670px;
		margin-right:60px;
		float:left;
		height:900px;
		overflow:auto;
		top:-120px;
	}
	#reviewlst{
		position:relative;
		border: 1px solid gray;
		width:670px;
		float:left;
		height:900px;
		overflow:auto;
		top:-120px;
	}
	#reviewsearch{
		width:670px;
		height:80px;
		left:730px;
		top:-111px;
		position:relative;
		margin-bottom:30px;
		border : 1px solid gray;
		padding:20px;
		
	}
	
	.memberul{
		overflow:hidden;
		width:100%;
		height:50px;
		text-align:center;
		border-bottom: 1px solid black;
	}
	.memberul>li{
		padding-top: 10px;
		float: left;
		width:19%;
	}
	.memberul>li:nth-child(5n+3) {
		width: 25%;
		white-space:nowrap; /*줄 안바꿈*/
      	overflow : hidden; /*넘친 내용 숨기기 */
      	text-overflow : ellipsis/* */
	}
	.memberul>li:nth-child(5n+4) {
		width: 15%;
	}
	.memberul>li:last-of-type {
		padding-top: 4px;
		width: 15%;
	}
	
	#search{
		width:670px;
		height:80px;
		position:relative;
		margin-bottom:30px;
		border : 1px solid gray;
		padding:20px;
		padding-left: 120px;
	}
	#searchWord{
		width:300px;
		height:40px;
		float:left;
		margin-left: 20px;
		margin-right: 20px;
	}
	#searchIcon{
		width:40px;
		height:40px;
		float:left;
		
	}
	#searchBtn{
		float:left;
	}

	
</style>
<script>
$(function(){
	var search="";
	function memberListAll(){
		var url = "${url}/member/memberListAll";


		$.ajax({
			url:url,
			data:search,
			success:function(result){
				var $result = $(result);
				var tag = "";
				
				$result.each(function(index, vo){
					tag += "<form method='post' id='memberform'>";
					tag +="<ul class='memberul'>";
					tag +="<li>"+vo.userid+"</li><li>"+vo.username+"</li><li>"+vo.email+"</li>";
					if(vo.sex=='f'){
						tag +="<li>여성</li>";
					}
					if(vo.sex=='m'){
						tag +="<li>남성</li>";
					}
						
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
	
	$("#searchFrm").submit(function(){
		event.preventDefault();
	    search="searchword="+$('#searchWord').val();
	    memberListAll();
	 });
	memberListAll();
});

</script>
<h1>관리자 페이지</h1>
<div id="master">
	<div id="search">
      <form method="get" action="" id="searchFrm">
         <img alt="" src="${url}/img/search.png" id="searchIcon" >
         <input type="text" name="searchWord" id="searchWord" placeholder="아이디로 검색" class="form-control form-control-lg"/>
         <input type="submit" value="검색" class="btn btn-info" id="searchBtn">
      </form>
   </div>
   <div id="reviewsearch">
   
   </div>
    <div id="memberlst">
    	<ul class="memberul">
    		<li>아이디</li>
			<li>닉네임</li>
			<li>이메일</li>
			<li>성별</li>
			<li></li>
		</ul>
    	<div id="d1">
    	</div>
    </div>
    
    <div id="reviewlst">
    
    </div>
    
</div>

</body>
</html>