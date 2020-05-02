<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<title>About</title>
<style>
	table {
  	/* border-collapse: collapse; */
  	width: 150px;
	height: 150px;
  	
	}

	th, td {
  	text-align: center;
  	padding: 8px;
  	
	}

	tr:nth-child(even){background-color: #f2f2f2}

	th {
  	background-color: #4CAF50;
  	color: white;
	}
	

	
	.table-bordered  {
	
		width: 43vw;
		height: 20vh;
	}
	
	.box1 {
  		background: bege;
  		/* grid-row : 1/3; */
	}
	.box2 {
  		background: #faebd7	;
	}
	
	* {
  		/* color: white; */
  		font-weight: bold;
  		margin: 0;
  		padding: 0;
	}
	.main {
  		display: grid;
  		grid-template-columns: 70% 30% ;
  		/* grid-template-rows: 60% 40%; */			
  		height: 100%; 
  		width: 100%;			
	}
	img{
		width: 8vw;
		height: 12vh;
	}
	
	h3{
		line-height: 2.7rem;
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
				<ul class="nav justify-content-end">
					<li class="nav-item">
      					<a class="nav-link disabled text-body" href="#" style="font-size: 1.0416666666666667vw;">${sessionScope.member_id}'s Gifter</a> 
    				</li>
					<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>" style="color: black; font-size: 1.0416666666666667vw;">Home</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/myPage" style="color: black; padding-right: 0; font-size: 1.0416666666666667vw;">My Page</a>
    				</li>
    				
				</ul>	
			</div>	
	 	</c:when>
	 	<c:otherwise>
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
    				<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>" style="color: black; font-size: 1.0416666666666667vw;">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/signupForm" style="color: black; font-size: 1.0416666666666667vw;">Sign Up</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/loginForm" style="color: black; padding-right: 0; font-size: 1.0416666666666667vw;">Login</a>
    				</li>
  				</ul>	
			</div>						
	 	</c:otherwise>
	 </c:choose> 
								
		<br/>
		<div class="text-center" style="letter-spacing: -.03125rem;  margin: 45px;  border-radius: 10px;" >
			<h3>Gifter의 목표는 선물받을 분의 <br/>
				<span style="color: #4285f4">인스타그램 아이디</span>를 통해 <br/>
				<span style="color: #ea4335">사진을 분석</span>해 어울리는<br/> 
				<span style="color: #f9ab00">선물을 추천</span>해주는 것입니다<br/>     
			</h3>
		</div>
		<br/>
		<div class="table-responsive " style="border-radius: 10px;">
			<h2 class="text-center">Members</h2>
			<table class="table-bordered" style="margin-left: auto; margin-right: auto; border-radius: 5px;">
  				<tr>
  					<th></th>
    				<th>박완</th>
    				<th>강수현</th>
    				<th>김언주</th>
    				<th>이진원</th>
  				</tr>
  				<tr>
    				<td>캐릭터</td>	
    				<td><img src="${pageContext.request.contextPath}/resources/img/dolphin.png" /></td>
    				<td><img src="${pageContext.request.contextPath}/resources/img/dog.png" /></td>
    				<td><img src="${pageContext.request.contextPath}/resources/img/cat.png" /></td>
    				<td><img src="${pageContext.request.contextPath}/resources/img/ant.png" /></td>
  				</tr>
  				<tr>
  					<td>역할</td> 
   					<td>프로젝트 지휘<br/>크롤링<br/>마이페이지</td>
    				<td>크롤링<br/>카테고리 구현<br/>카테고리 디자인</td>
    				<td>페이지 레이아웃<br/>구글 인증<br/>화면 디자인</td>
    				<td>DB 설계<br/>로그인<br/>부트스트랩</td>
  				</tr>
			</table>
		</div>
		<br/><br/>
		<div class="text-center">
			Copyright 2020.Gifter.All rights reserved.
		</div>
	</div>
	<div class="box2">
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
  				</ul>	
			</div>						
	 	</c:otherwise>
	 </c:choose> 
			
	</div>
	</div>
</body>
</html>