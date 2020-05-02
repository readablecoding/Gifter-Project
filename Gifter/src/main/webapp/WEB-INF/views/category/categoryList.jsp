<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
	<meta charset="UTF-8">
	<title>카테고리 리스트</title>	
	<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
	<link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,600&display=swap" rel="stylesheet">
	<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

<style type="text/css">
	
	.box1 {
  		background: #d93c2c;
  		/* grid-row : 1/3; */
	}
	.box2 {
  		background: #f8f8d9; 
	}
	.box3 {
  		background: #005282; 
	}
	* {
  		color: white;
  		font-weight: bold;
  		margin: 0;
  		padding: 0;
	}
	.main {
  		display: grid;
  		grid-template-columns: 20% 60% 20%;
  		/* grid-template-rows: 60% 40%; */			
  		height: 100%; 
  		width: 100%;	
  		font-family: 'Open Sans', sans-serif;  		
	}
	

	
</style>
<script type="text/javascript">
function paging(page){
		var pagingForm = document.getElementById("pagingForm");
		var currenPage = document.getElementById("currenPage");
	
		currentPage.value = page;
		pagingForm.submit();		
		
		
	}
</script>
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
      					<a class="nav-link disabled text-body" href="#" style="font-size: 1.2vw;">${sessionScope.member_id}'s Gifter</a> 
    				</li>
					<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>" style="font-size: 1.2vw;">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/logout" style="font-size: 1.2vw;">Logout</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/myPage" style="font-size: 1.2vw;">My Page</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/bestForm" style="font-size: 1.2vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="font-size: 1.2vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.2vw;">About</a>
    				</li>
				</ul>	
			</div>
			
	 	</c:when>
	 	<c:otherwise>
	 		<br/>
	 		<div class="container">
				<ul class="nav justify-content-end">
    				<li class="nav-item">
      					<a class="nav-link text-body" href="<c:url value="/"/>" style="font-size: 1.2vw;">Home</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/signupForm" style="font-size: 1.2vw;">Sign Up</a>
    				</li>
    				<li class="nav-item">
     				 	<a class="nav-link text-body" href="/member/loginForm" style="font-size: 1.2vw;">Login</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="font-size: 1.2vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.2vw;">About</a>
    				</li>
  				</ul>	
			</div>	
				 						
	 	</c:otherwise>
	 </c:choose>
	 
	 
	<br/><br/><br/><br/>
	
	
	<div id="list" class="d-flex justify-content-center align-items-center " style="padding-top: 100px;">
	<form>
		<table class="table" style="width:350px; background-color: white;  border-radius: 10px;">
			<thead>
			<tr>	
				<c:forEach  var="item" items="${list}" varStatus="status">
					
					<c:if test="${navi.currentPage == 1}">
						<th style="color: black; text-align: center;">${status.count}위</th>
					</c:if>
				
					<c:if test="${navi.currentPage == 2}">
						<th style="color: black; text-align: center;">${status.count + 3}위</th>
					</c:if>
				
					<c:if test="${navi.currentPage == 3}">
						<th style="color: black; text-align: center;">${status.count + 6}위</th>
					</c:if>
				
					<c:if test="${navi.currentPage == 4}">
						<th style="color: black; text-align: center;">${status.count + 9}위</th>
					</c:if>	
						
				</c:forEach>			
				
			</tr>
			</thead>
				
			<tbody>
			<tr>
    			<c:forEach  var="item" items="${list}" varStatus="status">
					<td style="color: black; text-align: center;">${item.CAT_NAME}</td>	
				</c:forEach>
			</tr>
			</tbody>	
			
		</table>
	</form>
	
	</div>
	
	<br/>
	<div id="list" class="d-flex justify-content-center align-items-center ">
	<!-- 페이징 처리 -->
		<a href="javascript:paging('${navi.currentPage - navi.pagePerGroup}')" style="color: black;">◁◁</a>
		&nbsp;
		
		<a href="javascript:paging('${navi.currentPage - 1}')" style="color: black;">Back</a>
		
		&nbsp;
		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<c:choose>
				<c:when test="${counter == navi.currentPage}">
					<b><a href="javascript:paging('${counter}')" style="color: #dc143c;">${counter}</a></b>
				</c:when>
				<c:otherwise>
					<small><a href="javascript:paging('${counter}')" style="color: black;">${counter}</a></small>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		&nbsp;
		<a href="javascript:paging('${navi.currentPage + 1}')" style="color: black;" class="next">Next</a>
		&nbsp;
		<a href="javascript:paging('${navi.currentPage + navi.pagePerGroup}')" style="color: black;">▷▷</a>
			
		<!-- 검색 처리 -->
		<!-- 페이징 or 검색 요청시 전달할 폼 -->
		<form action="pagingMove" method="get" id="pagingForm">
			<input type="hidden" id="currentPage" name="currentPage">
		</form>
	</div>

	
	</div>
	
	<div class="box3">
		
    </div>
		
	</div>
		
      
      
      
    
</body>
</html>