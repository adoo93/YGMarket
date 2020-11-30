<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!--  메뉴 부분 -->
<style>
	nav{
		width: 1200px;
		margin: 0 auto;
		border: 1px solid #FFFFFF;
		text-align: center;
	}
	
	ul{
		list-style-type:none;
		heigth: auto;
		display: inline-block;
	}
	li{
		display: inline-block;
		font-size : 12px;
		float : right;
		padding : 10px;
	}
	#menu_bar a: link, #menu_bar a:visited{
		clolor:black;
		text-decoration:none;
		font-size:17px;
		text-align: center;
		padding: 20px 30px;
	}
</style>
<nav id="menu_bar">
	<ul>
		<li><a href="#">고객센터</a></li>
		<li><a href="Controller?command=board_list">게시판</a></li>
		<li><a href="Controller?command=product_list">장보러가기</a></li>
		<li><a href="Index.jsp">로그아웃</a></li>
<!-- //로그인된 아이디   --> <li>id~님</li>
		<li><a href="M_JoinForm.jsp">회원가입</a></li>
		<li><a href="Index.jsp">HOME</a></li>
		
		
		<!-- <li><a href="kick.jsp">회원탈퇴</a></li>
		<li><a href="find_pass.jsp">비밀번호찾기</a></li> -->
		
		<div id="main">
			<img src="images/yg.png" alt="로고"/>
		</div>
		
		
		
	</ul>
</nav>
