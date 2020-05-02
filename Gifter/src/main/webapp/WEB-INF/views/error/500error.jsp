<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>에러 페이지</title>	
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<style type="text/css">
	
	.box1 {
  		background: #00b07b;
  				
	}
	.box2 {
  		background: #eee6c4;		
	}
	.box3 {
  		background: #0099a4; 		
	}
			
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
  		height: 100%; 
  		width: 100%;		
	}
	
	.nav-link disabled, .nav-link{
		font-weight: bold;
		color: black;
	}
	
	
	
</style>
</head>
<body> 
	<div class="main">
      <div class="box1"> 	
      </div>
      <div class="box2">
      <c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
					<li class="nav-item">
      					<a class="nav-link disabled " href="#" style="color: black; font-size: 1.0416666666666667vw;">${sessionScope.member_id}'s Gifter</a> 
    				</li>
					<li class="nav-item">
      					<a class="nav-link " href="<c:url value="/"/>" style="color: black; font-size: 1.0416666666666667vw; font-weight: bold;">Home</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link " href="/member/myPage" style="color: black; padding-right: 0; font-size: 1.0416666666666667vw; font-weight: bold;">My Page</a>
    				</li>
    				
				</ul>	
			</div>	
	 	</c:when>
	 	<c:otherwise>
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
    				<li class="nav-item">
      					<a class="nav-link " href="<c:url value="/"/>" style="color: black; font-size: 1.0416666666666667vw;" >Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link " href="/member/signupForm" style="color: black; font-size: 1.0416666666666667vw; ">Sign Up</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link " href="/member/loginForm" style="color: black; padding-right: 0; font-size: 1.0416666666666667vw;">Login</a>
    				</li>
  				</ul>	
			</div>						
	 	</c:otherwise>
	 </c:choose> 
	 
	 <div id="setting" class="text-center" style="width: 350px; height: 110px; background-color: white; margin-left: 85px; margin-top: 220px; border-radius: 10px;">
		<h5 style="color: black;">내부 서버 에러입니다</h5> <br/>
		<a href="<c:url value="/"/>"><input type="button" class="btn btn-dark" value="메인 페이지 이동"></a>
	</div>
	 
      </div>
      <div class="box3">
       	 <c:choose>
	 		<c:when test="${sessionScope.member_id != null}">
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-start">				
    				<li class="nav-item" style="padding-left: 0">
      					<a class="nav-link text-body" href="/category/bestForm" style="color: black; padding-left: 0; font-size: 1.0416666666666667vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="color: black; font-size: 1.0416666666666667vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.0416666666666667vw;">About</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/logout" style="color: black; font-size: 1.0416666666666667vw;">Logout</a>
    				</li>
				</ul>	
			</div>	
	 	</c:when>
	 	<c:otherwise>
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-start">
    				
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm" style="color: black; padding-left: 0; font-size: 1.0416666666666667vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="color: black; font-size: 1.0416666666666667vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.0416666666666667vw;">About</a>
    				</li>
  				</ul>	
			</div>						
	 	</c:otherwise>
	 </c:choose>
      </div>    
    </div>
</body>
</html>