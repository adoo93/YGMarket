<%@page import="com.yg.dto.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	img {
		width:306px;
		heigth:396px;
	}
	div.list {
		float:left;
		width:350px;
	}
</style>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>

<div>
<%
	ArrayList<ProductBean> list1 = (ArrayList<ProductBean>)(request.getAttribute("pList"));
	for(ProductBean pb : list1) {
%>
<ul>
	<div class="list" onclick="location.href='Controller?command=product_select&code=<%=pb.getCode()%>'">
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