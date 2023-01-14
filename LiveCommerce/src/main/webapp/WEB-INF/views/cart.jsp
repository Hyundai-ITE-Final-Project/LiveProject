<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="/resources/css/cart.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

<div class="wrapper">
	<div class="wrap">
		<div class="top_gnb_area">
			<ul class="list">
				<c:if test = "${member == null}">	<!-- 로그인 x -->	
					<li >
						<a href="/member/login">로그인</a>
					</li>
					<li>
						<a href="/member/join">회원가입</a>
					</li>
				</c:if>
				<c:if test="${member != null }">	<!-- 로그인 o -->		
					<c:if test="${member.mrole == ADMIN }">	<!-- 관리자 계정 -->
						<li><a href="/admin/main">관리자 페이지</a></li>
					</c:if>							
					<li>
						<a id="gnb_logout_button">로그아웃</a>
					</li>
					<li>
						마이룸
					</li>
					<li>
						<a href="/cart/${member.mid}">장바구니</a>
					</li>
				</c:if>				
				<li>
					고객센터
				</li>			
			</ul>			
		</div>
		<div class="top_area">
			<!-- 로고영역 -->
			<div class="logo_area">
				<a href="/main"><img src="/resources/img/mLogo.png"></a>
			</div>
<%-- 			<div class="search_area">
                	<div class="search_wrap">
                		<form id="searchForm" action="/search" method="get">
                			<div class="search_input">
                				<select name="type">
                					<option value="T">책 제목</option>
                					<option value="A">작가</option>
                				</select>
                				<input type="text" name="keyword" value="<c:out value="${pageMaker.cri.keyword}"/>">
                    			<button class='btn search_btn'>검 색</button>                				
                			</div>
                		</form>
                	</div>
			</div> --%>
			<div class="login_area">
			
				<!-- 로그인 하지 않은 상태 -->
				<c:if test = "${member == null }">
					<div class="login_button"><a href="/member/login">로그인</a></div>
					<span><a href="/member/join">회원가입</a></span>				
				</c:if>				
				
				<!-- 로그인한 상태 -->
				<c:if test="${ member != null }">
					<div class="login_success_area">
						<span>회원 : ${member.mname}</span>
						<span>포인트 : <fmt:formatNumber value="${member.mpoint }" pattern="#,###" /></span>
						<a href="/member/logout.do">로그아웃</a>
					</div>
				</c:if>
				
			</div>
			<div class="clearfix"></div>			
		</div>
		<div class="content_area">
			
			<div class="content_subject"><span>장바구니</span></div>
			<!-- 장바구니 리스트 -->
			<div class="content_middle_section"></div>
			<!-- 장바구니 가격 합계 -->
			<!-- cartInfo -->
			<div class="content_totalCount_section">
				
				<!-- 체크박스 전체 여부 -->
				<div class="all_check_input_div">
					<input type="checkbox" class="all_check_input input_size_20" checked="checked"><span class="all_chcek_span">전체선택</span>
				</div>				
				
				<table class="subject_table">
					<caption>표 제목 부분</caption>
					<tbody>

						<tr>
							<th class="td_width_1"></th>
							<th class="td_width_2"></th>
							<th class="td_width_3">상품명</th>
							<th class="td_width_4">가격</th>
							<th class="td_width_4">수량</th>
							<th class="td_width_4">합계</th>
							<th class="td_width_4">삭제</th>
						</tr>
					</tbody>
				</table>
				<table class="cart_table">
					<caption>표 내용 부분</caption>
					<tbody>
						<c:forEach items="${cartInfo}" var="ci">
							<tr>
								<td class="td_width_1 cart_info_td">
									<input type="checkbox" class="individual_cart_checkbox input_size_20" checked="checked">
									<%-- <input type="hidden" class="individual_bookPrice_input" value="${ci.bookPrice}"> --%>
									<input type="hidden" class="individual_saleprice_input" value="${ci.saleprice}">
									<input type="hidden" class="individual_p_quantity_input" value="${ci.p_quantity}">
									<input type="hidden" class="individual_totalprice_input" value="${ci.saleprice * ci.p_quantity}">
									<%-- <input type="hidden" class="individual_point_input" value="${ci.point}"> --%>
									<input type="hidden" class="individual_totalpoint_input" value="${ci.totalpoint}">
									<input type="hidden" class="individual_product_pid_input" value="${ci.product_pid}">								
								</td>
								<td class="td_width_2">
									<div class="image_wrap">
										<img src="${ci.img1}">
									</div>							
								</td>
								<td class="td_width_3">${ci.pname}</td>
								<td class="td_width_4 price_td">
									<del>판매가 : <fmt:formatNumber value="${ci.saleprice}" pattern="#,### 원" /></del><br>
									<%-- 판매가 : <span class="red_color"><fmt:formatNumber value="${ci.salePrice}" pattern="#,### 원" /></span><br>
									마일리지 : <span class="green_color"><fmt:formatNumber value="${ci.point}" pattern="#,###" /></span> --%>
								</td>
								<td class="td_width_4 table_text_align_center">
									<div class="table_text_align_center quantity_div">
										<input type="text" value="${ci.p_quantity}" class="quantity_input">	
										<button class="quantity_btn plus_btn">+</button>
										<button class="quantity_btn minus_btn">-</button>
									</div>
									<a class="quantity_modify_btn" data-cartid="${ci.cart_id}">변경</a>
								</td>
								<td class="td_width_4 table_text_align_center">
									<fmt:formatNumber value="${ci.saleprice * ci.p_quantity}" pattern="#,### 원" />
								</td>
								<td class="td_width_4 table_text_align_center">
									<button class="delete_btn" data-cartid="${ci.cart_id}">삭제</button>
								</td>
							</tr>
						</c:forEach>
					</tbody>
				</table>
				<table class="list_table">
				</table>
			</div>
			<!-- 가격 종합 -->
			<div class="content_total_section">
				<div class="total_wrap">
					<table>
						<tr>
							<td>
								<table>
									<tr>
										<td>총 상품 가격</td>
										<td>
											<span class="totalPrice_span">70000</span> 원
										</td>
									</tr>
									<tr>
										<td>배송비</td>
										<td>
											<span class="delivery_price">3000</span>원
										</td>
									</tr>									
								</table>
							</td>
							<td>
								<table>
									<tr>
										<td></td>
										<td></td>
									</tr>
								</table>							
							</td>
						</tr>
					</table>
					<div class="boundary_div">구분선</div>
					<table>
						<tr>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 결제 예상 금액</strong>
											</td>
											<td>
												<span class="finalTotalPrice_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
							<td>
								<table>
									<tbody>
										<tr>
											<td>
												<strong>총 적립 예상 마일리지</strong>
											
											</td>
											<td>
												<span class="totalPoint_span">70000</span> 원
											</td>
										</tr>
									</tbody>
								</table>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<!-- 구매 버튼 영역 -->
			<div class="content_btn_section">
				<a class="order_btn">주문하기</a>
			</div>
			
			<!-- 수량 조정 form -->
 			<form action="/cart/update" method="post" class="quantity_update_form">
				<input type="hidden" name="cart_id" class="update_cart_id">
				<input type="hidden" name="p_quantity" class="update_p_quantity">
				<input type="hidden" name="member_mid" value="gd">
			</form>	
			
			<!-- 삭제 form -->
			<form action="/cart/delete" method="post" class="quantity_delete_form">
				<input type="hidden" name="cart_id" class="delete_cartId">
				<input type="hidden" name="member_mid" value="gd">
			</form>		
