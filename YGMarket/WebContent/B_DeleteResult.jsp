<%@page import="com.yg.dto.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 삭제</title>
</head>
<body>
   <%
   String loginId=(String)(session.getAttribute("login_id"));
   String writer = (String)request.getAttribute("writer");
System.out.println("B_Delete.jsp: writer "+ writer +"/ loginId: "+loginId);      

   if( writer.equals((String)session.getAttribute("login_id"))) {
   %>
   <script>
   alert("정말로 삭제하시겠습니까?");
   location.href="Controller?command=board_list";
   </script>
   <%
   } else{
   %>
   <script>
      alert("작성자가 아닙니다. 남의 글을 함부로 삭제 할 수 없습니다.");
      window.history.back();
   </script>
   <% 
   }
   %>
</body>
</html>