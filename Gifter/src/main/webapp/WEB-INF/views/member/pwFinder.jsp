<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>비밀번호 찾기</title>	
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
	h3, h7{
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
      					<a class="nav-link text-body"  style="font-size: 1.4vw;" href="<c:url value="/"/>">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/signupForm" style="padding-right: 0; font-size: 1.4vw;">Sign Up</a>
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
     				 	<a class="nav-link text-body" href="/member/loginForm" style="padding-left: 0; font-size: 1.4vw;">Login</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm" style="font-size: 1.4vw;" >Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="font-size: 1.4vw;" >viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.4vw;">About</a>
    				</li>
  				</ul>	
			</div>	
			<br/>	
	 		<br/>	
        
        <div id="setting" class="border border-dark  align-items-center" style="width:350px; height:380px; margin: 110px; background-color: white; background: rgba(255, 255, 255, 0.25);">
			<div class="text-center" style="color: black;">
				<br/>
				<h3 style="color: black;">비밀번호 찾기</h3>
				<h7>가입할 때 입력한 아이디와 이메일을 적어 주세요 <br/>
				이메일로 임시 비밀번호를 보내 드립니다 !</h7> <br/><br/>
			</div>
			<div class="d-flex justify-content-center align-items-center ">
	 			<form action="pwFind" method="post">
	 			<div class="form-group"> 
	 				<label for="id" style="color: black;">ID</label>   
	 				<input type="text" class="form-control" id="member_id" name="member_id" placeholder="Subscribed ID" 
	 				style="width:250px; height:25px; font-size:16px;  ">
	 			</div>
	 			<div class="form-group">
	 				<label for="email" style="color: black;">Email</label> 
	 				<input type="text" class="form-control" id="member_email" name="member_email" placeholder="abc@gmail.com" style="width:250px; height:25px; font-size:16px;">
	 			</div>
	 			<div class="form-group text-center">
	 				<button type = "submit" id="btn1" class ="btn-img">
    			 <img src="/resources/icon/right-tick.png" style = "width :2.2vw; " >
    			</button>
	 		&emsp;&emsp;
	 		<a href="<c:url value='/'/>"><img style = "width: 2.2vw;" src = "/resources/icon/cancel.png"/></a>  
	 			</div>
	 			</form>
			</div>
		</div>
        
      </div>
    </div>
</body>
</html>