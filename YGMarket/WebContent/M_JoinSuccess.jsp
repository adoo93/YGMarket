<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입 성공</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<style>
	body{width:1900px; font-family: "Noto Sans KR", sans-serif !important;}
	div#header {width:100%;}
	h2{	text-align : center; }
	div#table{
		width:830px;
		height: 414px;
		border-top: 1px solid black;
		border-bottom: 1px solid black;
		margin-top:120px;
		margin-bottom:100px;
		background-color : #fafcfa;
	}
	.table{
		margin:50px auto;
		width:500px;
		height:39px;
		padding:40px 40px 60px 40px;
		background-color : #fafcfa;
		/*border-radius:30px;*/
	}
	th{font-size:16px; text-align:center; width:100px;}
	td{font-size:16px; width:250px;	}
	#log {
    background-color: #fff;
    border: 1px solid #6c9414;
    color: #6c9414;
    width: 180px;
    height: 34px;
	}
	#my {
	background-color: #6c9414;
    border: none;
    color: #fff;
    width: 180px;
    height: 34px;
	}
</style>
</head>
<body>
<div id="header"><jsp:include page="template/header.jsp"></jsp:include></div>
<div id="table">
<table  class="table" >
	<h2>회원가입이 완료되었습니다</h2>
	<tr>
		<th><label for="ID">아이디</label></th>
		<td>${mBean.ID }</td>
	</tr>
	<tr>
		<th><label for="name">이름</label></th>
		<td>${mBean.name }</td>
	</tr>
	<tr>
		<th><label for="email">이메일</label></th>
		<td>${mBean.email }</td>
	</tr>
	<tr>
		<th><label for="address">주소</label></th>
		<td>${mBean.address }</td>
	</tr>
	
	<tr style="text-align:center">
		<td colspan="2"><input type="button" id="log" onclick="location.href='M_LoginForm.jsp'" value="로그인페이지로 이동">
		<input type="button" id="my" onclick="location.href='M_MyPage.jsp'" value="마이페이지로 이동"></td>
	</tr>
</table>
</div>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>