<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 수정 결과</title>	
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<style type="text/css">
	
	.box1 {
  		background: #6d6d6d;
  		/* grid-row : 1/3; */
	}
	.box2 {
  		background: #f5f5dc;
  		/* grid-row : 2/2; */ 
	}	
	
	
	* {
  		color: white;
  		font-weight: bold;
  		margin: 0;
  		padding: 0;
  		font-family: 'Open Sans', sans-serif;   
	}
	.main {
  		display: grid;
  		grid-template-columns: 20% 80%;
  		/* grid-template-rows: 100%; 	 */	
  		height: 100%; 
  		width: 100%;			
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
        
        <c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
					<li class="nav-item">
      					<a class="nav-link disabled text-body" style= "font-size: 1.2vw;" href="#">${sessionScope.member_id}'s Gifter</a> 
    				</li>
					<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>" style= "font-size: 1.2vw;">Home</a>
    				</li>    				
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm" style= "font-size: 1.2vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style= "font-size: 1.2vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.2vw;">About</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/logout" style= "font-size: 1.2vw;">Logout</a>
    				</li>
				</ul>	
			</div>
			
	 	</c:when>
	 	<c:otherwise>
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
    				<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>" style= "font-size: 1.2vw;">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/signupForm" style= "font-size: 1.2vw;">Sign Up</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/loginForm" style= "font-size: 1.2vw;">Login</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm" style= "font-size: 1.2vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style= "font-size: 1.2vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.2vw;">About</a>
    				</li>
  				</ul>	
			</div>	
				 						
	 	</c:otherwise>
	 </c:choose>
		
		<br/><br/><br/><br/>
		<c:choose>
		<c:when test="${msg4 == 'success'}">
			<div id="setting" class="text-center border border-dark" style="width: 350px; height: 160px; background-color: white; margin-left: 390px; margin-top: 135px; border-radius: 10px; background: rgba(255, 255, 255, 0.55);">
				<h4 style="color: black;">${member_id}님의</h4>
				<h4 style="color: black;">비밀번호가 수정 됐습니다</h4>
				<br/>
				<a href="<c:url value="/"/>"><input type="button" class="btn btn-dark" value="메인 이동"></a>
			</div>
		</c:when>
		<c:otherwise>
			<div id="setting2" class="text-center border border-dark" style="width: 350px; height: 240px; background-color: white; margin-left: 390px; margin-top: 135px;  border-radius: 10px; background: rgba(255, 255, 255, 0.55);">
				<h4 style="color: black;">비밀번호 수정에</h4> 
				<h4 style="color: black;">실패했습니다</h4>
				<h4 style="color: black;">다시 해주세요</h4>
				<br/>
				<a href="<c:url value="/member/mypage"/>"><input type="button" class="btn btn-dark" value="마이 페이지 이동"></a>
			</div>
		</c:otherwise>
	</c:choose>

      	</div>
     
    </div>
</body>
</html>