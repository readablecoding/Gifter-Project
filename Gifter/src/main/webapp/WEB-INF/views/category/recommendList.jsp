<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff">

<title>recommendList</title>

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
	
	#board{
		font-family: 'MapoFlowerIsland'; 
		font-weight: normal; 
		font-style: normal;  
	}

	@font-face { 
		font-family: 'MapoFlowerIsland'; 
		src: url('https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff') format('woff'); 
		font-weight: normal; 
		font-style: normal; 
	}


* {
  	color: 	#ffffff;
  	font-weight: bold;
  	margin: 0;
  	padding: 0;
}

body {
	background-color:	#000000;
	font-size: 1.0rem;
}

table {
	/* background: #53cec2; */
	background : #000000;
	table-layout:fixed; 
	margin-left:auto;
	margin-right:auto;
}

.ths {
	width:180px;
	scope:row;
}

.table td, .table th {
    padding: .70rem;
    vertical-align: top;
    border-top: 7px solid #ffffff;
}

.table-hover tbody tr:hover td, .table-hover tbody tr:hover th {
  background-color: #ffc107;
}

a {
	color : #ffffff;
}

a:hover {
	text-decoration: none;
	color: #000000;
}

.pagination a {
  	color : #000000;
  	border-radius: 2px;
}

.pagination a.active {
  	color : #ffffff;
  	border-radius: 2px;
}

.page-item.active .page-link {
    color: #000000;
    background-color: #fffffff;
    border-color: #ffc107;
}

.pagination a:hover {
	background-color: #ffc107;
	color : #000000;
	font-color:#000000;
}

.pagination a:focus {
	background-color: #ffc107;
}
 
</style>
</head>
<body>

	<!-- 배너 -->
	<c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
			<div class="bg-warning text-dark"> 
				<div class="container">
					<ul class="nav justify-content-end" id = "gifter2">
						<li class="nav-item">
		      				<a class="nav-link text-body" href="<c:url value="/"/>" style="color:white; font-size: 1.4vw;">Home</a>
		    			</li>
		    			<li class="nav-item">
		     			 	<a class="nav-link text-body" href="/member/myPage" style="color:white; padding-right: 0; font-size: 1.4vw;">My Page</a>
		    			</li>
		    		</ul>
		    	</div>
		    </div>
    	</c:when>
    	<c:otherwise>
	    	<div class="bg-warning text-dark"> 
		    	<div class="container">
					<ul class="nav justify-content-end" id = "gifter2">
		    			<li class="nav-item">
		      				<a class="nav-link text-body" href="<c:url value="/"/>" style="color: black; font-size: 1.4vw;">Home</a>
		    			</li>
		    			<li class="nav-item">
		      				<a class="nav-link text-body" href="/member/signupForm" style="color: black; font-size: 1.4vw;">Sign Up</a>
		    			</li>
		    			<li class="nav-item">
		     			 	<a class="nav-link text-body" href="/member/loginForm" style="color: black; padding-right: 0; font-size: 1.4vw;">Login</a>
		    			</li>
					</ul>
				</div>
			</div>
		</c:otherwise>
	</c:choose>

<p>
<h2 class="text-center" id="gifter2">Today's Recommendation!</h2>
<p>
<div class="container">
<table class="table table-hover" id="board" style="width:750px;">
	<tr class="d-flex" style="display:block;">
		<th class="ths col-3">
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc1}"/>" width="140" height="140">
		</td>
		<td class="align-middle col-8" >
			${recomTit1} <br>
			${recompri1}
		</td>
		<td class="col-2"></td>
	</tr>
	<tr class="d-flex" style="display:block;">
		<th class="ths col-3">
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc2}"/>" width="140" height="140">
		</td>
		<td class="align-middle col-8" >
			${recomTit2} <br>
			${recompri2}
		</td>
		<td class="col-2"></td>
	</tr>
	<tr class="d-flex" style="display:block;">
		<th class="ths col-3">
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc3}"/>" width="140" height="140">
		</td>
		<td class="align-middle col-8" >
			${recomTit3} <br>
			${recompri3}
		</td>
		<td class="col-2"></td>
	</tr>
	<tr class="d-flex" style="display:block;">
		<th class="ths col-3">
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc4}"/>" width="140" height="140">
		</td>
		<td class="align-middle col-8" >
			${recomTit4} <br>
			${recompri4}
		</td>
		<td class="col-2"></td>
	</tr>
	<tr class="d-flex" style="display:block;">
		<th class="ths col-3">
			<img alt="shoppingPhoto" src="<c:out value="${recomSrc5}"/>" width="140" height="140">
		</td>
		<td class="align-middle col-8" >
			${recomTit5} <br>
			${recompri5}
		</td>
		<td class="col-2"></td>
	</tr>
</table>
</div>

<script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" integrity="sha384-J6qa4849blE2+poT4WnyKhv5vZF5SrPo0iEjwBvKU7imGFAV0wwj1yYfoRSJoZ+n" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>

</body>
</html>