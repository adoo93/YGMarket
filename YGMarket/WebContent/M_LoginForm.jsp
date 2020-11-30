<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>M_LoginForm</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>
	body {
		font-family: "Noto Sans KR", sans-serif !important;
		font-size:16px !important;
		min-height:462px;
	}
	h2{
		margin: 20px auto;
		text-align: center;
	}
	table{
		margin: 50px auto;
		width:340px;
		height: 296px;
		padding: 0px 40px 100px 40px;
	}
	td > input#log {
		font:"Noto Sans KR", sans-serif;
		font-size:14px;
		width:302px;
		height:42px;
		text-align: left;
		padding-right:14px;
		padding-left:14px;
		border:1px solid #cccccc;
	}
	ul{
		list-style: none;
	}
	.find li{
		/* display: inline-block;*/
		font-size: 12px;
		float: right;
		padding: 10px;
		list-style:none;
	}
	h2{
		margin: 20px auto;
		text-align: center;
	}
/*	.gnb_kurly {font-size:16px;}	*/
	#text_btn_login {
	    background-color: #6c9414;
	    font-size:14px;
	    border: none;
	    color: #fff;
	    width: 345px;
	    height: 45px;
	    margin-bottom: 5px;
	}
	#text_btn_join {
	    background: none;
	    font-size:14px;
	    border: 1px solid #6c9414;
	    color: #6c9414;
	    width: 345px;
	    height: 45px;
	    margin-bottom: 5px;
	}
	a {text-decoration:none; color:#636363;}
</style>
<%
	if("fail".equals(request.getParameter("login"))){
%>
<script>
	alert("아이디 또는  비밀번호가 일치 하지 않습니다~");
</script>
<%
	}
%>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>
<div class = "container">
	<form action="Controller?command=member_login" method="post">
	<table id="table">
	<h2> 로그인  </h2>
		<tr><td> <input type="text" name ="ID" id="log" placeholder="아이디를 입력해주세요"/></td></tr>
		<tr><td><input type="password" name ="PW" id="log" placeholder="비밀번호를 입력해주세요"/></td></tr>
		<tr><td class="find"> 
			<li><a href="M_Find_Pw.jsp">비밀번호 찾기</a></li>
			<li><a href="M_Find_Id.jsp">아이디 찾기</a></li>
		</td></tr>
		<tr style="text-align: center">
			<td colspan="2" ><input type="submit" id="text_btn_login" value="로그인"/></td>
		</tr>
		<tr style="text-align: center" id="btn">	
			<td colspan="2"><input type="button" id="text_btn_join" value="회원가입" onclick="location.href='M_JoinForm.jsp'"/></a></td>
		</tr>
	</table>
	</form>
</div>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>