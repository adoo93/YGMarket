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
<title>Insert title here</title>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs=" crossorigin="anonymous"></script>
<script>
	$(function() {
		$(".minus").click(function() {
			var qty = $(this).parent().find("input.newqty").val();
			qty = Number(qty)-1;
			if(qty<=0) qty=1;
			$(this).parent().find("input.newqty").val(qty)
		});
		$(".plus").click(function() {
			var qty = $(this).parent().find("input.newqty").val();
			qty = Number(qty)+1;
			$(this).parent().find("input.newqty").val(qty)
		});
	});
</script>
<style>
*{ font-family: "Noto Sans KR", sans-serif !important; }
img { width:105px; }
div { text-align:center; }
input { width:40px;	height:30px;}
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
    background-color: #fafcfa;
}
.section_cart .tbl_goods .goods_delete .btn_delete .x { display: block;}
#revise {
	background-color: #6c9414;
    font-size:12px;
    border: none;
    color: #fff;
    width: 47px;
    height: 22px;
    margin-bottom: 5px;
}
#thCount {padding-left:110px;}
#thCost {padding-left:85px;}
#qty{border:solid 1px #fff; margin-right:8px; height:30px;}
</style>

</head>
<body>
<jsp:include page="template/header.jsp"></jsp:include>

<%	OrderDao oDao = OrderDao.getInstance();
	MemberDao mDao = MemberDao.getInstance(); 
	ProductDao pDao = ProductDao.getInstance();
	
	String loginId = (String)session.getAttribute("login_id");
	int member_id = mDao.getMemberIdFromId(loginId);
	int totalsum=0;
%>		
	
	<div class="layout-page-header">
		<h2 class="layout-page-title"><%=loginId %>님의 장바구니</h2>
		<div class="pg_sub_desc">
			<p>주문하실 상품명 및 수량을 정확하게 확인해주세요.</p>
		</div>
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
<%	ArrayList<OrderBean> list1 = oDao.getOrderListFromMemberId(member_id);
		for(OrderBean bean : list1) {
			ProductBean bean2 = pDao.selectProduct(bean.getCode());	%>
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
								<a href="Controller?command=product_select&code=<%=bean2.getCode()%>" class="thumb" id="code">
								<img src="<%=bean2.getImage() %>" class="image1">
								</a>
							</td>
							<td header="thInfo" class="goods_info">
							<a href="Controller?command=product_select&code=<%=bean2.getCode()%>" class="name">
							<%=bean2.getName() %>
							</a>
							<dl class="goods_cost">
								<dt class="screen_out">판매가격</dt>
								<dd class="selling_price">
									<span class="num" name="price"><%=bean2.getPrice() %></span>
									<span class="txt">원</span>
								</dd>
							</dl>
							</td>
					<form action="Controller?command=order_update" method="post">
							<td header="thCount">
							<div class="goods_quantity">
								<button style="border:1px solid #fff; font-size:20px; color:#6c9414; background-color:#fff; cursor:pointer; width:32px" class="minus">-</button>
								<input type="text" readonly="readonly" value="<%=bean.getQty() %>" name="newqty" class="newqty" style="text-align:center;">
								<button style="border:1px solid #fff; font-size:20px; color:#6c9414; background-color:#fff; cursor:pointer; width:32px" class="plus">+</button>
							</div> 
							<input type="hidden" name="member_id" value="<%=(String)session.getAttribute("login_id") %>">
							<input type="hidden" name="code" value="<%=bean2.getCode()%>">
							</td>
						</form>
							<td header="thCost">
								<span class="sum">
								<span class="num"><input type="hidden" value="<%=bean2.getPrice() %>" name="sum" readonly></span>
								<% int totalprice = (bean.getQty())*(bean2.getPrice()); %>
								<span id="span_sum" id="sum"><%=(bean.getQty())*(bean2.getPrice()) %></span>
								<span class="won">원</span>
								</span>
							</td>
							<td header="thDelete" class="goods_delete">
								<input type="button" class="btn btn_delete" id="btn_delete">
								<img src="img/x.jpg" style="width:12px;" class="x"
								 onclick="location.href='Controller?command=order_delete&ordernum=<%=bean.getOrdernum()%>'">
							</td>
						</tr>
						<% totalsum += totalprice; %>
					</tbody>				
				</table>
			</div>
		</div>
<%		}	 %>	
	</div>
	
			

	<h3 style="text-align:right">총가격 : <span id="span_num"><%=totalsum %> </span>원</h3>
	</div>
	
<jsp:include page="template/footer.jsp"></jsp:include>
</body>
<script>
	window.onload = function(){
		document.querySelectorAll('#span_sum').forEach(function(e,i){
		    e.outerHTML = e.innerHTML.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",")
		})
	}
</script>
</html>

