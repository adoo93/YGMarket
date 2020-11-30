<%@page import="com.yg.dto.ProductBean"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>메인 첫화면</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<!-- <script type="text/javascript">
	$(function(){
		var menupos=$("#header").offset().top;
		$(window).scroll(function(){
			$("#header").css("position","fixed");
			$("#header").css("top","0");
			$("#top_mar").show();
		});
	});
</script> -->
<style>
  *{font-family: "Noto Sans KR", sans-serif !important; font-size:16px;}
  div#header {width:100%; background-color:#fff;}
  #content{padding-bottom:0}
  .page_event{min-width:1050px}
  .page_event img{vertical-align:top}
  .page_event .view_event{position:relative;width:1050px;margin:0 auto;text-align:center}
  .page_event .btn_link{overflow:hidden;position:absolute;background:url() repeat 0 0;font-size:0;line-height:0;text-indent:-9999px}
  .page_event .txt_benefit{position:absolute;top:196px;font-size:0;line-height:0;text-indent:-9999px}
  /* event_style */
  .view_event1{height:484px;background:url(img/banner.png) no-repeat 50% 0}
  .view_event1 .view_event{position:relative}
  .view_event1 .box_btn{overflow:hidden;position:absolute;left:-28px;top:271px;width:354px;height:124px;background:url(https://res.kurly.com/images/event/join/191113/pc/main_btn.png) no-repeat 50% 0}
  .view_event1 .box_btn .link_join{width:300px;height:71px;left:27px;top:16px}
  .view_event1 .box_btn .link_join:hover{background:url(https://res.kurly.com/images/event/join/191113/pc/main_btn_on.png) no-repeat 50% 0}
  .view_event2{height:100px;background:url(img/banner2.png) no-repeat 50% 0}
  .view_event4 .tit{padding:160px 0 34px}
  .view_event4 .tit img{padding: 120px 350px 34px; width: 900px;}
  .view_event4 .list_goods .list img {width:250px;}
  .view_event4 .list_goods{overflow:hidden;;margin:auto;text-align:center}
  .view_event4 .list_goods_text{margin:60px 0 80px -350px;text-align:center}
  .view_event4 .list{float:left;width:1250px}
  .view_event4 .list td{position:relative;float:left;width:320px;height:503px;margin:22px 45px 0 0}
  .view_event4 .list td.exception{width:503px;padding-left:183px}
  .view_special{height:773px;background:#f4f4f4 url(img/benefit3.png) no-repeat 50% 80px}.view_best{padding-bottom:280px;background-color:#fff}
  .view_best .tit{padding:80px 0 36px;text-align:center}
  .view_best .list_best{}
  .view_best .b_list{float:left;width:1070px; margin:auto;}
  .view_best .b_list li{float:left;margin:28px 20px 0 0}
	html { scroll-behavior: smooth; }
	body {  overflow-x: hidden; width:120%;}
.bg {
  position: absolute;
  left: -25vw;
  top: -50vw;
  width: 150vw;
  height: 650vw;
  z-index: -1;
  -webkit-filter: blur(120px);
  filter: blur(120px);
}

.text_benefit {
  position: -webkit-sticky;
  position: sticky;
  top: calc(50% - 50px);
  height: 100px;
  display: inline-flex;
  align-items: center;
  mix-blend-mode: overlay;
  font-family: "Fredoka One", sans-serif;
  margin-left: 2px;
  margin-right: 2px;
  font-size: 120px;
}
table {
	text-align:center;
}
 .view_event2 .view_event #eventBenefit {list-style:none;}
.view_event2 .view_event #eventBenefit > li { float:left;}

.header{
	position:fixed;
	top:0;
	left: 0;
	right: 0;
	background-color:#fff;
}

#wrap{
	width: 100%;
   margin-top : 215px;
   margin-right:auto;
   margin-left:auto;
   display :inline-block;
	
}
.footer{margin-left:-150px;}
</style>
</head>
<body style="min-height:800px;">
<div id="wrap" class ="wrap">
	<div id="header" style="z-index:2;" class = "header">
	
	
		<jsp:include page="template/header.jsp"></jsp:include>
		<%	String login = request.getParameter("login");
			if (("ok").equals(login)){ 
		%><script>alert("로그인 되었습니다");</script><%
			}String logout = request.getParameter("logout");
			if(("ok").equals(logout)){
		%><script>alert("로그아웃 되었습니다");</script><%
			}%>
	</div>		
	<div id="container">
		<div id="main">
			<div id="content">
				<div id="page_event">
					<h3 class="screen_out" alt="회원가입 이벤트"></h3>
					<div class="view_event1" style="margin-left:-195px; margin-bottom:-17px;">
						<div class="view_event"></div>
					</div>
					<div class="view_event2" style="margin-left:-200px;">
						<div class="view_event">
							<ul id="eventBenefit" class="tab_benefit">
								<li><a href="#benefit1" class="link_benefit1"><img src="img/banner2-2.png" style="padding-left: 550px;"></a></li>
								<li><a href="#text1" class="link_benefit2"><img src="img/banner2-3.png"></a></li>
								<li><a href="#special" class="link_benefit3"><img src="img/banner2-4.png"></a></li>
							</ul>
						</div>
					</div>
					<div id="eventbenefit1" class="view_event4">
						<div class="view_event">
							<h4 class="tit"><img id="benefit1" src="img/benefit1.png"></h4>
							<div class="list_goods">
							<table class="list" style="margin-left:277px;">
								<tr>
									<td>
										<a href="Controller?command=product_select&code=event1" >
											<img src="img/event1.png" alt="[클린룸] 국내제조 일회용 마스크 50매입(대형)"><br/>
										</a>
									</td>
									<td>
										<a href="Controller?command=product_select&code=event2">
											<img src="img/event2.png" alt="미국산 블루베리"><br/>
										</a>
									</td>
									<td>
										<a href="#">
											<img src="img/soldout.png" alt="매진"><br/>
										</a>
									</td>
								</tr>
								</table>
							</div>
							<div class="list_goods_text" style="text-align:center"> - 부정한 방법(중복 가입 또는 중복 참여, 명의 도용 등)으로 신규 가입 이벤트를 이용할 경우, 주문 완료 후에도 주문이 취소될 수 있습니다.</div>
						</div>
					</div>
					<div id="eventbenefit2" class="view_event5">
						<div class="view_event" style="display: inline-flex;">
							<span class="text_benefit" id="text1"><img src="img/benefit2.png" style="margin-left:300px; margin-top:620px;"></span>
							<div class="bg"></div>
						</div>
					</div>
					<div class="view_special" style="margin:0 0 30px -300px;">
						<div class="view_event"></div>
							<strong class="screen_out" id="special"></strong>
						</div>
					</div>
					<div class="view_best">
						<div class="view_event">
							<h4 class="tit" style="margin-left:-320px;"><img src="img/phrases.png"></h4>
							<div class="list_best">
								<table class="b_list" style="margin-left:143px;">
									<tr>
										<td onclick="location.href='Controller?command=product_select&code=life7'"><img src="img/best1.png" style="width:280px;"></td>
										<td onclick="location.href='Controller?command=product_select&code=life1'"><img src="img/best2.png" style="width:280px;"></td>
										<td onclick="location.href='Controller?command=product_select&code=health1'"><img src="img/best3.png" style="width:280px;"></td>
										<td onclick="location.href='Controller?command=product_select&code=life3'"><img src="img/best4.png" style="width:280px;"></td>
										<td onclick="location.href='Controller?command=product_select&code=elect3'"><img src="img/best5.png" style="width:280px;"></td>
									</tr>
									<tr>
										<td onclick="location.href='Controller?command=product_select&code=fruit3'"><img src="img/best6.png" style="width:280px;"></td>
										<td onclick="location.href='Controller?command=product_select&code=elect2'"><img src="img/best7.png" style="width:280px;"></td>
										<td onclick="location.href='Controller?command=product_select&code=elect7'"><img src="img/best8.png" style="width:280px;"></td>
										<td onclick="location.href='Controller?command=product_select&code=fruit1'"><img src="img/best9.png" style="width:280px;"></td>
										<td onclick="location.href='Controller?command=product_select&code=life4'"><img src="img/best10.png" style="width:280px;"></td>
									</tr>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
<br/>
<div class="footer"><jsp:include page="template/footer.jsp"></jsp:include></div>
</body>
</html>