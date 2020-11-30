<%@page import="com.yg.dto.BoardBean"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>-</title>
</head>
<body>
   
   <%
      String id = request.getParameter("ID");
      
   %>
   <script>
      alert("찾으시는 id는 : <%=id%> 입니다");
      location.href="M_LoginForm.jsp";
   </script>
   
</body>
</html>