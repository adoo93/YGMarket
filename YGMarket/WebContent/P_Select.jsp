<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js" integrity="sha256-4+XzXVhsDmqanXGHaHvgh1gMQKX40OUvDEBTu8JcmNs=" crossorigin="anonymous"></script>
<meta charset="UTF-8">
<title>Insert title here</title>
<script language="JavaScript">

	function add() {
		hm = document.form.qty;
		sum = document.form.sum;
		hm.value=Number(hm.value)+1;
		sum.value = Number(hm.value) * ${pb.price};
		$("#span_sum").text(Number(sum.value).toLocaleString());
	}
	
	function del() {
		hm = document.form.qty;
		sum = document.form.sum;
		hm.value=Number(hm.value)-1;
		if(hm.value==0){
			hm.value=1;
		} else {
			sum.value -= ${pb.price};
		}
		$("#span_sum").text(Number(sum.value).toLocaleString());
		
	}
	$(function() {
		$("#span_sum").text(Number(${pb.price}).toLocaleString());
		
	});

</script>
<link href="https://fonts.googleapis.com/css?family=Do+Hyeon|Noto+Sans+KR:300,500,900&display=swap" rel="stylesheet">
<style>

* {
	margin:0px auto;
	padding:0px;
	font-family: "Noto Sans KR", sans-serif !important;
}
div#header {width:100%;}
.words{padding: 40px;}
.section_view {
    width: 1050px;
    margin: 0 auto;
    padding-top: 20px;
}
#sectionView .inner_view .thumb .bg{
    width: 430px;
    height: 552px;
    float: left;
    background-color: #eee;
    background-position: 50% 50%;
    background-repeat: no-repeat;
    background-size: cover;
}
#sectionView .goods_name {
    float: right;
    width: 560px;
    padding: 10px 0 29px;
}
#sectionView .goods_name .name {
    display: block;
    padding-right: 60px;
    font-weight: 700;
    font-size: 24px;
    line-height: 34px;
    word-break: break-all;
}
#sectionView .goods_name .short_desc {
    display: block;
    padding: 4px 60px 0 0;
    font-size: 14px;
    color: #999;
    line-height: 20px;
    word-break: break-all;
}
#sectionView .goods_dcinfo {
    float: right;
    width: 560px;
    padding-right: 21px;
    font-size: 14px;
    line-height: 20px;
}
#sectionView .goods_price {
    float: right;
    width: 560px;
    padding: 0 20px 0 0;
}
#sectionView .goods_price .dc_price {
    font-weight: 700;
    font-size: 28px;
    line-height: 30px;
    letter-spacing: -.5px;
    word-break: break-all;
}
#sectionView .goods_price .dc .won {
    padding: 0 7px 0 2px;
    font-weight: 700;
    font-size: 18px;
    line-height: 30px;
    vertical-align: 2px;
}
#sectionView .goods_info {
    float: right;
    width: 560px;
    margin-top: 19px;
    padding-bottom: 19px;
    border-top: 1px solid #f4f4f4;
}

