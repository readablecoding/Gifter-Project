<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
<meta charset="UTF-8">
<title>회원 탈퇴</title>
<script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" >
<link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/gh/projectnoonnu/noonfonts_2001@1.1/MapoFlowerIslandA.woff">
	<link href="https://fonts.googleapis.com/css2?family=Bangers&display=swap" rel="stylesheet">

<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>
<script>
	$(function(){
		$("#yes").click(function(){
			$("#sign").hide();
			$("#yes").hide();
			$("#no").hide();
			var str = "";
			str += "<br/><br/><br/>";
			str += "<div class='container border  border-dark align-self-center align-items-center mx-auto m-5 pb-5' style='width:380px; height:240px; margin-left: 390px; margin-top: 135px; background-color: white;  border-radius: 10px;'>";
			str += "<form action='/member/deleteMember' method='post'>";
			str += "<div class='form-group'><label for='id' style='color: black;'>ID</label>";
			str += "<input type='text' class='form-control' name='member_id' value='${member_id}' readonly='readonly'></div>"
			str += "<div class='form-group'><label for='password' style='color: black;'>Password</label>";
			str += "<input type='password' class='form-control' id='member_pw' name='member_pw'></div>";
			str += "<div class='form-group text-center'>";
			str += "<button type = 'submit' id='btn1' class ='btn-img' onclick='return formCheck();'>";
			str += "<img src='/resources/icon/right-tick.png' style = 'width :2.2vw;' >";
			str += "</button>";
			str += "&emsp;&emsp";
			str += "<a href='<c:url value='/'/>'>";
			str += "<img style = 'width: 2.2vw;' src = '/resources/icon/cancel.png'/></a></div>";

			$("#next").append(str);
		});

		
		$("#no").click(function(){
			location.href="/";
		});		
	
	});
	function formCheck(){		
		
		var member_pw = $("#member_pw").val();
		
		if(member_pw.length == 0 || member_pw == ''){
			alert("비밀번호를 입력해주세요.");
			return false; 
		}
		var result = confirm("탈퇴하시겠습니까?");

		if(result == false){
			return false;
		}
		
		return true; 
	}
	
</script>
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
	}
	.main {
  		display: grid;
  		grid-template-columns: 20% 80%;
  		/* grid-template-rows: 100%; 	 */	
  		height: 100%; 
  		width: 100%;	
  		font-family: 'Open Sans', sans-serif; 		
	}
	#sign{
       box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); 
      
   }
   h2{
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
	#yes, #no{
   	border-style : none;
   	background-color: rgba(255, 255, 255, 0); 
   	
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
      					<a class="nav-link text-body" href="/category/bestForm" style="font-size: 1.2vw;">Best</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/category/viewCategory" style="font-size: 1.2vw;">viewCategory</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/about" style="color: black; font-size: 1.2vw;">About</a>
    				</li>
    				<li class="nav-item">
      					<a class="nav-link text-body" href="/member/logout" style="font-size: 1.2vw;">Logout</a>
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
				 						
	 	</c:otherwise>
	 </c:choose>
		
		<br/><br/>
		<div id="setting">
		<div id="sign" class="text-center border border-dark" style="width: 350px; height: 150px; background-color: white; margin-left: 390px; margin-top: 135px; background: rgba(255, 255, 255, 0.25);  border-radius: 10px;">
			<div >
			<h2 style="color: black;">회원 탈퇴하시겠습니까?</h2> 
			<br/>
			</div>
			
			<button type = "submit" id="yes" class ="btn-img">
    			 <img src="/resources/icon/right-tick.png" style = "width :2.2vw; " >
    			</button>
			&emsp;&emsp;
			<button type = "submit" id="no" class ="btn-img"">
    			 <img src="/resources/icon/cancel.png" style = "width :2.2vw; " >
    			</button>
			
		</div>
		<div id="next">
	
		</div>
		</div>	

      	</div>
     
    </div>
</body>
</html>