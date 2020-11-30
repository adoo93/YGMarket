<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>
/*
section_login .find_view .tit_label {
   display: block;
   padding: 11px 0 7px;
   font-size: 12px;
   line-height: 18px;
}

.tit_login {
   text-align: center;
}

.tit_label {
   float: left;
   margin-left: 5px;
   text-align: left;
}

.section_login * {
   font-family: noto sans;
   color: #333;
}

b, strong {
   font-weight: 700;
}

*, *:after, *:before {
   -webkit-box-sizing: border-box;
   -moz-box-sizing: border-box;
   box-sizing: border-box;
   margin: 0;
   padding: 0;
}

user agent stylesheet


.section_login .find_view {
   padding-top: 26px;
   text-align: center;
}

div, th, td, li, dt, dd, p {
   word-break: break-all;
}

body, input, select, textarea, button {
   font-family: malgun gothic, AppleGothic, dotum;
   line-height: 1;
   letter-spacing: -.05em;
   color: #4c4c4c;
   font-size: 12px;
   max-width: 100%;
}

html {
   font-family: sans-serif;
   -ms-text-size-adjust: 100%;
   -webkit-text-size-adjust: 100%;
}

width:400px;

    
margin: 0 auto;

    
padding-top: 90px;

    
letter-spacing: -.6px;
}
user agent stylesheet
div {
   display: block;
}
*/
*{font-family: "Noto Sans KR", sans-serif !important;}
.header{
	position:fixed;
	top:0;
	left: 0;
	right: 0;
	background-color:#fff;
}

.wrap{
	width: 90%;
   margin-left: auto;
   margin-right: auto;
   margin-top : 215px;
   display :inline-block;
}
#container {
   height: 300px;
   padding-top: 20px;
   margin:auto;
}

input[type="text"] {
   margin: 5px;
   padding: 8px;
   width: 280px;
   display: block;
}

input[type="submit"] {
   margin: 5px;
   padding: 12px;
   width: 280px;
   text-algin: center;
   background-color: #6c9414;
   border: none;
   color: white;
}
h2 {text-align:center; margin-bottom:0;}
p { font-size: 18px; }
strong { font-weight: bold; }
.section_login { margin:auto; width:360px; position:inline-block;}
.find_view {font-size:17px; margin-bottom:50px; padding-bottom:100px;}
</style>
</head>
<body>
<div><jsp:include page="template/header.jsp"></jsp:include></div>
<div id="container">
<form action="Controller?command=member_findPw" method="post">
   <div class="section_login">
   <h2>비밀번호 찾기</h2><br/><br/>
   <div class="write_form find_view">
      <strong class="tit_label">이름</strong><br/>
      <input type="text" name="name" id="name" placeholder="고객님의 이름을 입력해주세요"/><br/>
      
      <strong class="tit_label">아이디</strong><br/>
	  <input type="text" name="ID" id="id" placeholder="고객님의 이름을 입력해주세요"/><br/>
	  
      <strong class="tit_label">이메일</strong><br/>
	  <input type="text" name="email" id="email" placeholder="가입 시 등록하신 이메일 주소를 입력해주세요"/><br/>
      <br/>
      
<input type="hidden" name="act" value="Y">
<input type="hidden" name="rncheck" value="none">
<input type="hidden" name="dupeinfo" value="">

         <input type="submit" value="확인"/>
   </div>
   </div>
</form>
<jsp:include page="template/footer.jsp"></jsp:include>
</div>
</body>
</html>