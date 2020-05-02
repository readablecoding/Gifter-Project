<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>로그인</title>	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,600&display=swap" rel="stylesheet">
	
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script type="text/javascript">
	function formCheck(){
		var member_id = $("#member_id").val();
		var member_pw = $("#member_pw").val();

		if(member_id == ''){
			alert("아이디를 입력해주세요");
			return false;
		}
		if(member_pw == ''){
			alert("비밀번호를 입력해주세요");
			return false;
		}
		return true;
	}	 

 	function explain(){
 		alert("가입한 ID와 비밀번호를 입력하시면 됩니다.");		
 	}

	$(function(){
		$("#idFind").click(function(){
			location.href="/member/idFinder";
		})
		
		$("#idFind2").click(function(){
			location.href="/member/idFinder";
		})

		$("#pwFind").click(function(){
			location.href="/member/pwFinder";
		})

		$("#pwFind2").click(function(){
			location.href="/member/pwFinder";
		})
	});

</script>
<style type="text/css">
	
	.box1 { 	
  		background: #FB8963;
  		grid-row : 1/3;
	}
	.box2 {
  		background: #E1DEDD;
	}
	.box3 {
  		background: #554FFB;
	}
	.box4 {
  		background: #0d7373;
	}
	.box5 {
  		background: #554FFB;
	}
	.box6 {
  		background: #FB8963;
	}
	.box7 {
  		background: #0d7373;
	}
	* {
  		color: white;
  		font-weight: normal;
  		margin: 0;
  		padding: 0;
	}
	.main {
  		display: grid;
  		grid-template-columns: 1fr 1fr 1fr;
  		grid-template-rows: 70% 20% 10%;			
  		height: 100%; 
  		width: 100%; 
  		font-family: 'Open Sans', sans-serif;    			
	}
	.form-control{
      font-family: 'Montserrat', sans-serif;
      border-radius: 0;
   }
    #setting{
       box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); 
      
   }
   #btn1{
   	border-style : none;
   	background-color: rgba(255, 255, 255, 0); 
   	
   }
</style>
</head>
<body> 
	<div class="main">
    	<div class="box1">
        	
      	</div>
      	
      	<div class="box2">
      		<br/>    
        	<div class="container">
				<ul class="nav justify-content-end">
    				<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>" style="font-size: 1.5vw;">Home</a>
    				</li>
    				<li class="nav-item">     					
    					<a class="nav-link text-body" href="/member/signupForm" style="padding-right: 0; font-size: 1.5vw;">Sign Up</a>
    				</li>
  				</ul>		
			</div>
								
       </div>	
       <div class="box3">
       		<br/>
       		<div class="container">
				<ul class="nav justify-content-start">
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm" style="padding-left: 0; font-size: 1.5vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="font-size: 1.5vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.5vw;">About</a>
    				</li>
  				</ul>	
			</div>
			
	 <c:choose>		
		<c:when test="${member_id != null}">
			<c:if test="${member_id != null}">
				<div id="socialLoginSuccess" class="text-center">
					<br/><br/><br/>
					<h2 style="color: black;"> 로그인 성공 </h2>
					<br/>
					<h3 style="color: black;">'${member_id}'님 환영합니다. </h3>
					<br/>	
					<h2><a href="/"><input type="button" class="btn btn-link" value="메인 페이지 이동" style="color: black"></a></h2>		
				</div>			
			</c:if>				
		</c:when>	
		<c:otherwise>
			
		<br/>
		<div id="setting" class="container border border-white align-self-center align-items-center mx-auto m-5 pb-5"  style="width:22vw; height:49vh; background-color: white; background: rgba(255, 255, 255, 0.55);">
			<div class="text-center">
				<h2 style="color: #000000; font-size: 2.1vw;">Login</h2>	
			</div>
			<div class="d-flex justify-content-center align-items-center">
  				<form action="/member/login" method="post">
  					<div class="form-group"> 			
      					<label for="id" style="color: #000000; ">ID</label>    		
      					<input type="text" class="form-control" placeholder="ID" id="member_id" name="member_id" style="width:250px; height:25px; font-size:13px;">		
    				</div>			
    				<div class="form-group">
      					<label for="pwd" style="color: #000000; ">Password</label>
      					<input type="password" class="form-control" placeholder="Password" id="member_pw" name="member_pw" style="width:250px; height:25px; font-size:13px;">
    				</div> 
    				<div class="form-group text-center">
    					<button type = "submit" id="btn1" class ="btn-img">
    					<img src="/resources/icon/right-tick.png" style = "width :2.2vw; " >
    					</button>
    					&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
    					<a href="<c:url value="/"/>">
    					<img style = "width: 2.2vw;" src = "/resources/icon/cancel.png"/></a>   			 		
    				</div>
  				</form>
			</div>
			<div class="text-center">
				<input type="button" class="btn btn-outline-dark"  id="idFind" value="아이디 찾기" style="font-size: 1.0416666666666667vw;">
				&emsp;
				<input type="button"  class="btn btn-outline-dark" id="pwFind" value="비밀번호 찾기" style="font-size: 1.0416666666666667vw;">					
			</div>	
			
			<br/>
			<div class="text-center">
				<!-- 네이버 로그인 창으로 이동 -->
				<a href="${naver_url}">
				<img style="width: 2.2786458333333335vw;" src="${pageContext.request.contextPath}/resources/icon/Log in with NAVER_Icon_Green (1).png"/></a>		
				&emsp;
				<!-- 구글 로그인 화면으로 이동 시키는 URL -->
				<!-- 구글 로그인 화면에서 ID, PW를 올바르게 입력하면 oauth2callback 메소드 실행 요청-->
				<a href="${google_url}">
				<img style="width: 2.9296875vw;" src="${pageContext.request.contextPath}/resources/icon/btn_google_light_normal_ios.png"/></a>			
				&emsp;
				<!--카카오 로그인 창으로 이동  -->
				<a href="${kakao_url}"> 
				<img style="width: 2.2786458333333335vw;" src="${pageContext.request.contextPath}/resources/icon/kakaolink_btn_small.png" /></a> 
			</div>
		</div>
		</c:otherwise>
	</c:choose>
			
      	</div>
      	<div class="box4">
        	
      	</div>
       
       	<div class="box5">
       		
      	</div>
    	<div class="box6">
        
      </div>
      <div class="box7">
        
      </div> 
	</div>
</body>
</html>