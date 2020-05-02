<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 실패</title>	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,600&display=swap" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

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
  		font-weight: bold;
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
      					<a class="nav-link text-body" href="<c:url value="/"/>" style="font-size: 1.5vw; ">Home</a>
    				</li>
    				<li class="nav-item">     					
    					<a class="nav-link text-body" href="/member/signupForm" style="padding-right: 0; font-size: 1.5vw;">Sign Up</a>
    				</li>
  				</ul>		
			</div>
			
			
						
       </div>	
       <div class="box3">
       		<br/><br/>
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
			
			<div id="setting" class="text-center border border-white" style="color: black; background-color: white; width: 250px; height: 150px; margin: 130px;  border-radius: 10px; background: rgba(255, 255, 255, 0.55);">
				<h4 style="color: black;">로그인 실패  </h4>
				<h4 style="color: black;">다시 로그인 하세요</h4><br/>
				<a href="<c:url value='/member/loginForm'/>"><img style = "width: 2.2vw;" src = "/resources/icon/right-tick.png"/></a>
				&emsp;&nbsp;&nbsp;&nbsp;&nbsp;
				<a href="<c:url value='/'/>"><img style = "width: 2.2vw;" src = "/resources/icon/cancel.png"/></a>
			</div>
			
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