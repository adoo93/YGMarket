<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 찾기 폼</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>

/*
section_login .find_view .tit_label {
   display: block;
   padding: 11px 0 7px;
   font-size: 12px;
   line-height: 18px;
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
}*/
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
.find_view {font-size:17px; margin-top:50px; margin-bottom:50px; padding-bottom:100px;}
input[type="text"] {
   border:1px solid #cccccc;
   width:302px;
   height:42px;
   padding-right:14px;
   padding-left:14px;
   display: block;
}

input[type="submit"] {
   margin: 5px 5px 5px 38px;
   padding: 12px;
   width: 280px;
   text-algin: center;
   background-color: #6c9414;
   border: none;
   color: white;
}
strong {
   font-weight: bold;
   padding-bottom:3px;
}
.tit_login {
   text-align: center;
}
.tit_label {
   padding-left:10px
}
.section_login {
	margin-top:200px;
	margin:auto;
	margin-bottom:40px;
	width:370px; 
	position:inline-block;
}
</style>
</head>
<body id="container">
   <div class="header"><jsp:include page="template/header.jsp"></jsp:include></div>
   <form action="Controller?command=member_findId" method="post">
      <div class="section_login">
         <h2 class="tit_login" style="margin-top:250px;">아이디 찾기</h2>
         <div class="write_form find_view">
            <strong class="tit_label">이름</strong><br /><br/>
        	<input type="text" name="name" id="name" placeholder="고객님의 이름을 입력해주세요"/><br/><br/>
            <strong class="tit_label">이메일</strong><br /><br/>
            <input type="text" name="email" id="email" placeholder="가입 시 등록하신 이메일 주소를 입력해주세요"/><br/><br/>
             <input type="submit" size="29" value="확인" />
         </div>
      </div>
   </form>
   <jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>