<%@page pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ include file="/WEB-INF/views/header/main_header.jsp"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="/resources/css/shop.css">
<link rel="stylesheet" href="/resources/css/common.css">
<div id="order_wrap">
  <h1 class="order_cp_title">주문이 <span>완료</span>되었습니다.</h1>
    <div class="order_container">
        <h1 class="order_container_title">주문상세</h1>
        <section class="order_pd_list">
            <div class="order_pd_list_header">
                <div class="section_order_title">주문상품</div>
            </div>
            <div class="order_pd_list_content">
                <ul class="order_group">
                    <c:set var = "addDelivery" value = "0"  />
                    <li class="order_group_list">
                        <ul class="order_pd_group">
                             <c:forEach var="od" items="${orderdetail}">
    
                                <li class="order_pd_group_item">
                                    <div class="product_item_img">
                                        <img class="order_img" src="${od.img1}">
                                    </div>
                                    <div class="product_item_text">
                                        <div class="ps_title">${od.pname}</div>
                                        <div class="ps_option">
                                          <span class="price">${od.olprice} 원</span>
                                          <span class="count">${od.olquantity} 개</span>
                                        </div>
                                    </div>
                                        <input type="hidden" class="individual_price_input" value="${od.olprice}">
										<input type="hidden" class="individual_pcount_input" value="${od.olquantity}">
										<input type="hidden" class="individual_totalprice_input" value="${od.olprice * od.olquantity}">
										<input type="hidden" class="individual_totalpoint_input" value="${od.savepoint * od.olquantity}">
                                </li>
                             </c:forEach>
                              <c:set var = "addDelivery" value = "0"  />
                        </ul>
                    </li>

                </ul>
            </div>
        </section>
        <!-- 배송지 정보 -->
				<div class="addressInfo_div">
					<div class="addressInfo_button_div">
						<button class="address_btn address_btn_1" style="background-color: #668679;">사용자 정보 주소록</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div1 addressInfo_input_div_1" style="display: block">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>${orderdetail[0].orderer}</td>
										<th>전화번호</th>
										<td>${orderdetail[0].mtel}</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											${orderdetail[0].oaddress1}<br/>
											${orderdetail[0].oaddress2}															
										</td>
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>		
				<hr>
						<!-- 포인트 정보 -->
				<div class="point_div">
					<div class="point_div_subject">사용된 포인트</div>
					<table class="point_table">
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>포인트 사용</th>
								<td style="font-size:16px; margin-top:5px;"><span class="order_point_input" style="margin-top:5px;">${orderdetail[0].usePoint}</span> 원
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp;					
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr>
							<!-- 쿠폰 정보 -->
				<div class="point_div">
					<div class="point_div_subject">쿠폰 사용</div>
					<table class="point_table">
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>포인트 사용</th>
								<td style="font-size:16px; margin-top:5px;"><span class="couponPrice" style="margin-top:5px;">
									<c:if test="${couponvo.cstate eq 'available'}">
    									<c:out value="0" />
									</c:if>
									<c:if test="${couponvo.cstate eq 'used'}">
    									<c:out value="${couponvo.cprice}" />
									</c:if>
									<c:if test="${couponvo.cstate eq null}">
    									<c:out value="0" />
									</c:if>
								</span> 원
									&nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									&nbsp; &nbsp;					
								</td>
							</tr>
						</tbody>
					</table>
				</div>	
				<hr>	
        <section class="order_total_pay">
            <div class="order_payment_header">
                <div class="section_order_title">결제금액</div>
            </div>
            <div class="order_total_price_wrap">
                <div class="order_list_price">
                    <div class="order_sub_area">
                        <div class="order_sub_price_area sub_inner">
                            <span class="order_total_title">총 상품금액</span>
                            <span class="order_total_price totalPdPrice">
                                &nbsp;원</span>
                        </div>
                        <div class="order_sub_delivery_area sub_inner">
                            <span class="order_total_title">할인금액</span>
                            <span class="order_total_price totalDelivery">&nbsp;원</span>
                        </div>
                        <div class="order_sub_delivery_area sub_inner">
                            <span class="order_total_title">적립예정 포인트</span>
                            <span class="order_total_price savaPoint">&nbsp;원</span>
                        </div>
                    </div>
                    <div class="order_total_area">
                        <div class="order_total_price_area sub_inner">
                            <span class="order_total_title">최종 결제금액</span>
                            <span class="order_total_price totalPrice">
                                &nbsp;원</span> 
                        </div>
                    </div>
                </div>
            </div>
        </section>
    </div>
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
<script type="text/javascript"> 

$(document).ready(function(){
	let finalTotalPrice = 0;		//최종 가격(총 가격 + 배송비)
	let couponPoint = 0; 
	let totalPrice = 0;				// 총 가격
let totalPoint = 0;				// 총 마일리지
let usePoint = 0;				// 사용 포인트(할인가격)

$(".order_pd_group_item").each(function(index, element){
	// 총 가격
	totalPrice += parseInt($(element).find(".individual_totalprice_input").val());

	// 총 마일리지
	totalPoint += parseInt($(element).find(".individual_totalpoint_input").val());
});	


finalTotalPrice = totalPrice;	

/* 사용 포인트 */
usePoint = $(".order_point_input").text();
couponPoint = $(".couponPrice").text();
console.log(usePoint);

/* finalTotalPrice = totalPrice - usePoint - couponPrice; */
finalTotalPrice = totalPrice - usePoint - couponPoint;

/* 값 삽입 */
// 총 가격

$('.totalPdPrice').text(totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+ ' 원');

// 적립예정 포인트
$(".savaPoint").text(totalPoint.toLocaleString()+ ' 원');

// 최종 가격(총 가격 + 배송비)
$(".totalPrice").text(finalTotalPrice.toLocaleString()+' 원');

// 할인가(사용 포인트)
/* $(".totalDelivery").text((parseInt(usePoint)+parseInt(couponPrice)).toLocaleString()+' 원'); */
$(".totalDelivery").text((parseInt(usePoint)+parseInt(couponPoint)).toLocaleString()+' 원');

});



</script>