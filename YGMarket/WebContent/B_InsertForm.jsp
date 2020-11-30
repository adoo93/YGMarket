<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>
body { font-family: "Noto Sans KR", sans-serif !important;}
div#header {width: 100%;}
div.container{border-top: 2px solid #6c9414;}
	h2{	margin:20px auto; text-align : center; }
	.content{
	width: 690px;
	height: 138px;
	padding: 30px;
	}
	.table{
		margin-bottom:50px;
		width:1000px;
		/*padding:40px 40px 60px 40px;*/
	}
	th{
		background:#fafcfa;
		text-align : left;
		width:100px;
		padding:15px;
		border-bottom:1px solid #dbdbdb;
	}
	td {padding:15px; width:800px; border-bottom:1px solid #dbdbdb;}
	input {outline:0px solid #dbdbdb;}
	input :focus {outline:1px solid #4c4c4c;}
	#btn_apply{
		background-color: #6c9414;
		font-size: 14px;
		border: none;
		color: #fff;
		width: 95px;
		height: 45px;
		margin-bottom: 5px;
	}
	#btn_cancel{
		background: none;
		font-size: 14px;
		border: 1px solid #6c9414;
		color: #6c9414;
		width: 95px;
		height: 45px;
		margin-bottom: 5px;
	}
	
</style>
</head>
<body>
<div id="header"><jsp:include page="template/header.jsp"></jsp:include></div>
	<h2>문의사항</h2>
<div class = "container">
<%
	String loginId = (String)session.getAttribute("login_id");
%>
<form action="Controller?command=board_insert&loginId=<%=loginId %>" method="post">

<table  class="table" >
	
	<tr>
		<th><label for="title">제목</label></th>
		<td><input type="text" name="title" id="title" style="width:690px; height:22px;"> </td>
	</tr>
	<tr>
		<th><label for="content">내용</label></th>
		<td><input  class="content" type="textarea" name="content" > </td>
	</tr>
	
	
	<tr style="text-align:center">
		<td colspan="2">
			<input type="submit" id="btn_apply" value = "등록"/>
			<input type="reset" id="btn_cancel" value = "취소"/>
		</td>
	</tr>
</table>
</form>
</div>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>