#sectionView .goods_info .list {
    overflow: hidden;
    padding: 18px 0;
    border-bottom: 1px solid #f4f4f4;
}
#sectionView .goods_info .tit {
    float: left;
    width: 150px;
    font-size: 14px;
    color: #666;
    line-height: 20px;
}
#sectionView .goods_info .desc {
    overflow: hidden;
    font-size: 14px;
    line-height: 20px;
    word-break: break-all;
}
#cartPut .cart_type2 {
    float: right;
    width: 560px;
    padding-bottom: 40px;
}
#cartPut .cart_type2 .list_goods {
    padding-bottom: 12px;
}
#cartPut .cart_type2 .list_nopackage {
    padding: 0;
}
#cartPut .cart_type2 .list_nopackage .on{
	list-style:none;
    float: none;
    width: 100%;
    padding: 0 0 30px;
    margin: 0;
    border: 0;
}
#cartPut .cart_type2 .list_nopackage .tit_item {
    float: left;
    width: 150px;
    font-weight: 400;
    font-size: 14px;
    color: #666;
    line-height: 20px;
    letter-spacing: -.5px;
}
#cartPut .cart_type2 .list_nopackage .option {
    padding-top: 0;
}
#cartPut .cart_option .list .count {
    overflow: hidden;
    float: left;
    width: 88px;
    height: 24px;
    border: 1px solid #dddfe1;
    border-radius: 3px;
}
#cartPut .cart_option .list .btn {
    overflow: hidden;
    position: relative;
    float: left;
    width: 22px;
    height: 22px;
    border: 0;
    background: #f6f7f7;
    font-size: 0;
    line-height: 0;
    text-indent: -9999px;
}
#cartPut .cart_option .list .btn:after {
    content: "";
    position: absolute;
    left: 6px;
    top: 10px;
    width: 10px;
    height: 2px;
    background-color: #6c9414;
}
#cartPut .cart_option .list .down {
    border-right: 1px solid #dddfe1;
}
#cartPut .cart_option .list .inp {
    float: left;
    width: 41px;
    height: 24px;
    padding: 0 0 2px;
    border: 0;
    background-color: #fff;
    font-size: 14px;
    color: #000;
    line-height: 18px;
    text-align: center;
}
#cartPut .cart_option .list .up {
    float: right;
    border-left: 1px solid #dddfe1;
}
#cartPut .cart_option .list .up:before {
    left: 10px;
    top: 6px;
    width: 2px;
    height: 10px;
}
#cartPut .cart_option .list .btn:before{
    content: "";
    position: absolute;
    background-color: #6c9414;
}
button {
	cursor:pointer;
}
#cartPut .cart_type2 .total {
    padding: 30px 0 20px;
    border-top: 1px solid #f4f4f4;
}
#cartPut .cart_option .total .price {
    overflow: hidden;
    text-align: right;
}
#cartPut .cart_option .total .tit {
    font-weight: 700;
    font-size: 13px;
    line-height: 20px;
    vertical-align: 2px;
}
#cartPut .cart_option .total .num {
    padding-left: 8px;
    font-weight: 800;
    font-size: 32px;
    line-height: 32px;
}
#cartPut .cart_option .total .won {
    padding-left: 2px;
    font-size: 20px;
    font-weight: 700;
    line-height: 20px;
    vertical-align: -1px;
}
#cartPut .cart_option .group_btn {
    overflow: hidden;
    width: 100%;
}
#cartPut .cart_option .group_btn .btn_type1 {
    width: auto;
}
#cartPut .cart_option .group_btn .txt_type {
    display: block;
    width: 100%;
    height: 100%;
    border: 0;
    background:#6c9414;
    font-weight: 700;
    color: #fff;
    font-size: 16px;
    line-height: 52px;
    letter-spacing: -.1px;
    text-align: center;
}
.layout-wrapper.goods-view-area {
    padding-right: 40px;
}
.goods-view-infomation {
    margin-top: 50px;
}
.goods-view-infomation-content.__active {
    display: block;
}
.good_wrap {
    width: 1010px;
    margin: 0 auto;
    font-family: noto sans;
    font-weight: 200;
    letter-spacing: 0;
}
.goods_wrap .context.last {
    margin-bottom: 170px;
}
.goods_wrap .goods_intro .bg2{
	text-align: center;
	width:1010px;
	height:671px;
	margin-top:60px;
}
.goods_wrap .goods_intro .context h3 {
    display: block;
    margin: 75px 0 0;
    padding-bottom: 35px;
    font-size: 38px;
    line-height: 46px;
    text-align: center;
    border-bottom: 1px solid #c1c1c1;
    color: #666;
}
.goods_wrap .goods_intro .context h3 small {
    display: block;
    font-size: 24px;
    margin-bottom: 14px;
    line-height: 15px;
}
.goods_wrap .goods_intro .context .words {
padding: 40px;
    margin-top: 55px;
    font-size: 18px;
    line-height: 32px;
}
.goods_wrap .goods_pick h3, .goods_point h3 {
    display: inline-block;
    position: relative;
    z-index: 10;
    font-size: 50px;
    width: 100%;
    margin-bottom: 70px;
    font-weight: 700;
    font-family: noto sans;
    font-weight: 700;
    color: #666;
}
.goods_point h3:before {
    content: " ";
    position: absolute;
    z-index: 1;
    top: 37px;
    width: 100%;
    height: 1px;
    background: #b9b9b9;
}
.goods_point h3 span {
    position: relative;
    z-index: 10;
    display: inline-block;
    margin-left: 260px;
    padding: 0 15px;
    background: #fff;
    text-shadow: 2px 0;
}
.goods_wrap .context.last .bg3 {
    width:1010px;
}
.goods_desc .context .bg4{
	width:1010px;
}
.goods_wrap .context .words {
padding: 40px;
    margin-top: 55px;
    font-size: 18px;
    line-height: 32px;
    color: #373737;
}
.goods_wrap .sub_tit {
    display: block;
    margin-bottom: 20px;
    font-size: 30px;
    line-height: 38px;
}
strong {
    font-weight: 700;
}
.goods_desc .context .bg5 {
	width:1010px;
}
.goods_wrap .goods_tip h3 {
    display: inline-block;
    position: relative;
    z-index: 10;
    font-size: 30px;
    padding-left: 48px;
    font-weight: 700;
    font-family: noto sans;
    font-weight: 700;
    color: #666;
    letter-spacing: 1px;
}
.goods_wrap .goods_tip h3 span {
    position: relative;
    z-index: 10;
    display: inline-block;
    padding: 0 10px;
    font-size: 36px;
    background: #fff;
    text-shadow: 2px 0;
}
.goods_wrap .goods_tip .tip_box {
    margin-top: -15px;
    border: 1px solid #b9b9b9;
}
.goods_wrap .goods_tip .tip_box .bg6 {
    width: 1008px;
    height: 800px;
}
</style>

