<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<html>
<head>
   <meta charset="UTF-8">
   <title>Home</title>   
   <meta name="viewport" content="width=device-width, initial-scale=1.0" />
<script type="text/javascript" src="https://static.nid.naver.com/js/naveridlogin_js_sdk_2.0.0.js" charset="utf-8"></script>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<script type="text/javascript">
   function formCheck(){
	   	var loadingProgress = $('#loadingProgress');
		var taker_insta = document.getElementById("taker_insta");
		loadingProgress.show();
		if(taker_insta.value == '' || taker_insta.value.length == 0){
	         alert("인스타그램 ID를 입력해주세요");
	         loadingProgress.hide();
	         return false;
	      }
	      
	      return true;
   }

   function sleep (delay) {
	   var start = new Date().getTime();
	   while (new Date().getTime() < start + delay);
	}

   function LoadingWithMask(gif) {
	    //화면의 높이와 너비를 구합니다.
	    var maskHeight = $(document).height();
	    var maskWidth  = window.document.body.clientWidth;
	     
	    //화면에 출력할 마스크를 설정해줍니다.
	    var mask       ="<div id='mask' style='position:absolute; z-index:9000; background-color:#000000; display:none; left:0; top:0;'></div>";
	    var loadingImg ='';
	    
	    loadingImg +=" <img src='"+ gif +"' style='position: absolute; display: block; margin: 0px auto;'/>";
	 
	    //화면에 레이어 추가
	    $('body')
	        .append(mask)
	 
	    //마스크의 높이와 너비를 화면 것으로 만들어 전체 화면을 채웁니다.
	    $('#mask').css({
	            'width' : maskWidth,
	            'height': maskHeight,
	            'opacity' :'0.3'
	    });
	  
	    //마스크 표시
	    $('#mask').show();
	  
	    //로딩중 이미지 표시
	    $('#loadingImg').append(loadingImg);
	    $('#loadingImg').show();
	}
	 
	function closeLoadingWithMask() {
	    $('#mask, #loadingImg').hide();
	    $('#mask, #loadingImg').empty(); 
	}

	function test(img){

		LoadingWithMask(img);
	    setTimeout("closeLoadingWithMask()", 3000);
	}

	$('#userForm').submit(function(){
		var loadingProgress = $('#loadingProgress');
		var taker_insta = document.getElementById("taker_insta");
		loadingProgress.show();
	      
	});
	
</script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<style type="text/css">
   #gifter{
       
       font-family: 'Bangers', cursive; 
      /* font-family: 'Open Sans', sans-serif; */
   } 
   #gifter2{
         font-family: 'Open Sans', sans-serif;
   }
   #taker_insta{
      font-family: 'Open Sans', sans-serif;
      border: 3px solid #030000; 
      box-sizing: border-box;
      box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25);
   }

   .box1 {
        background: white;
        grid-row : 1/3;
   }
   .box2 {
         background: #F37021; 
        
        
        
        
   }
   .box3 {
        background: #86111D;
        
   }
   * {
        color: white;
        font-weight: bold;
        margin: 0;
        padding: 0;
   }
   .main {
        display: grid;
        grid-template-columns: 60% 40%;
        grid-template-rows: 70% 30%;         
        height: 100%; 
        width: 100%;         
   }
   
   input::-webkit-input-placeholder {
        color: black;
   }
   input:-moz-placeholder {
        color: black;
   }
   
   /* setumei styles */
      *,
      *::before,
      *::after {
        box-sizing: border-box;
      }
      
      :root{
           --bg-color: #F37021; 
         
      }
      
      body {
        display: flex;
        align-items: center;
        justify-content: center;
        overflow: hidden;
        width: 100vw;
        height: 100vh;
        color: #000;
        background-color: var(--bg-color);
        font-family: 'Maitree', serif;
      }
      
      
      
      /* title styles */
      .home-title span{
          position: relative;
          overflow: hidden;
          display: block;
          line-height: 1.2;
      }
      
      .home-title span::after{
          content: '';
          position: absolute;
          top: 0;
          right: 0;
          width: 100%;
          height: 100%;
          background: white;
          animation: a-ltr-after 2s cubic-bezier(.77,0,.18,1) forwards;
          /* animation-iteration-count : infinite; */
          
          transform: translateX(-101%);
      }
      
      .home-title span::before{
          content: '';
          position: absolute;
          top: 0;
          right: 0;
          width: 100%;
          height: 100%;
          background: var(--bg-color);
          animation: a-ltr-before 2s cubic-bezier(.77,0,.18,1) forwards;
          transform: translateX(0);
      }
      
      .home-title span:nth-of-type(1)::before,
      .home-title span:nth-of-type(1)::after{
          animation-delay: 2s;
      }
      
      .home-title span:nth-of-type(2)::before,
      .home-title span:nth-of-type(2)::after{
          animation-delay: 2.5s;
      }
      
      @keyframes a-ltr-after{
          0% {transform: translateX(-100%)}
          100% {transform: translateX(101%)}
      }
      
      @keyframes a-ltr-before{
          0% {transform: translateX(0)}
          100% {transform: translateX(200%)}
      }
