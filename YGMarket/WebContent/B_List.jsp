<%@page import="com.yg.dto.BoardBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>
hr{margin-top:70px !important;}
body { font-family: "Noto Sans KR", sans-serif !important; font-size:16px;}
div#header {width: 100%;}
#cart{width:77px !important; height:52px;}
.container {margin-top: 70px; margin-bottom: 70px; }

tr:hover { background-color: #fafcfa !important; }

.change { background-image:url("img/writebtn.png"); width:100px;}
.change:hover {background-image:url("img/writebtnh.png"); width:100px;}
</style>
</head>
<body>
<div id="header"><jsp:include page="template/header.jsp"></jsp:include></div>
<%
	int pageNum=0;
	try {
		pageNum = Integer.parseInt(request.getParameter("page"));
	} catch (Exception e) {
		pageNum=1;
	}
%>
<div class="container" align="center">
	<h2 style="text-align:left">문의 게시판</h2>
	<table class="table">
		<tr>
		<%if(session.getAttribute("login_id")!=null) { %>	
			<td colspan="5" style="border:white; text-align:right">
			<img src="img/writebtn.png" onmouseover="this.src='img/writebtnh.png'" onmouseout="this.src='img/writebtn.png'"
							 onclick="location.href='B_InsertForm.jsp'" class="change" alt="글쓰기">
		<% } %>
		</tr>
		<tr>
			<th>글번호</th>
			<th>제목</th>
			<th>작성자</th>
			<th>작성일자</th>
			<th>조회수</th>
		</tr>
		
	<%	int maxPageNum = 1;
		if(request.getAttribute("maxPageNum")!=null)
			maxPageNum = (Integer)(request.getAttribute("maxPageNum"));
		ArrayList<BoardBean> list1 = (ArrayList<BoardBean>)(request.getAttribute("boardList"));
		for(BoardBean bb : list1) {
	%>
		<tr>
			<td><%=bb.getBno() %></td>
			<td><a href="Controller?command=board_content&bno=<%=bb.getBno()%>&page=<%=pageNum%>">
			<% if(bb.getLevel()!=0){%>
	                     <% for(int a = 0; a <= bb.getLevel()*2;a++){ %>
	                        &nbsp;
	                     <% } %>
	                     <% }%>
			<%=bb.getTitle()%></a></td>
			<td><%=bb.getWriter()%></td>
			<td><%=bb.getWritedate()%></td>
			<td><%=bb.getHitcount()%></td>
		</tr>
	<% }%>	
	</table>
</div>
[<%=pageNum%> 페이지 ] / [<%=maxPageNum%> 페이지]
<div style="width:300px; margin:0 auto; font-size:20px; text-align:center;">
	<% //ArrayList<BoardBean> list2 = (ArrayList<BoardBean>)(request.getAttribute("boardList"));
	//int totalPage = (int) Math.ceil((double) list2.size() / 10);
	for(int i=1; i<=maxPageNum; i++) {
		if(pageNum==i) {%><%=i%><%} else { %>
		<a href="Controller?command=board_list&page=<%=i%>"><%=i%></a>
	<% } 
	}%>	
</div>
<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>