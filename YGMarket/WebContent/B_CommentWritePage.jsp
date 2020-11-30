<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	int bno = Integer.parseInt("bno");
	String loginId = (String)session.getAttribute("login_id");
%>
<form action="Controller?command=board_comment&bno=bno&loginId=loginId">
	<input type="text" name="commentTitle"/>
	<input type="textArea" name="comment"/>
	<input type="submit" value="등록"/>
</form>
</body>
</html>