<%@page import="com.yg.dao.ProductDao"%>
<%@page import="com.yg.dao.MemberDao"%>
<%@page import="com.yg.dto.ProductBean"%>
<%@page import="com.yg.dto.OrderBean"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.yg.dao.OrderDao"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>F5만 누르기</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<script language="JavaScript">
	var qty = 1;
	var price = 2500;
	var sum = 2500;
	function add() {
		hm.value=Number(qty)+1;
		sum.value = Number(hm.value) * qty;
		$("#qty").text(Number(qty))
		$("#span_sum").text(Number(sum));
	}
	
	function del() {
		hm = qty-1;
		sum = qty*price;
		hm.value=Number(hm.value)-1;
		if(hm.value==0){
			hm.value=1;
		} else {
			sum -= price;
		}
		$("#qty").text(Number(qty))
		$("#span_sum").text(Number(sum));
		
	}

</script>
<style>
*{ font-family: "Noto Sans KR", sans-serif !important; }
img { width:105px; }
div { text-align:center; }
input { width:20px;	}
table { border-collapse: collapse; border-spacing: 0; }
.layout-page-header { padding-bottom: 10px; text-align:center; }
.layout-page-title { display: block; padding: 10px 0 14px; color: #333; }
.pg_sub_desc { margin: -32px 0 40px; color: #999; text-align: center; }
.tbl_comm {	width:100%; }

.tbl_comm th {
    padding: 20px 0;
    border-top: 2px solid #6c9414;
    font-weight: 700;
    font-size: 14px;
    color: #666;
    letter-spacing: -.3px;
    text-align: left;
}

.tbl_header .all_select { padding-left: 20px; }
#thInfo { padding-left:20px; width:570px;}

.screen_out {
    display: block;
    overflow: hidden;
    position: absolute;
    left: -9999px;
    width: 1px;
    height: 1px;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
}

.section_cart #viewGoods {
    overflow: hidden;
    width: 1050px;
    height:119px;
    border-bottom: 1px solid #ddd;
}
.section_cart .view_goods { border-top: 1px solid #ddd; }
.section_cart .view_goods .goods { width: 100%; padding: 14px 0; }
.section_cart .tbl_goods .goods_thumb { text-align: left;}
.section_cart .tbl_goods td { padding: 20px 0; border: 0; text-align: center; }

.section_cart .tbl_goods .thumb {
    display: block;
    overflow: hidden;
    width: 60px;
    height: 77px;
    margin-right: 40px;
    background-color: #f4f4f4;
    margin-left:13px;
}
a { background-color: transparent; text-decoration: none; color: inherit; }
.section_cart .tbl_goods .thumb .image1 { width: 100%; height: auto; }
.section_cart .tbl_goods .goods_info { padding-top: 18px; text-align: left; }
.section_cart .tbl_goods .goods_info .name {
    font-weight: 700;
    font-size: 14px;
    color: #000;
    line-height: 20px;
    letter-spacing: 0;
}
.section_cart .tbl_goods .goods_info .goods_cost {
    display: block;
    overflow: hidden;
    width: 488px;
    padding-top: 7px;
    margin-top:-6px;
    margin-bottom:0px;
    margin-left:-39px;
}
.section_cart .tbl_goods .goods_info .goods_cost .selling_price { padding-right: 7px; color: #000; }
.section_cart .tbl_goods .goods_info .goods_cost dd { float: left; font-size: 12px; }
.section_cart .tbl_goods .goods_delete .btn_delete {
    display: block;
    width: 12px;
    height: 12px;
    border: 0;
    background-color: #fff;
}
.section_cart .tbl_goods .goods_delete .btn_delete .x { display: block; width: 12px; height: 12px; }
</style>
</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>

<%	OrderDao oDao = OrderDao.getInstance();
	MemberDao mDao = MemberDao.getInstance(); 
	ProductDao pDao = ProductDao.getInstance();
	
	String loginId = (String)session.getAttribute("login_id");
	int member_id = mDao.getMemberIdFromId(loginId);
%>		
	
	<div class="layout-page-header">
		<h2 class="layout-page-title"><%=loginId %>님의 장바구니</h2>
		<div class="pg_sub_desc">
			<p>주문하실 상품명 및 수량을 정확하게 확인해주세요.</p>
		</div>
	<form>
	<div class="section_cart">
		<div class="tbl_comm cart_goods">
		<table class="tbl_comm bl_header">
			<colgroup>
				<col style="width:50%;">
				<col style="width:20%;">
				<col style="width:22%;">
				<col style="width:6%;">
				<col style="width:auto;">
			</colgroup>
			<thead>
			<tr>
				<th id="thInfo">상품정보</th>
				<th id="thCount">수량</th>
				<th id="thCost">상품금액</th>
				<th id="thDelete"><span class="screen_out">삭제선택</span></th>
			</tr>
			</thead>
		</table>
		</div>
	
		<div id="viewGoods">
			<div class="view_goods">
				<table class="tbl_goods goods">
					<colgroup>
						<col style="width:1%;">
						<col style="width:20%;">
						<col style="width:18%;">
						<col style="width:16%;">
						<col style="width:9%;">
						<col style="width:55%;">
						<col style="width:auto;">
					</colgroup>	
					<tbody>
						<tr>
							<td header="thInfo" class="goods_thumb">
								<a href="Controller?command=product_select&code=fruit1" class="thumb">
								<img src="img/fruit1.jpg" class="image1">
								
								</a>
							</td>
							<td header="thInfo" class="goods_info">
							<a href="Controller?command=product_select&code=fruit1" class="name">아보카도	</a>
							<dl class="goods_cost">
								<dt class="screen_out">판매가격</dt>
								<dd class="selling_price">
									<span class="num" name="price">2500</span>	<!-- 여기를 수정해야함 db처리 -->
									<span class="txt">원</span>
								</dd>
							</dl>
							</td>
							<td header="thCount">
							<div class="goods_quantity">	<!-- 수량 +,-하는 부분. div 더 추가 해야함 -->
								<button type="button" class="btn down" onclick="del();"></button>
								<input type="number" readonly="readonly" onfocus="this.blur()" name="qty" class="inp" min="1" value="3">
								<button type="button" class="btn up" onclick="add();"></button>
							</div>
							</td>
							<td header="thCost">
								<span class="sum">
								<span class="num" name="sum"><input type="hidden" value="2500" name="sum" readonly></span>
								<span id="span_sum"></span>
								<span class="won">원</span>
								</span>
							</td>
							<td header="thDelete" class="goods_delete">
								<button type="button" class="btn btn_delete">
									<img src="img/x.jpg" class="x">
								</button>
							</td>
						</tr>
					</tbody>				
				</table>
			</div>
		</div>
	</div>
	</form>
	
			

 		<h3 style="text-align:right">총가격 : </h3>

		</div>
	
<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>