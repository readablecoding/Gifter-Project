<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
<link href="https://fonts.googleapis.com/css2?family=Sunflower:wght@500&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff">

<title>CategoryView</title>
<script src="/resources/jquery-3.4.1.js"></script>
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
	/*가격 */
  	color: 	#ffffff;
  	font-weight: bold;
  	margin: 0;
  	padding: 0;
}

/*전체 배경*/
body {
	background-color:	#000000;
	font-size: 1.0rem;
}
/*카테고리 보여주는 부분*/
table {
	/* background: #53cec2; */
	background : #000000;
	table-layout:fixed; 
	margin-left:auto;
	margin-right:auto;
}

/* .ths {
	width:180px;
	scope:row;
} */

/*사이사이 흰 줄*/
.table td, .table th {
    padding: .70rem;
    vertical-align: top;
    border-top: 7px solid #ffffff;
}
/*테이블 마우스 호버*/
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

/*클릭 된 페이지 */
.page-item.active .page-link {
    color: #000000;
    background-color: #ffffff;
    border-color: #ffc107;
}

/*페이지에 마우스 호버 했을 때*/
.pagination a:hover {
	background-color: #ffc107;
	color : #000000;
	font-color:#000000;
}

/*페이지 버튼 눌렸을 때*/
.pagination a:focus {
	background-color: #ffc107;
}

#floatMenu {
	position : absolute;
	right: 80px;
	top:120px;
	
}

img {
	display: block; margin: 0px auto; 
}

