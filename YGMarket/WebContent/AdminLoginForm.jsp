<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h1>관리자 로그인창</h1>  
	
	id=admin pw=1111<br/>
	
	<form action="Controller?command=Admin_login" method="post">
	ID : <input type="text" name="id"/><br/>
	PW : <input type="password" name="pw"/><br/>
	<input type="submit" value="로그인"/>
	</form>
	

</body>
</html>