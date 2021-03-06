<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
<script src = "https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    
<style>
	@font-face {
	   font-family: 'Cafe24Simplehae';
	   src:
	      url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_twelve@1.1/Cafe24Simplehae.woff')
	      format('woff');
	   font-weight: normal;
	   font-style: normal;
	}
	
	body {
		background: url(${url}/img/mainbackG.png) center center no-repeat;
		background-size: cover;
		background-attachment: fixed;
		font-family: 'Cafe24Simplehae';
	}


     ul, li{
           list-style-type: none;
           margin: 0;
           padding: 0;
   
       }
     .container{
          width: 1300px;
          height: 100%;
     }
     h1 {
           margin-bottom: 50px;
      }
      a{
          text-decoration: none;
          color: black;
      }
      a:hover{
         text-decoration: none;
         color:black;
      }
      input[type=button] { 
           background: rgb(108, 109, 105);
           border: none;
           border-radius : 10px;
      }
      #foodForm{
            width : 100%;
      }
      
      #adminForm{
         width: 68%;
         padding: 50px;
         margin: 0 auto;
         margin-top: 30px;
	     background-color: rgba( 255, 255, 255, 0.4 );
	     border: 1px solid #bdbdbd;
	     border-radius: 5px;
	    -webkit-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
	    -moz-box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
    	 box-shadow: 10px 10px 5px 0px rgba(189,189,189,1);
    	 margin-bottom: 30px;
      }
      #deleteDate{
          text-decoration: none;
          color: midnightblue;
      }
      #deleteDate:hover{
          color: gray;
      }
      #eventSelected{
          font-size: 17px;
          text-align: center;
          font-weight: bold;
      }
      #eventYes{
            color: blue;
            display : none;
      }
    
      #priorityForm{
          display: none;
      }
      #foodPhoto{
            width : 80%;
            height : 50%;
            margin: 0 auto;
      }
      #buttons input[type=button]{
			width: 122px;
  			height: 48px;
  			margin: 20px 30px 0 30px;
  			
      }
      
      #cancel{
      	background: red;
      }
      
      #foodList{
           width: 120px;
           height: 50px;
           margin-bottom: 30px;
           margin-left: 20px;
           border: none;
      }
      #alertDate{
          display: none;
          color: blueviolet;
      }
      .day{
          display: none;
      }
      
      #photoDelete{
            display: none;
      }
      #foodimgName{
            color : gray;
      }
     
       #modalFood{
           justify-content: center;
           align-items: center;
           overflow-y: auto;
       }
       #modalFood .modal-dialog{
           overflow-y: initial !important;
       }
       #modalFood .modal-title{
           margin: 10px 30px;
       }
       #modalFood .modal-body{
           overflow-y: auto;
           height: 100%;
           margin-bottom:30px;
       }
       #foodCategory{
        width: 100%;
        margin-top:20px;
        text-align: center;
        height : 60px;
        font-size: 20px;
        
       }
      #foodCategory ul{
            text-align: center;
            display: flex;
            flex-flow: row nowrap;
            justify-content:space-around;
            width: 100%;
       }
       #foodAll{
             margin: 20px;
       }
       #foods{
             background: yellow;
       }
       .eachFood{
           width: 25%;
           float: left;
           text-align: center;
           margin-bottom: 30px;       
       }
       .foodName{
           font-weight: bold;
           font-size:17px;
       }
       .foodPicture{
           width:150px !important;
           border-radius: 20px;
           object-fit:cover;
           height: 150px;
           max-width: 100%;
       }
       
       #otherPageLink{
	      text-align: center;
	      font-size: 20px;
	   }
   
	label {
		font-weight: 700;
	}
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
	#otherMasterPage a:nth-child(3){
		color: #5584AC;
	}
      
