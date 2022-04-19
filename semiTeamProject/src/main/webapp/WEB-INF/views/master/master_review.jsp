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
		position: relative;
		margin: 0 auto;
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
	
	a:link, a:visited {
		text-decoration: none;
		color: black;
	}
	h1{
      margin-right:100px;
      font-size: 40px;
      text-align: center;
      margin-bottom: 50px;
   }
   a:hover {
   		text-decoration: underline;
   }
   
   /*전체적인틀*//*전체적인틀*//*전체적인틀*//*전체적인틀*//*전체적인틀*//*전체적인틀*//*전체적인틀*/
	#otherMasterPage{
	    display: flex;
	    justify-content: space-around;
		width:1150px;
		margin: 0 auto;
		margin-top: 30px;
		font-size: 1.5em;	
		font-weight: 700;
	}
	
	#master{
		width:1500px;
		height:1100px;
		padding:49px;
		overflow:hidden;
		margin: 0 auto;
		margin-top: 30px;
		margin-bottom: 100px;
	    border: 1px solid #bdbdbd;
	    border-radius: 5px;
	    -webkit-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	   -moz-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	    box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);			
	}

	
	#reviewlst{
	    border: 1px solid #bdbdbd;
	    border-radius: 5px;
		width:670px;
		margin: 0 auto;
		height:920px;
		overflow:auto;
		
	}
	#reviewsearch{
		width:670px;
		height:80px;
		margin: 0 auto;
		margin-bottom:30px;
	    border: 1px solid #bdbdbd;
	    border-radius: 5px;
		padding:20px;
		padding-left: 120px;
		
	}
	/*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*//*ul li*/
	
	
	.reviewul{
		overflow:hidden;
		width:100%;
		height:80px;
		text-align:center;
		border-bottom: 1px solid #bdbdbd;
		font-weight: 600;
	}
	.reviewul>li{
		padding-top: 30px;
		float: left;
		width:15%;
		
	}
	.reviewul>li:nth-child(5n+5) {
		width: 25%;
		padding:3px;
		overflow: hidden;
		text-overflow : ellipsis;/* 넘친내용...*/
      	
      	
	}
	.reviewul>li:last-of-type {
		width:9%;
		padding-top: 20px;
	}

	
	#searchword{
		width:300px;
		height:40px;
		float:left;
		margin-left: 20px;
		margin-right: 20px;
	}
	.searchIcon{
		width:40px;
		height:40px;
		float:left;
		
	}
	
	#searchBtn2{
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

	
</style>
<script>

function delreviewOk(reviewno){
	if(confirm('해당 리뷰를 삭제하시겠습니까?')){
		location.href='/map/reviewDeleteOk?reviewno='+reviewno;
	}
	return false;
			
}

</script>
<h1>리뷰관리 페이지</h1><hr/>
<div id="otherMasterPage">
	<a href="${url}/master/master_modify_cody">코디 관리</a>
	<a href="/master/master_food">음식 관리</a>
	<a href="/member/masterPage">유저 관리</a>
</div>
<div id="master">
	
   <div id="reviewsearch">
   		 <form method="get" action="${url}/map/master_review" id="searchFrm2">
         	<img alt="" src="${url}/img/search.png" class="searchIcon" >
         	<input type="text" name="searchword" id="searchword" placeholder="아이디로 검색" class="form-control form-control-lg"/>
         	<input type="submit" value="검색" class="btn btn-info" id="searchBtn2">
         </form>
   
   </div>
    <div id="reviewlst">
    	<ul class="reviewul">
    		<li>가게 id</li>
			<li>유저 id</li>
			<li>작성일</li>
			<li>별점</li>
			<li style="padding-top: 30px;">글내용</li>
			<li></li>
		</ul>
    	<div id="d2">
    		<c:forEach var="vo" items="${list}">
	         		<ul class='reviewul'>
		            
			            <li>${vo.id}</li>
			            <li>${vo.userid}</li>
			            <c:if test="${vo.modifydate=='' || vo.modifydate==null}">
			            	<li>${vo.writedate}</li>
			            </c:if>
			            <c:if test="${vo.modifydate!='' && vo.modifydate!=null}">
			            	<li>${vo.modifydate}</li>
			            </c:if>
			            <li>${vo.star}</li>
			            <li>${vo.content}</li>
			            <li><input type='button' onclick='delreviewOk("${vo.reviewno}")' value='리뷰삭제' class='btn btn-danger delbtn'/></li>
			            
	         		</ul>
        	</c:forEach>
        	<ul class="paging">
      
			      <!-- 이전 페이지 -->
			      <c:if test="${pVO.pageNum==1}">
			         <li>prev</li>
			      </c:if>
			      <c:if test="${pVO.pageNum>1}">
			         <li><a href="${url}/map/master_review?pageNum=${pVO.pageNum-1}<c:if test='${pVO.searchword!=null}'>&searchword=${pVO.searchword}</c:if>">prev</a></li>
			      </c:if>
			      
			      <!-- 페이지 번호          1   ~5, 6  ~10, 11   ~15      -->
			      <c:forEach var="p" begin="${pVO.startPage}" end="${pVO.startPage + pVO.onePageCount -1}">
			         <!-- 총 페이지수보다 출력할 페이지 번호가 작을 때 -->
			         <c:if test="${p<=pVO.totalPage}">
			            <c:if test="${p==pVO.pageNum}">
			               <li><a style="color:red;" href="${url}/map/master_review?pageNum=${p}<c:if test='${pVO.searchword!=null}'>&searchword=${pVO.searchword}</c:if>">${p}
			            </c:if>
			            <c:if test="${p!=pVO.pageNum }">
			               <li><a href="${url}/map/master_review?pageNum=${p}<c:if test='${pVO.searchword!=null}'>&searchword=${pVO.searchword}</c:if>">${p}
			            </c:if>
			           </a></li>
			         </c:if>
			      </c:forEach>
			      <!-- 다음 페이지 -->
			      <c:if test="${pVO.pageNum==pVO.totalPage}">
			         <li>next</li>
			      </c:if>
			      <c:if test="${pVO.pageNum<pVO.totalPage}">
			         <li><a href="${url}/map/master_review?pageNum=${pVO.pageNum+1}<c:if test='${pVO.searchword!=null}'>&searchword=${pVO.searchword}</c:if>">next</a></li>
			      </c:if>
   
   			</ul>
    	</div>
    
    </div>
    
</div>

</body>
</html>