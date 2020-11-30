<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기 화면</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>
   /*.content{
   width: 350px;
   height: 200px;
   padding: 30px;
   }
   .table{
      margin:50px auto;
      width:400px;
      padding:40px 40px 60px 40px;
      border : 1px solid red ;
      background-color : pink;
      box-shadow:0px 0px 20px #afafaf;
      border-radius:30px;
   }
   th{
      text-align : left;
   }*/
	body {width: 1900px; font-family: "Noto Sans KR", sans-serif !important;}
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
<%

String loginId = (String)session.getAttribute("login_id");
String writer = (String)request.getAttribute("writer");
if( ! writer.equals(loginId)) {
%>
<script>
alert("남의 글을 함부로 수정할수 없습니다~~ 작성자를 확인하세요~ ");
window.history.back();
</script>   
<%         
}else{

	response.setContentType("text/html; charset=UTF-8");
	String gettitle = (String)request.getAttribute("title");
	String getcontent = (String)request.getAttribute("content");
	int bno = Integer.parseInt(request.getParameter("bno"));
%>
   <h2 > 글 수정</h2>
<div class = "container">
<form action="Controller?command=board_update" method="post">

<table  class="table" >
   
	<tr>
		<th><label for="title">제목</label></th>
		<td><input type="text" name="title" id="title" style="width:690px; height:22px;" value="<%=gettitle%>"> </td>
	</tr>
	<tr>
		<th><label for="content">내용</label></th>
		<td><input  class="content" type="textarea" name="content" value="<%=getcontent%>"> </td>
	</tr>

	<tr style="text-align:center">
	<input type="hidden" name="bno" value="<%=bno %>"/>
		<td colspan="2">
			<input type="submit" id="btn_apply" value = "등록"/>
			<input type="reset" id="btn_cancel" value = "취소"/>
		</td>
	</tr>
</table>
</form>
</div>
<%} %>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>