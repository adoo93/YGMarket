<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>
	*{font-family: "Noto Sans KR", sans-serif !important;}
	.header{
		position:fixed;
		top:0;
		left: 0;
		right: 0;
		background-color:#fff;
	}
	.service_{text-aling:center; padding:25px;}
</style>
</head>
<body>
<div class="service">
<div id="header" style="z-index:2;" class = "header"><jsp:include page="template/header.jsp"></jsp:include></div>
<table class="inner_service" style="border-top:1px solid #6c9414;">
	<h2 style="margin-top:300px;">고객센터 Information</h2>
	<tr>
		<td class="service_">
			<h2 class="tit_cc">고객행복센터</h2>
			<h3><span class="tit">5595-9500</span></h3>
		</td>
		<td class="list">
			<span>365고객센터</span><br/>
			<span>오전 7시 - 오후 7시</span>
		</td>
	</tr>
	<tr >
		<td colspan="2" class="company" style="border-top:1px solid #b9b9b9; padding:25px;">
		      법인명 (상호) : 주식회사 YG
		      <span class="bar">I</span>
		      사업자등록번호 : 123-45-67890 <br/>
		      <br/>
		      통신판매업 : 제 2018-서울신촌-01234 호
		      <span class="bar">I</span>
		      개인정보보호책임자 : 이영걸 <br/>
		      <br/>
		      주소 : 서울특별시 마포구 서강로 136 아이비타워 2F,3F 
		      <span class="bar">I</span>
		      대표이사 : 이영걸 <br/>
		      <br/>
		      채용문의 : javaprogramming2020@gmail.com <br/>
		      <br/>
		      대표번호 : 010-5595-9500 <br/>
		</td>
	</tr>
</table>
</div>
</body>
<div class="footer"><jsp:include page="template/footer.jsp"></jsp:include></div>
</html>