<%--			<!-- 주문 form -->
			<form action="/order/${member.memberId}" method="get" class="order_form">

			</form>		 --%>		
						
			
		</div>

		
	</div>	<!-- class="wrap" -->
</div>	<!-- class="wrapper" -->

<script>
$(document).ready(function(){
	
	 //종합 정보 섹션 정보 삽입 
	setTotalInfo();	 
	
});	

//체크여부에따른 종합 정보 변화 
$(".individual_cart_checkbox").on("change", function(){
	//총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) 
	setTotalInfo($(".cart_info_td"));
});

//체크박스 전체 선택 
$(".all_check_input").on("click", function(){

	//체크박스 체크/해제 
	if($(".all_check_input").prop("checked")){
		$(".individual_cart_checkbox").prop('checked',true);
		} else{
		$(".individual_cart_checkbox").prop('checked',false);
	}
	
	//총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) 
	setTotalInfo($(".cart_info_td"));	
	
});


// 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) 
function setTotalInfo(){
	
	let totalprice = 0;				// 총 가격
	let totalpoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
	
	$(".cart_info_td").each(function(index, element){
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			// 총 가격
			totalprice += parseInt($(element).find(".individual_totalprice_input").val());
			// 총 마일리지
			totalpoint += parseInt($(element).find(".individual_totalpoint_input").val());
		}
	});	
	
	/* 배송비 결정 */
	if(totalprice >= 30000){
		deliveryPrice = 0;
	} else if(totalprice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	}	
	
	/* 최종 가격 */
	finalTotalPrice = totalprice + deliveryPrice;
	
	/* 값 삽입 */
	// 총 가격
	$(".totalPrice_span").text(totalprice.toLocaleString());
	// 총 마일리지
	$(".totalPoint_span").text(totalpoint.toLocaleString());
	// 배송비
	$(".delivery_price").text(deliveryPrice);	
	// 최종 가격(총 가격 + 배송비)
	$(".finalTotalPrice_span").text(finalTotalPrice.toLocaleString());
}

// 수량버튼 
$(".plus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	$(this).parent("div").find("input").val(++quantity);
});
$(".minus_btn").on("click", function(){
	let quantity = $(this).parent("div").find("input").val();
	if(quantity > 1){
		$(this).parent("div").find("input").val(--quantity);		
	}
});


// 수량 수정 버튼 
$(".quantity_modify_btn").on("click", function(){
	let cartid = $(this).data("cartid");
	let p_quantity = $(this).parent("td").find("input").val();
	$(".update_cart_id").val(cartid);
	$(".update_p_quantity").val(p_quantity);
	$(".quantity_update_form").submit();
	console.log("시발 왜 안되");
	console.log(cartid);
	console.log(p_quantity);
});

// 장바구니 삭제 버튼 
$(".delete_btn").on("click", function(e){
	e.preventDefault();
	const cartId = $(this).data("cartid");
	$(".delete_cartId").val(cartId);
	$(".quantity_delete_form").submit();
	
});
	
// 주문 페이지 이동 
/* $(".order_btn").on("click", function(){
	
	let form_contents ='';
	let orderNumber = 0;
	
	$(".cart_info_td").each(function(index, element){
		
		if($(element).find(".individual_cart_checkbox").is(":checked") === true){	//체크여부
			
			let bookId = $(element).find(".individual_bookId_input").val();
			let bookCount = $(element).find(".individual_bookCount_input").val();
			
			let bookId_input = "<input name='orders[" + orderNumber + "].bookId' type='hidden' value='" + bookId + "'>";
			form_contents += bookId_input;
			
			let bookCount_input = "<input name='orders[" + orderNumber + "].bookCount' type='hidden' value='" + bookCount + "'>";
			form_contents += bookCount_input;
			
			orderNumber += 1;
			
		}
	});	

	$(".order_form").html(form_contents);
	$(".order_form").submit();
	
}); */
		

</script>

</body>
</html>