</head>
<body>
<div id="header" class="heder"><jsp:include page="template/header.jsp"></jsp:include></div>

<form action="Controller?command=addToCart&member_id=<%=session.getAttribute("login_id")%>" name="form" method="post">
<div id = "content" style="opacity:1;">
	<div class = "section_view">
		<div id="sectionView">
			<div class="inner_view">
				<div class="thumb"><img src="${pb.image }" class="bg">
						
				</div>			
				<p class="goods_name">
					<strong class="name">${pb.name }</strong>
				</p>
				<p class="goods_dcinfo">회원할인가</p>					
				<p class="goods_price">
					<span class="dc">
					<span class="dc_price"><script>document.write(Number(${pb.price}).toLocaleString());</script></span>
					<span class="won">원</span>
					</span>
				</p>
				<div class="goods_info">
					<dl class="list">
						<dt class="tit">판매단위</dt>
						<dd class="desc">1개</dd>
					</dl>
					<dl class="list">
						<dt class="tit">배송구분</dt>
						<dd class="desc">샛별배송/택배배송</dd>
					</dl>
					<dl class="list">
						<dt class="tit">원산지</dt>
						<dd class="desc">${pb.origin }</dd>					
					</dl>
				</div>
			</div>	
		</div>	
		
		<div id="cartPut">
			<div class="cart_option cart_type2">
				<div class="inner_option">
					<div class="in_option">
						<div class="list_goods">
							<ul class="list list_nopackage">
								<li class="on">
									<span class="tit_item">구매수량</span>
									<div class="option">
										<span class="count">
											<button type="button" class="btn down" onclick="del();"></button>
											<input type="number" readonly="readonly" onfocus="this.blur()" class="inp" min="1" value="1" name="qty">
											<button type="button" class="btn up" onclick="add();"></button>
										</span>
									</div>
								</li>							
							</ul>
						</div>
						<div class="total">
							<div class="price"><strong class="tit">총 상품금액 :</strong>
							<span class="sum">
								<span class="num" name="sum2"><input type="hidden" value="${pb.price }" name="sum" readonly></span>
									<span id="span_sum"></span>
								<span class="won">원</span>
							</span>
							</div>
						</div>						
					</div>
					<div class="group_btn off">
						<span class="btn_type1">
							<button type="submit" class="txt_type">
							장바구니 담기</button>
						</span>
					</div>
					<input type="hidden" name="code" value="${pb.code }">
					<input type="hidden" name="member_id" value="<%=(String)session.getAttribute("login_id") %>">
				</div>
			</div>
			<div class="layout-wrapper goods-view-area">
				<div class="goods-view-infomation detail_wrap_outer" id="goods-view-infomation">
					<div class="goods-view-infomation-content __active" id="goods-description">
						<div class="goods_wrap">
							<div class="goods_intro">
								<div class="pic">
									<img src=${pb.eximage } class="bg2">
								</div>							
								<div class="context last">
									<h3>
										<small>${pb.extitle1 }</small>
										${pb.extitle2 }
									</h3>	
									<p class="words">${pb.exdetail }</p>
								</div>
							</div>
							
							<div class="goods_point">
								<h3>
									<span>YG's Check Point</span>
								</h3>
								<div class="context last">
									<div class="pic"><img src=${pb.point } class="bg3"></div>
								</div>
							</div>
							<div class="goods_point">
								<h3>
									<span>YG's Pick</span>
								</h3>
								<div class="context last">
									<p class="words">
										<strong class="sub_tit">${pb.picktitle}</strong>
										${pb.picksub }
									</p>
								</div>
							</div>
							<div class="goods_tip">
								<h3><span>YG's Tip</span></h3>
								<div class="tip_box">
									<div class="pic"><img src=${pb.tipimage } class="bg4"></div>
									<p class="words">
										<strong class="sub_tit">${pb.tiptitle1}</strong>
										${pb.tipsub1 }
									</p>
									<p class="words">
										<strong class="sub_tit">${pb.tiptitle2}</strong>
										${pb.tipsub2 }
									</p>
								</div>
							</div>
						</div>				
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
</form>

<jsp:include page="template/footer.jsp"></jsp:include>
</body>
</html>