td img{
    display: block;
    margin-left: auto;
    margin-right: auto;

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
	    	<div class="bg-warning text-dark"> 
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
	
	<!-- 추천페이지 버튼 -->
	<div class="container">	
		<!-- <div style="padding:10px;"> -->
		<div style="position: relative; left: 730px; top: 10px;"> 
			<div class="d-flex justify-content-between">
				<ul class="list-group" id = "gifter2" style= "color:#000000;">
				  <li class="list-group-item d-flex justify-content-between align-items-center">
				    <a href="recommendList">Recommendation</a><br>
				    <span class="badge badge-danger badge-pill">3</span>
				  </li>
				</ul>
			</div>
		</div>
	</div>
	
	<!-- 스크롤 배너 -->
	<!-- <div id="floatMenu" style="position: fixed; right: 80px;bottom:300px;"> -->
	<div id="floatMenu">
		<div id="gifter2">
			<table style="text-align: center; width:160px; ">
				<tr>
					<td class="align-middle col-8" >
						recommend
					</td>
				</tr>
				<tr>
					<td class="align-middle ths" height="120px">
						<img alt="shoppingPhoto" src="<c:out value="${recomSrc1}"/>" width="100" height="100">
					</td>
				</tr>
				<tr>
					<td class="align-middle ths">
						<img alt="shoppingPhoto" src="<c:out value="${recomSrc2}"/>" width="100" height="100">
					</td>
				</tr>
				<tr>
					<td class="align-middle" >
						<a href="recommendList">>> more</a>
					</td>
				</tr>
			</table>
		</div>
	</div>
	
<!-- <div class="row">
    <div class="col-sm-6">전체 컨테이너의 절반 크기로 띄우게 됨 -->
<!-- style="max-width:500px" 잠깐 수정 -->

<!-- 테이블 -->
<div class="container-sm" id="board" style="letter-spacing: -.03200rem;">
<table class="table table-hover" style="width:750px;" id = "gifter3">
	<c:forEach items="${srcs}" varStatus="sta">
	<c:set var="flag" value="false"/>
		<tr class="d-flex" style="display:block;">
		<c:if test="${not flag}" >
				<c:forEach items="${srcs}" var="src"
				begin="${navi.countPerPage * (navi.currentPage-1)}" end="${navi.countPerPage * navi.currentPage - 1}" varStatus="status">
					<c:if test="${sta.index eq status.index}">
					
						<th class="ths col-3">
							<img alt="shoppingPhoto" src="<c:out value="${src}"/>" width="150" height="150">
						</th>
						
						<c:set var="flag" value="true"/>
						
					</c:if>
				</c:forEach>
		</c:if>
		
		<c:set var="flag" value="false"/>
		<c:if test="${not flag}" >                            
				<c:forEach items="${title}" var="tit" 
				begin="${navi.countPerPage * (navi.currentPage-1)}" end="${navi.countPerPage * navi.currentPage - 1}" varStatus="status2">
					<c:if test="${sta.index eq status2.index}">
					
						<input type="hidden" id="title${status2.index}" value="<c:out value="${tit}"/>">
						
						<td class="align-middle col-8" >
							<div id="blank${status2.index}"></div>
							<p>
							<div id="blanks${status2.index}"></div>
						</td>
						<td class="col-2"></td>
						<input type="hidden" id="titSize" value="${navi.currentPage}">
						
						<c:set var="flag" value="true"/>
						
					</c:if>
				</c:forEach>
		</c:if>
		</tr>	
	</c:forEach>
</table>

<c:forEach items="${prices}" var="price" varStatus="status3">
	<input type="hidden" id="price${status3.index}" value="<c:out value="${price}"/>">
</c:forEach>
			
<!-- 페이징 처리 -->
<nav aria-label="Page navigation example">
 <div class="text-center">
 <ul class="pagination pg-red justify-content-center">
 
<%--<li class="page-item">
	<a class="page-link" href="javascript:paging('${navi.countPerPage - navi.pagePerGroup}')" aria-label="Previous">
	<span aria-hidden="true"></span>
	</a>
	</li> --%>
	
	<li class="page-item">
	<a class="page-link" href="javascript:paging('${navi.currentPage - 1}')" aria-label="Previous">
	<span aria-hidden="true">&laquo;</span>
	<span class="sr-only">Previous</span>
	</a>
	</li>
	
		<c:forEach var="counter" begin="${navi.startPageGroup}" end="${navi.endPageGroup}">
			<c:choose>
				<c:when test="${counter eq navi.currentPage}">
					<li class="page-item active" aria-current="page">
      					<a class="page-link" href="javascript:paging('${counter}')">${counter}<span class="sr-only">(current)</span></a>
    				</li>
				</c:when>
				<c:otherwise>
					<li class="page-item"><a class="page-link" href="javascript:paging('${counter}')">${counter}</a></li>
				</c:otherwise>
			</c:choose>
		</c:forEach>
		
	<li class="page-item">	
	<a class="page-link" href="javascript:paging('${navi.currentPage + 1}')" aria-label="Next">
	<span aria-hidden="true">&raquo;</span>
	<span class="sr-only">Next</span>
	</a>
	</li>
	
<%--<li class="page-item">
	<a class="page-link" href="javascript:paging('${navi.countPerPage + navi.pagePerGroup}')" aria-label="Previous">
	<span aria-hidden="true">&raquo;</span>
	</a>
	</li> --%>
	
  </ul>
  </div>
</nav>

	<input type="hidden" name="currentPage" id="currentPage">
	
</div>

<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" integrity="sha384-Q6E9RHvbIyZFJoft+2mJbHaEWldlvI9IOYy5n3zV9zzTtmI3UksdQRVvoxMfooAo" crossorigin="anonymous"></script>
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" integrity="sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6" crossorigin="anonymous"></script>	

<script type="text/javascript">
// 페이징 (이동)
function paging(page){

	var currentPage2 = $("#currentPage").val();
	currentPage2 = page;
	
	location.href="selePageMove?currentPage="+currentPage2;
}
</script>

<script type="text/javascript">
//타이틀,가격 innerHTML
$(function () {
	var titSize = $("#titSize").val();

	for(var i = ${navi.countPerPage * (navi.currentPage-1)}; i < ${navi.countPerPage * navi.currentPage}; i++){
		
		var temp1 = "#title" + i;
		var title = $(temp1).val();
		
		var temp2 = "#price" + i;
		var price = $(temp2).val();
		
		var temp3 = "#blank" + i;
		var temp4 = "#blanks" + i;

		$(temp3).html(title);
		$(temp4).html(price);
	}
})
</script>

<script type="text/javascript">
// 배너 스크롤 이동
$(function(){
	// 기존 css에서 플로팅 배너 위치(top)값을 가져와 저장한다.
	 var floatPosition = parseInt($("#floatMenu").css('top'));
 	
	 // 250px 이런식으로 가져오므로 여기서 숫자만 가져온다. parseInt( 값 );

	 $(window).scroll(function() {
	    // 현재 스크롤 위치를 가져온다.
	    //alert(1);	
	    var scrollTop = $(window).scrollTop();
	    var newPosition = scrollTop + floatPosition + "px";
	       /* 애니메이션 없이 바로 따라감*/
	     //$("#floatMenu").css('top', newPosition);
	     
	    $("#floatMenu").stop().animate({
	        "top" : newPosition
	     }, 500);
	 }).scroll();
})
</script>

</body>
</html>