</style>
<script>
    $(function(){
       
       var flagSeason = false;
       var flagTemp = false;
       var flagWeather = false;
       var flagEvent = false;
       
       //???????????? ?????? ??????
       function priorityChange(){
          if(flagSeason == false && flagTemp==false && flagWeather==false && flagEvent==false){    
             $("#priorityNo").prop("checked", true);
          }
          else{
             $("#priorityYes").prop("checked", true);
          }
      }
       
       //????????? ???????????? ??????
       function imagePreview(input, expression){
          if(input.files && input.files[0]){
             var reader = new FileReader();
             
             reader.onload = function(e){
                $(expression).attr('src', e.target.result);         
             }
             reader.readAsDataURL(input.files[0]);
          }
       }
       
       //?????? ?????????
       function photoDelete(){
         $("#foodPhoto").attr("src", "");
         $("#photoDelete").css("display", "none");
         $("#foodimg").val('');
         $("#foodPhoto").css('display', 'none');
         $("#foodimgName").text("");
               
       }

        function eventDelete(){
            $("#eventYes").css('display', 'none');
            $("#eventSelected").html('');
            $("#eventSelected").css('display', 'none');
            $("#deleteDate").css('display', 'none');
        }   

       //????????? ?????? ???????????? focus
       $("#searchFood").focus(function(){
          $("#add").css('visibility', 'hidden');
          
          if($("#foodPhoto").attr("src") == undefined){
             $("#photoDelete").css('display', 'none');
             
          }else if($("#foodPhoto").attr("src") != ''){
             $("#foodPhoto").css('display','block');   
             $("#photoDelete").css('display', 'block');
          }
          else{
             $("#foodPhoto").css('display','none');
             $("#photoDelete").css('display', 'none');
          }
       });
       
       
       //?????? ????????? focus
       $("#fname").focus(function(){
          $("#add").css('visibility', 'visible');
          
          if($("#fname").attr("readonly")){
             $("#add").css('visibility', 'hidden');
             $("#modify").css('visibility', 'visible');
             $(".searchForm").css('visibility', 'visible');
             
          }
       });       
       
        //?????? ?????? ????????? 
        $("#searchButton").click(function(){
            //????????? ????????? ?????? ????????? ???
            if($("#searchFood").val()==''){
                alert('????????? ????????? ???????????????.');
                $("#searchFood").focus();
                return false;
            }
             //??????????????? ??????????????? ?????? ??????
            $("#fname").attr("readonly", true);
            //????????? ????????? ???????????? ????????? ?????? ????????? ????????????
            $("#add").css('visibility', 'hidden');
           
            //?????? ?????? ???????????? ?????? ?????? ????????????
            var searchFood = $("#searchFood").val();
            
            $.ajax({
               url : "/getFoodData",
               data : "searchFood=" + searchFood,
               method : 'post',
               success : function(result){
                  
                  if(result==""){
                     alert('???????????? ?????? ???????????????.\n');
                     $("#cancel").click();
                     return false;
                  }
                  
                  console.log(result);
                  $("#fname").val(result.fname);
                  $("#fcategory").val(result.fcategory);
                  $("#season").val(result.season).prop("selected", true);
                  $("#temp").val(result.temp).prop("selected", true);
                  
                  if(result.season !="allseason"){
                     flagSeason = true;
                  }else{
                     flagSeason=false;
                  }
                  
                  if(result.temp!="0"){
                     flagTemp = true;
                  }else{
                     flagTemp = false;
                  }
                  
                  if(result.weather==null){
                     $("#weather option:eq(0)").prop("selected", true);
                     flagWeather=false;
                  }else{
                     $("#weather").val(result.weather).prop("selected", true);
                     flagWeather=true;
                  }
                  
                  if(result.event==null){
                     $("#event option:eq(0)").prop("selected", true);
                     flagEvent=false;
                  }else{
                     $("#event option:eq(1)").prop("selected", true);
                     $("#event option:eq(1)").val(result.event);
                     var event = result.event;
                     var idx = event.indexOf("-");
                     console.log(idx);
                     
                     //????????? ????????? ??????
                     
                     $("#eventYes").css('display', 'inline-block');
                     $("#eventSelected").html(event.substr(idx+1));
                        $("#eventSelected").css('display', 'inline-block');
                        $("#deleteDate").css('display', 'inline-block');
                        flagEvent=true;
                  }
                  
                   //?????? ????????? ??? ?????? ?????? ?????? ??????
                  $("#deleteDate").click(function(){
                     eventDelete();
                      
                    //????????? ???????????? ????????????
                      $("#event option:eq(0)").prop("selected", true);
                      
                      flagEvent = false;
                      priorityChange();
                    
                      //????????? ????????? ??? ?????????
                     $("#event option:eq(1)").val('');  
                     console.log($("#event option:eq(1)").val());           
                  })
                  
                  //???????????? ??????
                  priorityChange();
                  
                  //3.
                  //?????? ?????? ????????????
                  $("#foodPhoto").attr("src", "/img/foodimg/upload/"+result.foodimg);
                  $("#photoDelete").css("display", "inline-block");
                  $("#foodPhoto").css("display", "block");
                  $("#foodimgName").text("???????????? ?????? ????????? ?????? : " + result.foodimg);
                  
                  /* imagePreview(this, "#foodPhoto"); */
                  
                  $("#photoDelete").click(function(){
                     photoDelete();
                     
                  });
                  
               },
               error : function(error){
                  console.log(error.responseText);   
                  
               }
            });
        });
        
        //?????? ?????? ????????? ?????????
        $("#cancel").click(function(){
           
           //????????? ?????? ?????? ????????? ????????? ??????
            $(".searchForm").css('visibility','visible');
            $("#searchFood").val('');
            
            //????????? ???????????? ???????????? ?????????
            $("#fname").val('');
            $("#fname").attr("readonly", false);
            $("#fcategory").val('');
            //???????????? ??????????????? ??????
            $(".form-select option:eq(0)").prop("selected", true);
            $("#weather option:eq(0)").prop("selected", true);
            $("#temp option:eq(0)").prop("selected", true); 
            $("#event option:eq(0)").prop("selected", true); 
            $("#season option:eq(0)").prop("selected", true); 
            $(".form-check").attr("checked", false);
            $("#add").css('visibility', 'visible');
            $("#modify").css('visibility', 'visible');
            
            eventDelete();//

          //????????? ???????????? ????????????
            $("#event option:eq(0)").prop("selected", true);
            
           flagSeason = false;
           flagTemp = false;
           flagWeather = false;
           flagEvent = false;
           
           priorityChange();
           
           photoDelete();
           
        });

        //?????? ?????? ?????? ???
        $("#add").click(function(){
           
           var standard = /\s/g;
           var fname = $("#fname").val();

            if(fname=='' || fname.match(standard)){
                alert('?????? ????????? ???????????????.');
                $("#fname").focus();
                return false;
            }
            if($("#fcategory").val()==''){
                alert("?????? ????????? ???????????????. (ex.??????, ??????, ??????, ??????, ?????????..)");
                $("#fcategory").focus();
                return false;
            }
            if($("#foodimg").val()==''){
                alert("?????? ????????? ????????? ????????? ????????? ?????????.");
                return false;
            }
          
            //?????? ?????? ????????? submit
            $("#adminForm").attr("action", "foodAdd");
            
            $("#adminForm").submit();
            
        });
      //?????? ????????? ?????????, ?????? ?????? ???????????? ??????
         $("#fname").focus(function(){
            
             if($("#searchFood").val()==''){
                $("#modify").css('visibility', 'hidden');
                $(".searchForm").css('visibility','hidden');
             }
             
         });
       
        //?????? ??????
        $("#foodimg").change(function(){
           
           //????????? ????????????
           imagePreview(this, "#foodPhoto");
           $("#photoDelete").css("display", "inline-block");
           $("#foodPhoto").css('display', 'block');
           
           $("#photoDelete").click(function(){
             photoDelete();
          });
    
        });
        
        //?????? ?????? ?????? ???
        $("#modify").click(function(){
           
           if($("#fname").val()==''){
              alert('????????? ????????? ???????????????');
              $("#searchFood").focus();
              return false;
           }
           if($("#fcategory").val()==''){
                alert("?????? ????????? ???????????????. (ex.??????, ??????, ??????, ??????, ?????????..)");
                $("#fcategory").focus();
                return false;
            }
            if($("#foodimg").val()=='' && $("#foodPhoto").attr("src") == ''){
                alert("?????? ????????? ????????? ????????? ????????? ?????????.");
                return false;
            }
            
           //?????? ?????? ?????? ??? submit
            $("#adminForm").attr("action", "foodModify");
             
             $("#adminForm").submit();
        });
       
      
        //?????? ?????? ????????? ????????? select?????? ?????? ????????? ????????????  N ?????? 
        //select?????? ????????? ????????? ???????????? ???????????? ????????? ????????? Y ??????
        //??????????????? ????????? ?????? ??????
        $("#season").change(function(){
           var season = $("#season option:selected").val();
        
           if(season != 'allseason'){
            $("#priorityYes").prop("checked", true);
            flagSeason=true;
           }
           if(season == 'allseason'){
            flagSeason=false;
           }
           priorityChange();

        });

        $("#temp").change(function(){
           var temp = $("#temp option:selected").val();

           if(temp != '0'){
            $("#priorityYes").prop("checked", true);
            flagTemp = true;
           }
           if(temp == '0'){
            flagTemp = false;
           }
           priorityChange();
        });

        $("#weather").change(function(){
           var weather = $("#weather option:selected").val();

           if(weather != 'allweather'){
            $("#priorityYes").prop("checked", true);
            flagWeather = true;
           }
           if(weather == 'allweather'){
            flagWeather = false;
           }
           priorityChange();
        });

        $("#event").change(function(){
            var event = $("#event option:selected").val();

            if(event != 'no'){
                 $("#priorityYes").prop("checked", true);
                 //????????? ?????????
                 $("#modalEvent").modal('show');
                 $("#eventDate").val('');   
                 flagEvent = true;
             }

            if(event == 'no'){
                eventDelete();//
                flagEvent = false;
            }
            priorityChange();

         });  
        
      //????????? ????????? ????????????, esc ???????????? ????????? ??????
        $(".modal").modal({
            backdrop : 'static',
            keyboard : false
        });

        // X ?????? ???????????? ?????? ?????????
        $(".btn-close").click(function(){
            $("#modalEvent").modal('hide');
            //????????? ?????? ???????????? ??????
            $("#event option:eq(0)").prop("selected", true);
            $("#eventDate").val('');
            flagEvent = false;
            priorityChange();
        });

        //?????? ?????? ?????? ?????????
        $("#eventButton").click(function(){

            var eventDate = $("#eventDate").val();
            //?????? ?????? ??? ?????? ??????
            if(eventDate==''){
                //?????? ?????? ?????????
                $("#alertDate").css('display', 'inline-block');
            }
            //?????? ?????? -> ?????? ?????? ????????? ???????????? ??????
            $("#eventDate").change(function(){
                $("#alertDate").css('display', 'none');
                
            });
            //?????? ?????? ??? ????????? ????????? ?????????
            if(eventDate !=''){
                $("#modalEvent").modal('hide'); 
                
               //????????? ????????? value??? ????????? ?????? ??????
                $("#event option:eq(1)").val(eventDate);
               $("#eventSend").text(eventDate);
                console.log($("#event option:eq(1)").val());
                
                //????????? ?????? ???????????? ??????
                
               var idx = eventDate.indexOf("-");
               console.log(idx);
                     
               //????????? ????????? ??????
               
               $("#eventYes").css('display', 'inline-block');
               $("#eventSelected").html(eventDate.substr(idx+1));
                $("#eventSelected").css('display', 'inline-block');
                $("#deleteDate").css('display', 'inline-block');
                
                flagEvent = true; 
            }

            //?????? ????????? ??? ?????? ?????? ?????? ??????
            $("#deleteDate").click(function(){
                eventDelete(); 

              //????????? ???????????? ????????????
                $("#event option:eq(0)").prop("selected", true);
                
                flagEvent = false;
                priorityChange();
              
                //????????? ????????? ??? ?????????
               $("#event option:eq(1)").val('');  
               console.log($("#event option:eq(1)").val());           
            })
        });

        //?????? ????????? ????????? ?????? ????????? //
        $("#foodList").click(function(){
            $("#total").click();
            
            $("#modalFood").modal('show');
        });
        ////?????? ???????????? ?????? ??????????????? ???????????? ?????? ????????? ??????
        $(".foodType").click(function(){
                
            var type = $(this).text();
            
            $.ajax({
                url: '/showfoods',
                data : 'foodType=' + type,
                method: 'post',
                
                success: function(result){
                    var tag = "";
                    var $result = $(result);
                   
                    $result.each(function(idx,vo){
                           tag+= "<li class='eachFood'>";
                           tag += "<span class='foodName'>" + vo.fname+ "</span><br/>";
                           tag += "<img class='foodPicture img-fluid' src='/img/foodimg/upload/" + vo.foodimg + "'><br/>";////////////////
                           tag += "<span class='foodCate'>" + vo.fcategory + "</span></li>";
                    
                        $("#foods").html(tag);
                    });
                },
                error: function(error){
                    console.log(error.responseText);
                }
            });
        });
        
        $("#foodClose").click(function(){
            $("#modalFood").modal('hide');

        });
    });

