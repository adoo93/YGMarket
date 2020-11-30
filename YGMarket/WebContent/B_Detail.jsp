<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<script>
	$(function {
		$("#delete").click(function() {
			var response = comfirm("이 글을 정말로 삭제하시겟습니까?");
			});
		});
</script>

<style>
	h2 {margin-top:50px;}
	*{font-family: "Noto Sans KR", sans-serif !important;}
	.header{
		position:fixed;
		top:0;
		left: 0;
		right: 0;
		background-color:#fff;
	}
	 div#header {width:100%; background-color:#fff;}
	 table{
		margin: 50px auto;
		width:900px;
		border-top:1px solid #6c9414;
		padding: 10px 0px 100px 0px; 
		font-size:16px;
	}
	.reply {margin-top:50px;}
	h2{
		margin-top:250px;
		text-align: left;
	}
	 .sub_tit{font-size:12px; color:#999999;}
	#border {border-top:1px solid #e8e8e8}
	 th{
	 	width:110px;
	 	height:21px;
	 	padding:13px 0 13px 20px;
	 	background-color:#fafcfa;
	 }
	 td#border{padding:13px 0 13px 23px;}
	 td.content{padding:13px 0 13px 60px; width:1030px; height:200px;}
	 .btn{float:right;}
	 .text_btn {
	    background: none;
	    font-size:14px;
	    border: 1px solid #6c9414;
	    color: #6c9414;
	    width: 100px;
	    height: 45px;
	    margin: 0 5px 5px 5px;
	    float:left;
	}
	.text_btn:hover {
	     background-color: #6c9414;
	    font-size:14px;
	    border: none;
	    color: #fff;
	    width: 100px;
	    height: 45px;
	    margin: 0 5px 5px 5px;
	}
	.comment {
		width:300px;
		padding-left:0;
		margin-left:0;
	}
	input#com_tit {
		font:"Noto Sans KR", sans-serif;
		font-size:14px;
		width:300px;
		height:35px;
		text-align: left;
		padding-right:14px;
		padding-left:14px;
		border:1px solid #cccccc;
	}
	input#com_cont {
		font:"Noto Sans KR", sans-serif;
		font-size:14px;
		width:300px;
		height:100px;
		text-align: left;
		padding-right:14px;
		padding-left:14px;
		border:1px solid #cccccc;
	}
	.btn_sub{
		background-color: #6c9414;
	    font-size:14px;
	    border: none;
	    color: #fff;
	    width: 100px;
	    height: 45px;
	    margin: 0 5px 5px 5px;
	}
	.btn_sub:hover {
		background: none;
	    font-size:14px;
	    border: 1px solid #6c9414;
	    color: #6c9414;
	    width: 100px;
	    height: 45px;
	    margin: 0 5px 5px 5px;
	    float:left;
	}
	.footer .tit_cc{
		padding-left:200px !important;
	}
</style>
</head>
<body>
<div id="header" class = "header"><jsp:include page="template/header.jsp"></jsp:include></div>
<table class="table">
	<h2 style="text-align:left;">게시글 &nbsp;&nbsp;<span class="sub_tit">YG의 새로운 소식들과 유용한 정보들을 한곳에서 확인해주세요.</span></h2>
	<tr>
		<th>제목</th>
		<td colspan="3" style="padding-left:23px;">${bb.title }</td>
	</tr>
	<tr>
		<th id="border">작성자</th>
		<td id="border" colspan="3">${bb.writer }</td>
	</tr>
	<tr>
		<th id="border">작성일시</th>
		<td id="border" style="width:200px;">${bb.writedate }</td>
		<th id="border">조회수</th>
		<td id="border">${bb.hitcount }</td>
	</tr>
	<tr>
		<td class="content" colspan="4">${bb.content }</td>
	</tr>
</table>
<div class="btn">
	 <button type="button" class="text_btn" onclick="location.href='Controller?command=board_updatewrite&bno=${bb.bno}'">수정</a></button> &nbsp;&nbsp;
	 <button type="button" id="delete" class="text_btn" onclick="location.href='Controller?command=board_delete&bno=${bb.bno}'">삭제</button>  &nbsp;&nbsp;
	<button type="button" class="text_btn" onclick="location.href='Controller?command=board_list&page=<%=request.getParameter("page")%>'">목록보기</button> &nbsp;&nbsp;
</div>
<hr width="500" style="border:solid 1px #f5f4f4;">
<form action="Controller?command=board_comment&bno=${bb.bno}" method="post">
	<div class="comment">
		<h2 class="reply">댓글작성</h2>
		제목 <input type="text" id="com_tit" name="commentTitle"/><br/>
		내용 <input type="textarea" id="com_cont" name="comment"/>
		<br/><br/><input type="submit" class="btn_sub" value="등록"/>
	</div>
</form>
</body>
<div class="footer"><jsp:include page="template/footer.jsp"></jsp:include></div>
</html>