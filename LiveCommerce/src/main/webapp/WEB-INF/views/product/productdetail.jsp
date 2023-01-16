<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<title>Insert title here</title>
<script>
	// 제품 수량 변경
	function change_qty(button){
		console.log("버튼클릭");
		 var min_qty = 1;
		 var this_qty = $("#txtqty").val()*1;
		 var this_price = $("#price").val()*1;
		 var max_qty = 5;
		 if(button=='left'){
			 console.log("왼쪽");
			 this_qty -= 1;
			 if(this_qty < min_qty){
				 this_qty = 1;
			 }
			 console.log(this_qty);
		 }
		 else if(button=='right'){
			 console.log("오른쪽");
			 this_qty += 1;
			 if(this_qty > max_qty){
				 alert("재고가 부족합니다.");
				 return;
			 }
			 console.log(this_qty);
		 }
		 var show_total_amount = this_price * this_qty;
		 $("#txtqty").val(this_qty);
	
		 $("#sumPrice").html('₩ '+show_total_amount.format());
	
		 $("#pamount").val(this_qty);
	}

</script>
</head>
<body>
	<section class="proinfo-area">
	    <!-- propic// -->
	    <div class="propic">
	        <div class="propicsmall">
	            <div class="swiper-container propicsmallswiper" style="opacity: 1;">
	                <div id="P_picSmall" class="swiper-wrapper" style="display: inline-block;">
	                    <div class="swiper-slide">
	                        <a href="#" class="active">
	                            <img src="${productInfo.img1}" style="width: 520px; height: 624;">
	                        </a>
	                    </div>
	                </div>
	            </div>
	        </div>
	    </div>
	    <div class="proinfo">
	        <h2>
	            <strong>${productInfo.pname}</strong>
	        </h2>
	        <div class="price" id="price_section">
	            <span class="txt-price">
	                <strong><em>${productInfo.price}</em>원</strong>
	            </span>
	        </div>
	        <div class="detailinfo">
	            <dl>
	                <dt>원산지</dt>
	                <dd>
	                    ${productInfo.origin}
	                </dd>
	                <dt>포장타입</dt>
	                <dd>
	                    ${productInfo.packing}
	                </dd>
	                <dt>배송형태</dt>
	                <dd id="deliverySection">
				                    새벽배송 / 밤 11시까지 결제 시<br>
				                    배송비 3,500원 (5만원 이상 구매 시 무료)<br>
	                </dd>
	                <dt>상품선택</dt>
	                <dd>
	                    <div class="optionarea" id="top_optionarea">
	                        <div class="optionls">
	                            <div>
	                                <strong class="txt-ti">
										${productInfo.pname}
	                                </strong>
	                                <div class="ea-area">
	                                    <input type="text" id="txtqty" title="수량 입력" value="1" class="mr0" readonly="readonly">
	                                    <a style="cursor:pointer" onclick="change_qty('left');" class="left">
	                                        	수량낮추기
	                                    </a>
	                                    <a style="cursor:pointer" onclick="change_qty('right');" class="right">
	                                        	수량 올리기
	                                    </a>
	                                </div>
	                                <span class="txt-price">
	                                	<input type="hidden" name="price" id="price" value="${productInfo.price}" readonly="`  ">
	                                    <em>${productInfo.price}</em>원
	                                </span>
	                            </div>
	                        </div>
	                    </div>
	                </dd>
	            </dl>
	        </div>
	        <div class="buybutton" id="top_buybutton">
	            <p class="txt-price">총 금액 <strong><em>${productInfo.price}</em>원</strong></p>
	            <div class="btns">
	                <button type="button" class="btn orange bigger btn-buy"
	                    onclick="fnPopupScaleOpenA(this, '#p_popCartAdd');">장바구니</button>
	                <button type="button" class="btn fill orange bigger btn-buy"
	                    onclick="fnPopupScaleOpenB(this, '');">바로구매</button>
	            </div>
	        </div>
	    </div>
	</section>
</body>
</html>