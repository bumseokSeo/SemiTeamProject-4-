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
		
	
	}
	#memberlst{
		
		border: 1px solid gray;
		width:670px;
		margin-right:60px;
		float:left;
		height:1000px;
		overflow:auto;
		
		
	
	}
	#reviewlst{
		border: 1px solid gray;
		width:670px;
		float:left;
		height:1000px;
		overflow:auto;
		
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
	}
	.memberul>li:nth-child(5n+4) {
		width: 15%;
	}
	.memberul>li:last-of-type {
		padding-top: 4px;
		width: 15%;
	}

	
</style>
<script>
$(function(){
	
	function memberListAll(){
		var url = "${url}/member/memberListAll";
		
		$.ajax({
			url:url,
			data:null,
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
						
					tag +="<li><button type='button' onclick='delCheck()' class='btn btn-danger' id='delbtn'>회원탈퇴</button></li></ul></form>";
				});
				$("#d1").html(tag);
			},
			error:function(e){
				console.log(e.resopnseText);
			}
		});
	}
	memberListAll();
});
</script>
<h1>관리자 페이지</h1>
<div id="master">
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