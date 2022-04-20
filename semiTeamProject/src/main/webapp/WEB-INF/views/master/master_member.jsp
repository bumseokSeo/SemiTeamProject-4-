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
		font-size: 1.1em;
	}
	
	a:link, a:visited {
		text-decoration: none;
		color: black;
	}
	h1{
      font-size: 40px;
      text-align: center;
      margin-bottom: 50px;
   }
   a:hover {
   		text-decoration: none;
   }
   
   /*전체적인틀*//*전체적인틀*//*전체적인틀*//*전체적인틀*//*전체적인틀*//*전체적인틀*//*전체적인틀*/
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
	#otherMasterPage a:nth-child(1){
		color: #5584AC;
	}

.master-container {
		width:1300px;
		position: relative;
		left: -84px;
		margin: 0 auto;
		margin-top: 30px;	
}	

	#master{
		width:1150px;
		padding:49px;
		overflow:hidden;
		margin: 0 auto;
		margin-top: 30px;
		margin-bottom: 100px;
	    background-color: rgba( 255, 255, 255, 0.4 );
	    border: 1px solid #bdbdbd;
	    border-radius: 5px;
	    -webkit-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	   -moz-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	   box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);	
	   float: right;	
	}
	#memberlst{
		position:relative;
		margin: 0 auto;
		border: 1px solid gray;
		width:1000px;
		overflow:auto;
		/*top:-120px;*/
		border: 1px solid #bdbdbd;
 	    border-radius: 5px;	
 	    margin-bottom:30px;
	}
	#search{
		width:1000px;
		height:80px;
		position:relative;
		margin: auto;
 	    border-radius: 5px;		
		padding:20px;
		padding-left: 120px;
	}
	#searchFrm{
		margin:0 auto;
		float:right;
	}
	
	
	/*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*/
	
	.memberul{
		overflow:hidden;
		width:100%;
		height:50px;
		text-align:center;
		border-bottom: 1px solid #bdbdbd;
		font-weight: 600;
	}
	
	.memberul>li{
		padding-top: 10px;
		float: left;
		width:19%;
		overflow : hidden;
	}
	.memberul>li:nth-child(5n+3) {
		width: 25%;
		white-space:nowrap; /*줄 안바꿈*/
      	overflow : hidden; /*넘친 내용 숨기기 */
      	text-overflow : ellipsis;/* */
      	
	}
	
	.memberul>li:last-of-type {
		padding-top: 4px;
		padding-left: 10px;
		width: 16%;
	}
	
	#searchword{
		width:300px;
		height:40px;
		float:left;
		margin-left: 10px;
		margin-right: 20px;
	}
	
	.searchIcon{
		width:40px;
		height:40px;
		float:left;
		
	}
	#searchBtn{
		float:left;
	}
	
	.paging>li{
	display: inline-block;
	margin-right: 12px;

   }
   .paging{
	text-align: center;
	height: 40px;
	line-height: 40px;
   }

.sidenav {
   position:absolute;
   left: -5px;
   height:100%; 

}

.sidenav .mainnav {
   display:flex;
   flex-direction: column;
   list-style-type: none;
   margin: 38px 0;
   color: #534439;
}

.sidenav .mainnav li {
  letter-spacing: 1px;
  font-size: 24px;
  font-weight: 600;
  margin-bottom: 18px;
}

.sidenav .mainnav>li {
  padding: 16px 0px;
}

.sidenav .mainnav>a>li:hover, 
.sidenav .mainnav>a>li:active,
.sidenav .mainnav>a>li:focus {
  cursor: pointer;
  color: #5584AC;
}

.sidenav .mainnav>a:nth-child(1){
	color: #5584AC;
}	    

	
</style>
<script>
function delMemberOk(userid){
	if(confirm('해당 회원을 탈퇴시키겠습니까?')){
		location.href='/member/memberDeleteOk?userid='+userid;
	}	
	return false;
}

</script>
<h1>Manager Page</h1><hr/>
<div id="otherMasterPage">
	<a href="/member/masterPage">회원 관리</a>
	<a href="/master/master_modify_cody">코디 관리</a>
	<a href="/master/master_food">음식 관리</a>
</div>	

<div class="master-container">
	<nav class="sidenav">
		<ul class="mainnav"> 
			<a href="${url}/member/masterPage"><li>계정 관리</li></a>
		    <a href="${url}/map/master_review"><li>리뷰 관리</li></a>
		</ul>
	</nav>
<div id="master">

	<div id="search">
      <form method="get" action="${url}/member/masterPage" id="searchFrm">
         <img alt="" src="${url}/img/search.png" class="searchIcon" >
         <input type="text" name="searchword" id="searchword" placeholder="아이디로 검색" class="form-control form-control-lg"/>
         <input type="submit" value="검색" class="btn btn-info" id="searchBtn">
      </form>
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
    		<c:forEach var="vo" items="${list}">
	         		<ul class='memberul'>
		            
			            <li>${vo.userid}</li>
			            <li>${vo.username}</li>
			            <li>${vo.email}</li>
			            <c:if test="${vo.sex=='f' }">
			            	<li>여성</li>
			            </c:if>
			            <c:if test="${vo.sex=='m' }">
			            	<li>남성</li>
			            </c:if>
			            <li><input type='button' onclick='delMemberOk("${vo.userid}")' value='회원탈퇴' class='btn btn-danger delbtn'/></li>
			            
	         		</ul>
        	</c:forEach>
        	<ul class="paging">
      
			      <!-- 이전 페이지 -->
			      <c:if test="${pVO.pageNum==1}">
			         <li>prev</li>
			      </c:if>
			      <c:if test="${pVO.pageNum>1}">
			         <li><a href="${url}/member/masterPage?pageNum=${pVO.pageNum-1}<c:if test='${pVO.searchword!=null}'>&searchword=${pVO.searchword}</c:if>">prev</a></li>
			      </c:if>
			      
			      <!-- 페이지 번호          1   ~5, 6  ~10, 11   ~15      -->
			      <c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage + pVO.onePageCount -1}">
			         <!-- 총 페이지수보다 출력할 페이지 번호가 작을 때 -->
			         <c:if test="${p<=pVO.totalPage}">
			            <c:if test="${p==pVO.pageNum}">
			               <li><a style="color:red;" href="${url}/member/masterPage?pageNum=${p}<c:if test='${pVO.searchword!=null}'>&searchword=${pVO.searchword}</c:if>">${p}
			            </c:if>
			            <c:if test="${p!=pVO.pageNum }">
			               <li><a href="${url}/member/masterPage?pageNum=${p}<c:if test='${pVO.searchword!=null}'>&searchword=${pVO.searchword}</c:if>">${p}
			            </c:if>
			           </a></li>
			         </c:if>
			      </c:forEach>
			      <!-- 다음 페이지 -->
			      <c:if test="${pVO.pageNum==pVO.totalPage}">
			         <li>next</li>
			      </c:if>
			      <c:if test="${pVO.pageNum<pVO.totalPage}">
			         <li><a href="${url}/member/masterPage?pageNum=${pVO.pageNum+1}<c:if test='${pVO.searchword!=null}'>&searchword=${pVO.searchword}</c:if>">next</a></li>
			      </c:if>
   
   			</ul>
    	</div>
    </div>
    
    
    
</div>
</div>
</body>
</html>