<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 찾기 결과</title>	
	<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
	<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script>
	$(function(){
		$("#btn").click(function(){
			var member_id = $("#member_id").val();
			var member_email = $("#member_email").val();
			if(member_id == "" || member_id.length == 0){
				alert("가입한 아이디를 입력해주세요.");
				return false;
			}		
			if(member_email == "" || member_email.length == 0){
				alert("가입한 이메일을 입력해주세요.");
				return false;
			}
			return true;					
		});
	});
</script>
<style type="text/css">
	
	.box1 {
  		background: #5e7e9b;
  		/* grid-row : 1/3; */
	}
	.box2 {
  		background: #e9e9e9;
	}
	.box3 {
  		background: #eee6c4;
	}
	* {
  		color: white;
  		font-weight: bold;
  		margin: 0;
  		padding: 0;
	}
	.main {
  		display: grid;
  		grid-template-columns: 20% 40% 40%;
  		/* grid-template-rows: 60% 40%; */			
  		height: 100%; 
  		width: 100%;	
  		font-family: 'Open Sans', sans-serif; 			
  				
	}
	h4{
		font-family: 'MapoFlowerIsland'; 
		font-weight: bord; 
		font-style: normal; 
		color: #000000;
	}
	@font-face { 
		font-family: 'MapoFlowerIsland'; 
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff') format('woff'); 
		font-weight: normal; 
		font-style: normal; 
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
      					<a class="nav-link text-body" href="<c:url value="/"/>" style = "font-size :1.2vw;">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/signupForm" style="padding-right: 0; font-size :1.2vw;">Sign Up</a>
    				</li>
    				
  				</ul>	
			</div>	
			<br/>	
	 		<br/>	 						
		
	
      </div>
      <div class="box3">
         <br/>	
	 		<div class="container">
				<ul class="nav justify-content-start">
    				
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/loginForm" style="padding-left: 0; font-size :1.2vw;" >Login</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm" style = "font-size :1.2vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style = "font-size :1.2vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.2vw;">About</a>
    				</li>
  				</ul>	
			</div>	
			<br/>	
	 		<br/>	
        
        <c:choose>
		<c:when test="${msg3 == 'fail'}">
			<div id="setting" class="text-center border border-dark" style="color: black; margin: 145px;  border-radius: 10px;">
				<h4 style="color: black;">아이디 또는 이메일이 </h4> 
				<h4 style="color: black;">맞지 않습니다</h4><br/>
				<a href="<c:url value="/"/>"><img style = "width: 2.2vw;" src = "/resources/icon/next.png"/></a>		
			</div>
		</c:when>
		<c:otherwise>
			<div id="setting" class="text-center border border-dark" style="color: black; margin: 145px;  border-radius: 10px;">
				<h4 style="color: black;">이메일로 임시 비밀번호를 </h4>
				<h4 style="color: black;">보내드렸습니다 </h4>
				<h4 style="color: black;">확인 후 로그인 하세요</h4>
				<br/>
				<a href="<c:url value="/member/loginForm"/>"><input type="button" class="btn btn-light" value="로그인 하기"></a>
			</div>
		</c:otherwise>
	</c:choose>
        
      </div>
    </div>
</body>
</html>