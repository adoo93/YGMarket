<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.yg.dao.MemberDao"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 폼 창</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<%
   MemberDao mDao = MemberDao.getInstance();
%>
<script>
   function inputIdChk(){
         document.userInfo.idDuplication.value="idUncheck";
      }
   function openIdCheck(){
         window.name = "parentForm";
         window.open("M_idCheckForm.jsp","chkForm","width=500,height=300,resizable=no");
      }

   /* function idCheck(){
      alert("버튼클릭");
      var id = document.form.id.value;
      boolean idCheck = mDao.idCheck(id);
      if(idCheck=true){
         alert("사용 가능한 아이디입니다.");
      }else{
         alert("중복된 아이디입니다.");
      }
   } */
</script>
<style>
	div#header {width:100%;}
	h2{	text-align : center; }
   body{
		font-family: "Noto Sans KR", sans-serif !important;
      display:block;
      box-sizing:border-box;
   }
   .table{
      border-top:1px solid #333;
      font-family:noto sans;
      font-weight:400;
      letter-spacing:0;
      border-collapse:collapse;
      border-spacing:0;
      box-sizing:border-box;
      margin:0;
      padding:0;
      display:table;
      border-color:grey;
      float:center;
      
   }
   tr{
      border-color:inherit;
      width:640px;
      height:73px;
      -webkit-box-sizing:border-box;
   }
   .member_join td{
      padding-top:10px;
      padding-bottom:10px;
      width:481px;
      heigth:64px;
   }
   .field head{
      width:640px;
      height:153.667px;
   }
   .member_join{
      position:center;
      width:640px;
      margin:0 auto !important;
      font-size:12px;
      font-family:noto sans;
      font-weight:400;
      letter-spacing:0;
      box-sizing:border-box;
   }
   .tit {
       padding-top: 64px;
       font-weight: 900;
       font-size: 30px;
       color: #333;
       line-height: 40px;
       text-align: center;
       letter-spacing: -.5px;
   }
   .tbl_comm{
      
      border-top:1px solid #333;
      border-bottom:1px solid #333;
      height:500px;
   }
   .member_join .tbl_comm .fst th {
       padding-top: 29px;
       width:159px;
   }
   .member_join th {    
      width:159px !important;
       padding: 20px 0 0 20px;
       font-weight: 700;
       font-size: 14px;
       color: #333;
       line-height: 20px;
       vertical-align: top;
       text-align: left;
       padding-left:20px;
       padding-top:20px;
   }
   .member_join .tbl_comm .fst td {
       padding-top: 19px;;
   }
   .member_join td {
       padding: 10px 0;
       border-top: 0;
       font-size: 14px;
       vertical-align: top;
       text-align: left;
   }
   .member_join input[type=text], .member_join input[type=password] {
       width: 302px;
   }
   .type_form textarea, .type_form input[type=text], .type_form input[type=password] {
       height: 42px;
       padding: 0 14px;
       border: 1px solid #ccc;
       font-size: 14px;
       color: #333;
       line-height: 20px;
       border-radius: 3px;
       background: #fff;
       outline: none;
       vertical-align: top;
   }
   .type_form .btn.default {
       border: 1px solid #6c9414;
       background-color: #fff;
       color: #6c9414;
       height:42px;
       width:118px;
       margin:0px 0px 0px 5px;
       border-radius: 3px;
       font-weight: 700;
       font-size: 14px;
       line-height: 40px;
       text-align: center;
       outline: none;
       box-sizing: border-box;
       margin: 0;
       padding: 0;
       cursor:pointer;
   }
   #wrap{
      width:875.333px;
      min-height:500px;
      text-align:center;
   }
   .btn_join{
      width:240px;
      height:56px;
      font-size:16px;
      line-height:54px;
      font-weight:700;
      taxt-align:center;
      outlint:none;
      background-color:#6c9414;
      border: 1px solid #6c9414;
      color:white;
      border-radius:3px;
      vertical-align:top;
      cursor:pointer;
   }
   .form_footer {
       padding-top: 40px;
       text-align: center;
       display: inline-block;
       text-align:center;
       margin:0 auto;
       width:640px;
       padding-top:25px;
   }
   .tr1{
	   height:0.2px;
   }
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
   margin-bottom: 100px;
   display :inline-block;	
}
</style>
</head>
<body>
<div class="header"><jsp:include page="template/header.jsp"></jsp:include></div>
<div id="wrap" class="wrap">
<div class="type_form member_join">
<div class="field head">
   <h2 class="tit" style="text-align:center;"> 회원가입</h2>
</div>
<div class = "container">
<!-- <form action="Ex302_join.jsp" method="get"> -->
<form action="Controller?command=member_join" name="userInfo" method="post">

<table  class="tbl_comm" >
   
   <tr class="fst">
      <th><label for="name">이름</label></th>
      <td><input type="text" name="name" id="name" placeholder="이름을 입력해주세요"> </td>
   </tr>
   <tr>
      <th><label for="ID">아이디</label></th>
      <td><input type="text" name="ID" id="ID" onkeydown="inputIdChk()" placeholder="아이디를 입력해주세요"> 
         &nbsp; <input type="button" value="중복확인" class="btn default" onclick="openIdCheck()"/>   
         <input type="hidden" name="idDuplication" value="idUncheck">
      </td>
   </tr>
   <tr>
      <th><label for="PW">비밀번호</label></th>
      <td><input type="password" name="PW" id="PW" placeholder="비밀번호를 입력해주세요"> </td>
   </tr>
   <tr>
      <th><label for="email">이메일</label></th>
      <td><input type="text" name="email" id="email" placeholder="이메일을 입력해주세요"> </td>
   </tr>
   <tr>
      <th><label for="phone">연락처</label></th>
      <td><input type="text" name="phone" id="phone" placeholder="전화번호를 입력해주세요"> </td>
   </tr>
   <tr>
      <th><label for="address">주소</label></th>
      <td><input type="text" name="address" id="address" placeholder="주소를 입력해주세요"> </td>
   </tr>
   
   <tr class="tr1" style="text-align:center">
      <div class="form_footer" >
<!--       <td><input type="reset" value = "취소"/></td> -->
      </div>
   </tr>
</table>
      <td><input type="submit" class="btn_join" value = "가입하기" style="margin-top:30px"/></td>
</form>
</div>
</div>
</div>
<div><jsp:include page="template/footer.jsp"></jsp:include></div>
</body>