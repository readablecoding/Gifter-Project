<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<!-- Bootstrap cdn 설정 -->
<!-- <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap-theme.min.css">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css"> -->
<script src="https://code.jquery.com/jquery-3.4.1.min.js"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
<title>검색 결과</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<style>
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

	body {
		background-color:	#ffffff;
	}
	
	  table {
	  	table-layout:fixed; 
		margin-left:auto;
		margin-right:auto;
	  }
	  th {
	    width: 300px;
	    height: 50px;
	  }
	  td {
	  	width : 300px;
	  	hegiht : 300px;
	  }
	  .container2 {
		  display: flex;
		  width: 90%;
		  padding: 4% 2%;
		  box-sizing: border-box;
		  height: 80vh;
		  font-family: 'Bangers', cursive; 
		}
		
		.box {
		  flex: 1;
		  overflow: hidden;
		  transition: .5s;
		  margin: 0 2%;
		  box-shadow: 0 20px 30px rgba(128, 124, 122, 0.84);
		  line-height: 0;
		}
		
		.box > img {
		  width: 200%;
		  height: calc(100% - 10vh);
		  object-fit: cover; 
		  transition: .5s;
		}
		
		.box > span {
		  font-size: 3.8vh;
		  display: block;
		  text-align: center;
		  height: 5vh;
		  line-height: 2.6;
		}
		
		.box:hover { flex: 1 1 50%; }
		.box:hover > img {
		  width: 100%;
		  height: 100%;
		}
 
</style>
<script>
	$(function() {
		$("#btn1").click(function(){
			var str = '';
			str += "<form><table class='table'>";
			str += "<tr><th>4th</th>";
			str += "<th>5th</th>";
			str += "<th>6th</th></tr>";
			str += "<tr><td><img alt='beverage' src='${pageContext.request.contextPath}/resources/searchImg/beverage.jpg' width='300' height='300'/></td>";
			str += "<td><img alt='snacks' src='${pageContext.request.contextPath}/resources/searchImg/snacks.jpg' width='300' height='300'/></td>";
			str += "<td><img alt='fruit' src='${pageContext.request.contextPath}/resources/searchImg/fruit.jpg' width='300' height='300'/></td></tr>";
			str += "<tr><th>7th</th>";
			str += "<th>8th</th>";
			str += "<th>9th</th></tr>";
			str += "<tr><td><img alt='refrigerator' src='${pageContext.request.contextPath}/resources/searchImg/refrigerator.jpg' width='300' height='300'/></td>";
			str += "<td><img alt='car' src='${pageContext.request.contextPath}/resources/searchImg/car.jpg' width='300' height='300'/></td>";
			str += "<td><img alt='TV' src='${pageContext.request.contextPath}/resources/searchImg/TV.jpg' width='300' height='300'/></td></tr>";
			str += "<tr><th>10th</th>";
			str += "<th></th>";
			str += "<th></th></tr>";
			str += "<tr><td><img alt='chicken' src='${pageContext.request.contextPath}/resources/searchImg/chicken.jpg' width='300' height='300'/></td>";
			str += "<td></td>";
			str += "<td></td></tr>";
			str += "</table></form>";
			$("#first").append(str);
			$("#btn1").fadeOut();
		});
		
	})
</script>

<script type="text/javascript">
function moveCategory(categoryName){
	var age_range = "20대"
	var gender = "여성"
	location.href = "/category/viewCategory?age_range="+age_range+"&gender="+gender+"&categoryName="+categoryName;
}
</script>
</head>
<body>
	<!-- 배너 -->
	<c:choose>
	 	<c:when test="${sessionScope.member_id != null}">
			<div class="bg-secondary"> 
				<div class="container">
					<ul class="nav justify-content-end" id = "gifter2">
						<li class="nav-item">
		      				<a class="nav-link text-body" href="<c:url value="/"/>" style="color:white; font-size: 1.5vw;">Home</a>
		    			</li>
		    			<li class="nav-item">
		     			 	<a class="nav-link text-body" href="/member/myPage" style="color:white; padding-right: 0; font-size: 1.5vw;">My Page</a>
		    			</li>
		    		</ul>
		    	</div>
		    </div>
    	</c:when>
    	<c:otherwise>
	    	<div class="bg-secondary"> 
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
			</div>
		</c:otherwise>
	</c:choose>
	<div style="color:white;">
	
	<br/>
	</div>
	
	
<%-- <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
    <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner">
    <div class="carousel-item active">
      <img class="d-block w-100" alt="cosmetic" src="${pageContext.request.contextPath}/resources/searchImg/Cosmetic.jpg" width="300" height="300"/>
    	<div class="carousel-caption d-none d-md-block">
		    <h5>First.</h5>
		    <p></p>
  		</div>	
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" alt="smartPhone" src="${pageContext.request.contextPath}/resources/searchImg/smartPhone.jpeg" width="300" height="300"/>
    </div>
    <div class="carousel-item">
      <img class="d-block w-100" alt="clothes" src="${pageContext.request.contextPath}/resources/searchImg/clothes.jpg" width="300" height="300"/>
    </div>
  </div>
  <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
    <span class="carousel-control-prev-icon" aria-hidden="true"></span>
    <span class="sr-only">Previous</span>
  </a>
  <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
    <span class="carousel-control-next-icon" aria-hidden="true"></span>
    <span class="sr-only">Next</span>
  </a>
</div> --%>
	
	
	
	<div class="container2">
	

			<c:forEach var="item" items="${taker }" begin="0" end="4" step="1">
				<div class= "box">
					<a href="javascript:moveCategory('${item.category_name }');">
					<img alt="${item.category_name }" src="${pageContext.request.contextPath}/resources/searchImg/${item.category_name }.jpg" width= "700px" height="400px"/>
					</a>
					<span>${item.category_name }</span>
				</div>
			</c:forEach>
			<div class="center">
			<input type="button" id="btn1" value="More..."><br/><br/></div>
			</div>
			
				<%-- <td>
					<a href="javascript:moveCategory();">
					<img alt="cosmetic" src="${pageContext.request.contextPath}/resources/searchImg/Cosmetic.jpg" width="300" height="300"/>
					</a>	
				</td>
				<td>
					<img alt="smartPhone" src="${pageContext.request.contextPath}/resources/searchImg/smartPhone.jpeg" width="300" height="300"/>
				</td>
				<td>
					<img alt="clothes" src="${pageContext.request.contextPath}/resources/searchImg/clothes.jpg" width="300" height="300"/>
				</td> --%>
				
		
		
		
	
	
	
</body>
</html>