</script>
   <h1>Manager Page</h1><hr/>

	<div id="otherMasterPage">
		<a href="/member/masterPage">?????? ??????</a>
		<a href="/master/master_modify_cody">?????? ??????</a>
		<a href="/master/master_food">?????? ??????</a>
	</div><br/>
   
   <div class="container">
        <div class="modal fade" data-backdrop = "static" data-keyboard="false" id="modalFood">
            <div class="modal-dialog modal-lg modal-dialog-scrollable " >
                <div class="modal-content">
                    <div class="modal-header">
                        <h5 class="modal-title">?????? ?????????</h5><hr/>
                        <!-- <h5 class="modal-title"></h5><hr/> -->
                        <button type="button"  class="btn-close"  aria-label="Close" id="foodClose"></button> 
                    </div>
                    <div id="foodCategory">
                        <ul>
                            <li><a href="#" class="foodType" id="total">??????</a></li>
                            <li><a href="#" class="foodType">??????</a></li>
                            <li><a href="#" class="foodType">??????</a></li>    
                            <li><a href="#" class="foodType">??????</a></li>   
                            <li><a href="#" class="foodType">?????????</a></li>    
                            <li><a href="#" class="foodType">??????</a></li>    
                        </ul>
                    </div>
                    <div class="modal-body" >
                        <div id="foodAll">
                            <ul id="foods">
                                
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    
        <div id="foodForm">
           <form method="post" id="adminForm" name="adminForm" enctype="multipart/form-data">
              <input type="button" class="btn btn-secondary" id="foodList" value="??????????????????">
               <div class="row m-2 searchForm">
                   <!--????????? ?????? ?????? ??????-->
                   <label for="fname" class="col-lg-3 col-form-label my-2">?????? ??????</label>
                   <div class="col-lg-8 my-2">
                       <input type="text" class="form-control" id="searchFood" placeholder="????????? ?????? ????????? ???????????????" name="searchFood">
                   </div>
                   <div class="col-lg-1 my-2">
                       <input type="button" class="btn btn-secondary mb-3" id="searchButton" value="??????" > 
                   </div>
                </div>

                <!--?????? ?????? ?????? (Not Null)-->
                <div class="row m-2 ">
                    <label for="fname" class="col-lg-3 col-form-label my-2">????????????</label>
                    <div class="col-lg-8 my-2">
                      <input type="text" class="form-control " id="fname" name="fname" placeholder="????????????">
                    </div>
                </div>
                <!--?????? ?????? ?????? (Not Null)-->
                <div class="row m-2">
                    <label for="fcategory" class="col-lg-3 col-form-label my-2">????????????</label>
                    <div class="col-lg-8 my-2">
                      <input type="text" class="form-control " id="fcategory" name="fcategory" placeholder="????????????">
                    </div>
                </div>
                <!--?????? ?????? (Not Null)-->
                <div class="row m-2">
                    <label for="season" class="col-lg-3 col-form-label my-2">??????</label>
                    <div class="col-lg-8 my-2">
                        <select class="form-select col-auto" id="season" name="season">
                            <option selected value="allseason">?????? ??????</option>
                            <option value="spring">???</option>
                            <option value="summer">??????</option>
                            <option value="fall">??????</option>
                            <option value="winter">??????</option>
                        </select>
                    </div>
                </div>
                <!--?????? ?????? (Not Null)-->
                <div class="row m-2">
                    <label for="temp" class="col-lg-3 col-form-label my-2">??????</label>
                    <div class="col-lg-8 my-2">
                        <select class="form-select col-auto" id="temp" name="temp">
                            <option selected value="0">?????? ??????</option>
                            <option value="1">25??? ????????? ??? ??????</option>
                            <option value="2">15??? ????????? ??? ??????</option>
                        </select>
                    </div>
                </div>
                <!--?????? ??????-->
                <div class="row m-2">
                    <label for="weather" class="col-lg-3 col-form-label my-2">??????</label>
                    <div class="col-lg-8 my-2">
                        <select class="form-select col-auto" id="weather" name="weather">
                            <option selected value="allweather">?????? ??????</option>
                            <option value="clear">??????</option>
                            <option value="rain">???</option>
                            <option value="snow">???</option>
                        </select>
                    </div>
                </div>
                <!--????????? ?????? (????????? ????????? ?????? ?????? ??????)-->
                <div class="row m-2" id="eventForm">
                    <label for="event" class="col-lg-3 col-form-label my-2">?????????</label>
                    <div class="col-lg-8 my-2">
                        <select class="form-select col-auto" id="event" name="event">
                            <option selected value="no">?????? ??????</option>
                            <option value="">??????</option> 
                        </select>
                    </div>
                    <div class="col-lg-3 my-2" id="eventYes">??????</div>
                    <span class="col-lg-3 my-2" class="day" id="eventSelected"></span>
                    <a class="col-lg-2 day my-2" id="deleteDate">??????</a>
                </div>
                <!--???????????? (Not Null)-->
                <div class="row m-2"  id="priorityForm">
                    <label class="col-lg-3 col-form-label">????????????</label>
                    <div class="form-check col-lg-3">
                        <input class="form-check-input m-2" type="radio" id="priorityYes" name="priority" value='Y'>
                        <label class="form-check-label" for="priorityYes">
                            Y
                        </label> 
                    </div>
                    <div class="form-check col-lg-3">
                        <input class="form-check-input m-2" type="radio" id="priorityNo" name="priority" checked="checked" value='N'>
                        <label class="form-check-label" for="priorityNo">
                            N
                        </label>
                    </div>
                </div>
                <!--?????? ?????? ?????? ????????? (Not Null)-->
                <div class="row m-2">
                    <label class="col-lg-3 col-form-label my-2" for="foodimg">?????? ??????</label>
                    <input type="file" class="col-lg-8 my-2" id="foodimg" name="filename" >
                  <button type="button"  class="btn-close my-2"  aria-label="Close" id="photoDelete"></button>
                  <span id="foodimgName" class="my-2 "></span>
                  <img id="foodPhoto" class="my-2"/>
                </div>
                
                <div class="row" id="buttons">
                   <div class="col-lg-12 text-center"> 
                      <input type="button" class="btn btn-secondary mb-2" id="cancel" value="??????">
                       <input type="button" class="btn btn-secondary mb-2" id="add" value="??????">
                       <input type="button" class="btn btn-secondary mb-2" id="modify" value="??????">
                   </div>
                </div>
                <!--?????? ?????? ?????? ?????????-->
                <div class="modal fade" data-backdrop = "static" data-keyboard="false" id="modalEvent">
                    <div class="modal-dialog modal-dialog-centered">
                        <div class="modal-content">
                            <div class="modal-header">
                                <h5 class="modal-title">????????? ????????? ???????????????.</h5>
                                <button type="button"  class="btn-close"  aria-label="Close"></button>
                            </div>
                            <div class="modal-body" >
                                <input class = "col-sm-5" type="date" name="eventDate" id="eventDate"/>
                                <input  type="button" id="eventButton" value="??????">
                                <span id="alertDate">????????? ???????????????.</span>
                            </div>
                        </div>
                    </div>
                </div>
           </form>
        </div>
    </div>
</body>
</html>