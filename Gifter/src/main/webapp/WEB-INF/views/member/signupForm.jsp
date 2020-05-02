<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<html>
<head>
   <meta charset="UTF-8">
   
   
   <meta http-equiv="X-UA-Compatible" content="IE=edge">
   <meta name="viewport" content="width=device-width, initial-scale=1">
   <meta name="description" content="Some ideas for modern button styles and effects">
   <meta name="keywords" content="button, effect, hover, style, inspiration, web design">
   <meta name="author" content="Codrops">
   <link rel="stylesheet" type="text/css" href="css/normalize.css">
   <link rel="stylesheet" type="text/css" href="css/vicons-font.css">
   <link rel="stylesheet" type="text/css" href="css/base.css">
   <link rel="stylesheet" type="text/css" href="css/buttons.css">
   <script type="text/javascript" async="" src="https://ssl.google-analytics.com/ga.js"></script>
   <script type="text/javascript">
var _gaq = _gaq || [];
_gaq.push(['_setAccount', 'UA-7243260-2']);
_gaq.push(['_trackPageview']);
(function() {
var ga = document.createElement('script'); ga.type = 'text/javascript'; ga.async = true;
ga.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://www') + '.google-analytics.com/ga.js';
var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(ga, s);
})();
</script>
   <style>
	body #cdawrap {
		--cda-top: 15px;
		--cda-sp-color: #999;
		--cda-text-color: #333;
		--cda-remove-color: #999;
		--cda-background: transparent;
		--cda-border-color: rgba(255,255,255,0.5);
	}
</style>
<link rel="stylesheet" type="text/css" href="https://tympanus.net/codrops/adpacks/demoad.css?1587939706635">
<link type="text/css" rel="stylesheet" charset="UTF-8" href="https://translate.googleapis.com/translate_static/css/translateelement.css">



   <title>회원가입</title>   
   <script src='https://code.jquery.com/jquery-3.4.1.min.js'></script>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
   <link href="https://fonts.googleapis.com/css2?family=Bangers&family=Open+Sans:ital,wght@1,800&display=swap" rel="stylesheet">
   <link href="https://fonts.googleapis.com/css2?family=Montserrat:ital,wght@1,600&display=swap" rel="stylesheet">
<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>

<script type="text/javascript">

   function formCheck(){
      var member_id = document.getElementById("member_id").value;
      var member_pw = document.getElementById("member_pw").value;
      var member_email = document.getElementById("member_email").value;

      if(member_id.length < 3 || member_id.length > 10){
         alert("아이디는 3~10 글자를 입력하세요");
         return false; 
      }
         
      if(member_pw.length < 3 || member_pw.length > 10){
         alert("비밀번호는 3~10 글자를 입력하세요");
         return false; 
      }

      if(member_email == '' || member_email.length == 0){
         alert("이메일을 입력해주세요");
         return false;
      }
      return true; 
   }
</script>
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
        font-weight: normal;
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
   html{
      height: 100%;
   }
   #setting{
       box-shadow: 0px 4px 4px rgba(0, 0, 0, 0.25); 
      
   }
   .form-control{
      font-family: 'Montserrat', sans-serif;
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
                     <a class="nav-link text-body" href="<c:url value="/"/>" style = "font-size: 1.5vw;">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link text-body" href="/member/loginForm" style="padding-right: 0; font-size: 1.5vw;">Login</a>
                </li>
              </ul>      
         </div>
         
         <div id="setting" class="container border border-dark align-self-center align-items-center mx-auto m-5 pb-5"  style="width:320px; height:320px; background-color: white; background: rgba(255, 255, 255, 0.25); ">
         <div class="text-center">
            <h2 style="color: black;">Sign Up</h2>   
         </div>
         <div  class="d-flex justify-content-center align-items-center ">
              <form action="signup" method="post" id = "sign_up_box">
                 <div class="form-group">          
                     <label for="id" style="color: black;">ID</label>          
                     <input type="text" class="form-control" placeholder="Please enter 3 to 10 characters" id="member_id" name="member_id" style="width:250px; height:25px; font-size:13px;">      
                </div>         
             <div class="form-group">
                  <label for="pwd" style="color: black;">Password</label>
                  <input type="password" class="form-control" placeholder="Please enter 3 to 10 characters" id="member_pw" name="member_pw" style="width:250px; height:25px; font-size:13px;">
             </div>
             <div class="form-group">          
                  <label for="email" style="color: black;">Email</label>          
                  <input type="email" class="form-control" placeholder="Email to be authenticated" id="member_email" name="member_email" style="width:250px; height:25px; font-size:13px;">      
             </div>   
             <div class="form-group text-center">
                 <button type = "submit" id="btn1" class ="btn-img" onclick="return formCheck();">
    			 <img src="/resources/icon/right-tick.png" style = "width :2.2vw; " >
    			</button>
    					&emsp;&emsp;&emsp;&emsp;
    					<a href="<c:url value="/"/>">
    					<img style = "width: 2.2vw;" src = "/resources/icon/cancel.png"/></a>   	                 
             </div>
              </form>
         </div>
      </div>
                  
       </div>   
       <div class="box3">
             <br/>
             <div class="container">
            <ul class="nav justify-content-start">
                <li class="nav-item">
                     <a class="nav-link text-body" href="/category/bestForm" style="padding-left: 0; font-size: 1.5vw;">Best</a>
                </li>
                <li class="nav-item">
                     <a class="nav-link text-body" href="/category/viewCategory" style = "font-size: 1.5vw;">viewCategory</a>
                </li>
              </ul>   
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