<%@page import="com.yg.dto.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>
	body {
		font-family: "Noto Sans KR", sans-serif !important;
		width:100%;
		min-height:462px;
	}
	div#header {width:100%;}
	.list img {
		width:306px;
		heigth:396px;
	}
	.list {
		float:left;
		padding:30px 30px 30px 40px;
		margin:0px auto;
	}
	.product {
		vertical-aling:top;
		margin-top:180px;
		display: inline-block;
		padding:45px 10px 10px 10px;		
		width:1200px;
		text-align:center;
		border-top: 1px solid #eee;
	}
	li {font-size: 16px;}
	
.header{
	position:fixed;
	top:0;
	left: 0;
	right: 0;
	background-color:#fff;
}

.wrap{
	width: 90%;
   margin-left: auto;
   margin-right: auto;
   margin-top : 215px;
   display :inline-block;
	
}
</style>
</head>
<body>		
<div id="header" class="header"><jsp:include page="template/header.jsp"></jsp:include></div>

<div class="product">
<%
	ArrayList<ProductBean> list1 = (ArrayList<ProductBean>)(request.getAttribute("pList"));
	for(ProductBean pb : list1) {
%>
<ul>
	<div class="list" onclick="location.href='Controller?command=product_select&code=<%=pb.getCode()%>&type=<%=pb.getType()%>'">
		<div>
		<a class="img"><img src="<%=pb.getImage() %>"/></a>
		</div>
		<a class="info">
			<span class="name"><%=pb.getName() %></span><br/>
			<span class="price"><%=pb.getPrice() %>원</span>
		</a>
	</div>
</ul>
<%	} %>
</div>

<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>