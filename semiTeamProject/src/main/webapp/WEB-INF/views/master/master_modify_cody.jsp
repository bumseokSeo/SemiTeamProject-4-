<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>


<script>
//arrow updown
	$(function() {
	    $(window).scroll(function() {
	        if ($(this).scrollTop() > 600) {
	            $('.ScrollButton').fadeIn();
	        } else {
	            $('.ScrollButton').fadeOut();
	        }
	    });
	        
	    $("#TopButton").click(function() {
	        $('html').animate({scrollTop : 0}, 600);
	    });
	 
	    $("#BottomButton").click(function() {
	        $('html, body').animate({scrollTop : ($(document).height())}, 600);
	    });
	});
</script>

<style>
@import url('https://cdn.rawgit.com/moonspam/NanumSquare/master/nanumsquare.css');

*{
  box-sizing: border-box;

}

 a {color: black;  text-decoration: none;}
 a:link { text-decoration: none;}
 a:visited { text-decoration: none;}
 a:hover { color: black; text-decoration: none;}

body {
  font-family: 'NanumSquare',san-serif;
  margin: 0;
  padding: 0;
}

h1 {
  margin-bottom: 25px;
}

.main-container {
  width: 1300px;
  height: 100%;
  margin:0 auto;
  position: relative;
}

.menu-category {
  float: left;
  width: 10%;
  display: flex;
  flex-direction: column;
  font-size: 24px;
  font-weight: 800;
  margin-top: 8px;
}

.img-container {
  float: right;
  width: 90%;
  height: 100%;

}


.menu-category>a {
  margin: 16px;
}


.img-category {
  display: flex;
  justify-content: center;
  font-weight: 800;
}

.img-category-link {
  margin-left:140px;
  font-size: 24px;
}

.imgC>img {
  width: 250px;
  height: 250px;
  
}

.imgList-row {
  display: flex;
  justify-content: space-around;
  margin-top: 30px;
}

.imgC p {
  text-align: end;
  color:gray;
  margin-top: 5px;
}

.ScrollButton {
  position: fixed;   
  right: 10px;       
  cursor: pointer;   
  z-index: 10;  
  font-size: 20px;
  color: #4d4d4d;     
  display: none;
  right: 24px;
}

#TopButton {

  bottom: 75px;        
}
#BottomButton {

  bottom: 50px;
}


</style>

      <h1>코디 수정페이지</h1><hr/>
        <div class="img-category">
        <a href="#">
          <div class="img-category-link all">ALL</div>
        </a>
        <a href="#">
          <div class="img-category-link men">MEN</div>
        </a>
        <a href="#">
          <div class="img-category-link women">WOMEN</div>
        </a>
        </div>
   <div class="main-container">

      <div class="menu-category">
        <a href="${url}/master/master_modify_cody"> 코디수정 </a>
        <a href="${url}/master/master_add_cody"> 코디추가 </a>
      </div>

      <div class="img-container">

        <section>
        	<div class="imgList">
  			<c:forEach var="i" begin="1" end="${len}">
	  			<div class="imgList-row">
		  			<c:forEach var="j" begin="${3*i-3}" end="${3*i-1}">
						<div class="imgC">
							<c:if test="${vo[j]!=null}">
				    			<img src="${url}/img/codyimg/codyupload/${vo[j].cname}" alt="모달할 이미지" class="Cimg">
				    			<p>
				    				<a href="${url}/master/master_modify_form?cname=${vo[j].cname}" class="modify">수정</a> /  
                 					<a href="javascript:void(0);">삭제</a>
                 				</p>
				    		</c:if>
				    		<c:if test="${vo[j]==null}">	<!-- 자리 채울 이미지 -->
				    			<img src="${url}/img/codyimg/none.jpg">
			    			</c:if>
			    		</div>
		    		</c:forEach>
		  		</div>
  			</c:forEach>
  			</div>
        </section>

      </div>
    </div>
    <!-- arrow updown -->
	<a id="TopButton" class="ScrollButton">
		<i class="fa-solid fa-arrow-up"></i>
	</a>
	<a id="BottomButton" class="ScrollButton">
		<i class="fa-solid fa-arrow-down"></i>
	</a>
   
    
  </body>
</html>