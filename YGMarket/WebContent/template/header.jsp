<%@page import="com.yg.dto.MemberBean"%>
<%@page import="com.yg.dao.MemberDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<style>
	nav{
		width: 1200px;
		margin: 0 auto;
		border: 1px solid #FFFFFF;
		text-align: center;
		background-color:#fff;
	}
	body {
	  margin: 0;
	  padding: 0;
	  display: flex;
	  flex-flow: column nowrap;
	  justify-content: center;
	  align-items: center;
	  overflow-x: hidden;  
	}
	#gnb {
	  margin-left:130px;
	  background-color:#fff;
	 }
	
	#gnb > li {
	  list-style: none;
	  float: left;
	  position: relative;
	}
	
	#gnb > li > a {
	  list-style:none;
	  color: #000;
	  text-align: center;
	  text-decoration: none;
	  letter-spacing: 0.05em;
	  display: block;
	  padding: 12px 36px;
	  border-right: 1px solid rgba(0,0,0,0.15);
	}
	
	/*#gnb > li:nth-child(1) > a {
	  border-left: 1px solid rgba(0,0,0,0.15);
	}*/

	#gnb_sub {
	  position: absolute;
	  background: #ffffff;
	  opacity: 0;
	  visibility: hidden;
	  transition: all 0.15s ease-in;
	}
	
	#gnb_sub > li {
	  list-style:none;
	  padding: 16px 28px 16px 0px;
	}
	
	#gnb_sub > li >  a {
	  color: #000;
	  text-decoration: none;
	}
	
	#gnb > li:hover #gnb_sub{
	  background:#fafcfa;
	  color:#6c9414;
	  opacity: 1;
	  visibility: visible;
	}
	#gnb > li a:hover {
	 /*background:#fafcfa;   배경색 할지 말지 의논*/
	 color:#6c9414;
	}
	
	#gnb_sub > li a:hover {
	 background:#fafcfa;
	 color:#6c9414;
	 text-decoration: underline;
	}
	section {
	  column-width: 15em;
	  background: #f7fafd;
	  padding: 2em 12em;
	}
	img#logo {
		 text-align:center;
		width: 275px;
		height: 384.5;
		
	}
	img#cart{
	    width: 52px;
	    padding-left:25px;
	}
	div#id {
		width:103px !important;
	}
</style>
<body>
<nav role="navigation" id="menu_bar">
<div id="wrap2">
	<div id="container2">
		<div id="headerLogo" class="layout_wrapper">
			<img id="logo" src="img/logo.png" onclick="location.href='Index.jsp'" alt="로고" style="width:180px;"/>
		</div>
		<div class="gnb" ><!-- style="padding-left:200px;" -->
			<div id="gnbMenu" class="gnb_kurly">
				<div class="inner_gnbkurly">
					<div class="gnb_main">
						<ul id="gnb">
							<li id="menu1"><a href="#none">전체 카테고리</a>							
									<ul id="gnb_sub" class="gnb_menu size_over">
										<li><a href="Controller?command=product_list&type=fruit">과일 / 견과</a></li>
										<li><a href="Controller?command=product_list&type=health">건강식품</a></li>
										<li><a href="Controller?command=product_list&type=life">생활용품</a></li>
										<li><a href="Controller?command=product_list&type=pet">반려동물</a></li>
										<li><a href="Controller?command=product_list&type=elect">가전제품</a></li>
									</ul>
							</li>
							<%
								String buttonName = "";
								String LoginAddress = ""; //로그인 시 갈 주소
								String name = "";
								String loginId = (String)session.getAttribute("login_id");
								if(loginId!=null){
									buttonName = "로그아웃";
									LoginAddress = "Controller?command=member_logout";
									MemberBean mBean = new MemberBean();
									MemberDao mDao = MemberDao.getInstance();
									mBean = mDao.selectMember(loginId);
									name = mBean.getName()+"님 안녕하세요.";
									
								}else{
									buttonName = "로그인";
							%><li><a href="M_JoinForm.jsp">회원가입</a></li><%
									LoginAddress = "M_LoginForm.jsp";
								}		%>
							<li><a href="<%=LoginAddress%>"><%=name%> <%=buttonName%></a></li>
							<li><a href="Controller?command=board_list">게시판</a></li>
							<li><a href="ServiceCenter.jsp">고객센터</a></li>
							<li>
							<div class="cart_count" onclick='location.href="Controller?command=product_mycart"'>
								<img id="cart" src="https://res.kurly.com/pc/ico/1908/ico_cart_x2_v2.png" alt="장바구니">
							</div>
							</li>
						</ul>
					</div>
				</div>
			</div>
		</div>	
		<hr width="1000" style="border:solid 1px #f5f4f4;">
	</div>
</div>
</nav>
</body>