</style>
</head>
<body>

    <div class="main">
      <div class="box1">
      
        <c:choose>
       <c:when test="${sessionScope.member_id != null}">
          <br/>
          <div class="container">
            <ul class="nav justify-content-end" id = "gifter2">
               <li class="nav-item">
                     <a class="nav-link disabled text-body" href="#" style="font-size: 1.5vw;">${sessionScope.member_id}'s Gifter</a> 
                </li>
               <li class="nav-item">
                     <a class="nav-link text-body" href="<c:url value="/"/>" style="color: black; font-size: 1.5vw;">Home</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link text-body" href="/member/myPage" style="color: black; padding-right: 0; font-size: 1.5vw;">My Page</a>
                </li>
                
            </ul>   
         </div>   
       </c:when>
       <c:otherwise>
          <br/>
          <div class="container">
            <ul class="nav justify-content-end" id = "gifter2">
                <li class="nav-item">
                     <a class="nav-link text-body" href="<c:url value="/"/>" style="color: black; font-size: 1.5vw;">Home</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link text-body" href="/member/signupForm" style="color: black; font-size: 1.5vw;">Sign Up</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link text-body" href="/member/loginForm" style="color: black; padding-right: 0; font-size: 1.5vw;">Login</a>
                </li>
              </ul>   
         </div>                  
       </c:otherwise>
    </c:choose>    
     
        <br/><br/>    
      <div class="d-flex justify-content-center align-items-center " style="height:29.296875vw"> 
      <div id = "loadingProgress" style="float:center; position:absolute; display:none;">
             <input type = "image" id = "loadingImg" src = "/resources/icon/changeLoadings.gif"> 
      </div>
          <form action="/taker/search" method="get" onsubmit="return formCheck();" id="userForm">
             <div id = "instaID"style = "float:left;">
             <input type="text" id="taker_insta" name="taker_insta" placeholder=" @instagram ID"  style="width:35vw; height:3.2vw; font-size:1.6vw; color: black;">
             </div>
             <div style = "float:left;">
             <input type="image" id="btn1" src="${pageContext.request.contextPath}/resources/iconfinder_-_Magnifier-Search-Zoom-_3844432.png" style="width: 2.7vw; height:2.7vw;" >           
             </div>
          </form>
          
       </div>
      </div>
      
      <div class="box2">
         <c:choose>
       <c:when test="${sessionScope.member_id != null}">
          <br/>
          <div class="container">
            <ul class="nav justify-content-start" id = "gifter2">            
                <li class="nav-item" style="padding-left: 0">
                     <a class="nav-link text-body" href="/category/bestForm" style="color: black; padding-left: 0; font-size: 1.5vw;">Best</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link text-body" href="/category/viewCategory" style="color: black; font-size: 1.5vw;">viewCategory</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link text-body" href="/member/logout" style="color: black; font-size: 1.5vw;">Logout</a>
                </li>
            </ul>   
         </div>   
       </c:when>
       <c:otherwise>
          <br/>
          <div class="container">
            <ul class="nav justify-content-start" id = "gifter2">
                
                <li class="nav-item">
                     <a class="nav-link text-body" href="/category/bestForm" style="color: black; padding-left: 0; font-size: 1.5vw;">Best</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link text-body" href="/category/viewCategory" style="color: black; font-size: 1.5vw;">viewCategory</a>
                </li>
              </ul>   
         </div>                  
       </c:otherwise>
    </c:choose>   
        
        <div class="text-left" 
            id = "gifter" 
            style="
            color: black; 
            font-size: 3vw; 
            color: black; 
            padding-left: 6.510416666666667vw; 
            padding-right: 6.510416666666667vw; 
            padding-bottom: 1.6276041666666667vw; 
            letter-spacing: 0.1953125vw;
            text-shadow: 5px 5px 0px black;
            ">
        <br/><br/>
              <h1 class="home-title">
           <span>Enter the</span>
           <span>InstaGram ID of</span>
           <span>the person you</span>
           <span>want to present.</span>
       
         </h1>
        </div>
      </div>
      
      <div class="box3 text-center" 
               id = "gifter" 
               onclick="location.href ='""
               style="font-size: 9vw; 
               padding-right: 6.510416666666667vw; 
               color: white;
               text-shadow: 10px 10px 0px black;
               letter-spacing :10px;
               ">
        <a  >Gifter</a>
      </div>
    </div>
    
</body>
</html>