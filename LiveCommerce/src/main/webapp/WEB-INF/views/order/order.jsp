<%@page pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/views/header/main_header.jsp"%>
<link rel="stylesheet" href="/resources/css/shop.css">
<link rel="stylesheet" href="/resources/css/common.css">
<sec:authentication var="user" property="principal"/>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.2.0.js"></script>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script> 
<div id="order_wrap">
    <div class="order_container">
        <h1 class="order_container_title">주문/결제</h1>
        <section class="order_pd_list">
            <div class="order_pd_list_header">
                <div class="section_order_title">주문상품</div>
            </div>
            <div class="order_pd_list_content">
                <ul class="order_group">
                    <c:set var = "addDelivery" value = "0"  />
                    <li class="order_group_list">
                        <ul class="order_pd_group">
                             <c:forEach var="ol" items="${orderList}">
    
                                <li class="order_pd_group_item">
                                    <div class="product_item_img">
                                        <img class="order_img" src="${ol.img1}">
                                    </div>
                                    <div class="product_item_text">
                                        <div class="ps_title">${ol.pname}</div>
                                        <div class="ps_option">
                                          <span class="price">${ol.price} 원</span>
                                          <span class="count">${ol.pcount} 개</span>
                                        </div>
                                    </div>
                                        <input type="hidden" class="individual_price_input" value="${ol.price}">
										<input type="hidden" class="individual_saleprice_input" value="${ol.saleprice}">
										<input type="hidden" class="individual_pcount_input" value="${ol.pcount}">
										<input type="hidden" class="individual_totalprice_input" value="${ol.saleprice * ol.pcount}">
										<input type="hidden" class="individual_totalpoint_input" value="${ol.totalpoint}">
										<input type="hidden" class="individual_pid_input" value="${ol.pid}">
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
						<button class="address_btn address_btn_1" onclick="showAdress('1')" style="background-color: #668679;">사용자 정보 주소록</button>
						<button class="address_btn address_btn_2" onclick="showAdress('2')" style="background-color: #efdcec; color:black; font-weight:bold;">직접 입력</button>
					</div>
					<div class="addressInfo_input_div_wrap">
						<div class="addressInfo_input_div addressInfo_input_div_1" style="display: block">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											${memberInfo.mname}
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											${memberInfo.mzipcode} ${memberInfo.maddress1}<br> ${memberInfo.maddress2}
											<input class="selectAddress" value="T" type="hidden">
											<input class="addressee_input" value="${memberInfo.mname}" type="hidden">
											<input class="zipcode_input" type="hidden" value="${memberInfo.mzipcode}">
											<input class="address1_input" type="hidden" value="${memberInfo.maddress1}">
											<input class="address2_input" type="hidden" value="${memberInfo.maddress2}">																			
										</td>
									</tr>
								</tbody>
							</table>
						</div>
						<div class="addressInfo_input_div addressInfo_input_div_2">
							<table>
								<colgroup>
									<col width="25%">
									<col width="*">
								</colgroup>
								<tbody>
									<tr>
										<th>이름</th>
										<td>
											<input class="addressee_input">
										</td>
									</tr>
									<tr>
										<th>주소</th>
										<td>
											<input class="selectAddress" value="F" type="hidden">
											<input class="zipcode_input" readonly="readonly"> <a class="address_search_btn" onclick="execution_daum_address()">주소 찾기</a><br>
											<input class="address1_input" readonly="readonly">
											<input class="address2_input" readonly="readonly">
									</tr>
								</tbody>
							</table>
						</div>
					</div>
				</div>		
				<hr>
						<!-- 포인트 정보 -->
				<div class="point_div">
					<div class="point_div_subject">포인트 사용</div>
					<table class="point_table">
						<colgroup>
							<col width="25%">
							<col width="*">
						</colgroup>
						<tbody>
							<tr>
								<th>포인트 사용</th>
								<td style="font-size:16px;">
									${memberInfo.mpoint}원 &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
									<input class="order_point_input" value="0" style="height: 25px; width: 200px; text-align: right; padding: 12px;"> &nbsp; &nbsp;원 
									 &nbsp; &nbsp;<a class="order_point_input_btn order_point_input_btn_N" data-state="N">모두사용</a>
									 &nbsp; &nbsp;<a class="order_point_input_btn order_point_input_btn_Y" data-state="Y" style="display: none;">사용취소</a>
									
								</td>
							</tr>
						</tbody>
					</table>
				</div>
				<hr>
							<!-- 쿠폰 정보 -->
				<div class="point_div">
					<div class="point_div_subject">쿠폰 사용</div>
				        <select title="쿠폰을 선택해 주세요." id="selectVoucher" style="width: 300px;padding: 7px;border: 1px solid #999;border-radius: 3px;" onchange="selectCoupon(this.value)" >
                              <option value="0">쿠폰을 선택해 주세요.</option>
                            <c:forEach items="${couponList}" var="coupon">
                              <option value="<c:out value="${coupon.cprice}"></c:out>">
                              <c:out value="${coupon.cname}"></c:out></option>
                            </c:forEach>                           
                        </select>
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
                <a class="btn_payment">결제하기</a>
            </div>
        </section>
        			<!-- 주문 요청 form -->
 			<form class="order_form" action="/order" method="post">
 				<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
				<!-- 주문자 회원번호 -->
				<input name="member_mid" value="${memberInfo.mid}" type="hidden">
				<!-- 주소록 & 받는이-->
				<input name="orderer" type="hidden">
				<input name="ozipcode" type="hidden">
				<input name="oaddress1" type="hidden">
				<input name="oaddress2" type="hidden">
				<!-- 사용 포인트 -->
				<input name="usePoint" type="hidden">
				<!-- 주문한 KG이니시스 imp_uid -->
				<input name="imp_uid" type="hidden">
				 <!-- 쿠폰이름 -->
				<input name="cname" type="hidden">
			</form> 
    </div>
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
<script type="text/javascript"> 

$(document).ready(function(){
	
	/* 주문 조합정보란 최신화 */
	setTotalInfo();
});

/* 주소입력란 버튼 동작(숨김, 등장) */
function showAdress(className){
	/* 컨텐츠 동작 */
		/* 모두 숨기기 */
		$(".addressInfo_input_div").css('display', 'none');
		/* 컨텐츠 보이기 */
		$(".addressInfo_input_div_" + className).css('display', 'block');		
	
	/* selectAddress T/F */
		/* 모든 selectAddress F만들기 */
			$(".addressInfo_input_div").each(function(i, obj){
				$(obj).find(".selectAddress").val("F");
			});
		/* 선택한 selectAdress T만들기 */
			$(".addressInfo_input_div_" + className).find(".selectAddress").val("T");		
		
}
 /* 다음 주소 연동 */
 function execution_daum_address(){
 		console.log("동작");
	   new daum.Postcode({
	        oncomplete: function(data) {
	            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분입니다.
	            
	        	// 각 주소의 노출 규칙에 따라 주소를 조합한다.
                // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                var addr = ''; // 주소 변수
                var extraAddr = ''; // 참고항목 변수
 
                //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
                if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                    addr = data.roadAddress;
                } else { // 사용자가 지번 주소를 선택했을 경우(J)
                    addr = data.jibunAddress;
                }
 
                // 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
                if(data.userSelectedType === 'R'){
                    // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                    // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                    if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                        extraAddr += data.bname;
                    }
                    // 건물명이 있고, 공동주택일 경우 추가한다.
                    if(data.buildingName !== '' && data.apartment === 'Y'){
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                    if(extraAddr !== ''){
                        extraAddr = ' (' + extraAddr + ')';
                    }
                 	// 추가해야할 코드
                    // 주소변수 문자열과 참고항목 문자열 합치기
                      addr += extraAddr;
                
                } else {
                	addr += ' ';
                }
 
             	// 제거해야할 코드
                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                $(".zipcode_input").val(data.zonecode);
                $(".address1_input").val(addr);				
                // 커서를 상세주소 필드로 이동한다.
                $(".address2_input").attr("readonly", false);
                $(".address2_input").focus();	 
	            
	            
	        }
	    }).open();  	
	
}

 /* 포인트 입력 */
//0 이상 & 최대 포인트 수 이하
$(".order_point_input").on("propertychange change keyup paste input", function(){
	const maxPoint = parseInt('${memberInfo.mpoint}');	
	
	let inputValue = parseInt($(this).val());	
	
	if(inputValue < 0){
		$(this).val(0);
	} else if(inputValue > maxPoint){
		$(this).val(maxPoint);
	}	
	
	/* 주문 조합정보란 최신화 */
	 setTotalInfo();	 
	
});

/* 포인트 모두사용 취소 버튼 
 * Y: 모두사용 상태 / N : 모두 취소 상태
 */
$(".order_point_input_btn").on("click", function(){
	const maxPoint = parseInt('${memberInfo.mpoint}');	
	
	let state = $(this).data("state");	
	
	if(state == 'N'){
		console.log("n동작");
		/* 모두사용 */
		//값 변경
		$(".order_point_input").val(maxPoint);
		//글 변경
		$(".order_point_input_btn_Y").css("display", "inline-block");
		$(".order_point_input_btn_N").css("display", "none");
	} else if(state == 'Y'){
		console.log("y동작");
		/* 취소 */
		//값 변경
		$(".order_point_input").val(0);
		//글 변경
		$(".order_point_input_btn_Y").css("display", "none");
		$(".order_point_input_btn_N").css("display", "inline-block");		
	}	
	
	/* 주문 조합정보란 최신화 */
	setTotalInfo();	

});

let totalCount = 0;				// 총 갯수
let totalKind = 0;				// 총 종류
let finalTotalPrice = 0;		//최종 가격(총 가격 + 배송비)
let couponPrice = 0;
/* 총 주문 정보 세팅(배송비, 총 가격, 마일리지, 물품 수, 종류) */
function setTotalInfo(){
	let totalPrice = 0;				// 총 가격
	    totalCount = 0;				// 총 갯수
	    totalKind = 0;				// 총 종류
	let totalPoint = 0;				// 총 마일리지
	let deliveryPrice = 0;			// 배송비
	let usePoint = 0;				// 사용 포인트(할인가격)
	    finalTotalPrice = 0; 		// 최종 가격(총 가격 + 배송비)	
		//console.log(couponPrice);
	$(".order_pd_group_item").each(function(index, element){
		// 총 가격
		totalPrice += parseInt($(element).find(".individual_totalprice_input").val());
		// 총 갯수
		totalCount += parseInt($(element).find(".individual_pcount_input").val());
		// 총 종류
		totalKind += 1;
		// 총 마일리지
		totalPoint += parseInt($(element).find(".individual_totalpoint_input").val());
	});	
	// 배송비 결정 
/* 	if(totalPrice >= 30000){
		deliveryPrice = 0;
	} else if(totalPrice == 0){
		deliveryPrice = 0;
	} else {
		deliveryPrice = 3000;	
	} */
	
	finalTotalPrice = totalPrice;	
	
	/* 사용 포인트 */
	usePoint = $(".order_point_input").val();
	
	finalTotalPrice = totalPrice - usePoint - couponPrice;
	
	/* 값 삽입 */
	// 총 가격

	$('.totalPdPrice').text(totalPrice.toString().replace(/\B(?<!\.\d*)(?=(\d{3})+(?!\d))/g, ",")+ ' 원');
	$/* (".order_total_price").text(totalPrice.toLocaleString()); */
	// 총 갯수
	$(".goods_kind_div_count").text(totalCount);
	// 총 종류
	$(".goods_kind_div_kind").text(totalKind);
	// 총 마일리지
	$(".savaPoint").text(totalPoint.toLocaleString()+ ' 원');
	// 배송비
	$(".delivery_price_span").text(deliveryPrice.toLocaleString());	
	// 최종 가격(총 가격 + 배송비)
	$(".totalPrice").text(finalTotalPrice.toLocaleString()+' 원');		
	// 할인가(사용 포인트)
	$(".totalDelivery").text((parseInt(usePoint)+parseInt(couponPrice)).toLocaleString()+' 원');
	
}
var date = new Date();
var year = date.getFullYear().toString();
var month = date.getMonth() + 1;
month = month < 10 ? '0' + month.toString() : month.toString();
var day = date.getDate();
day = day < 10 ? '0' + day.toString() : day.toString();
var hour = date.getHours();
hour = hour < 10 ? '0' + hour.toString() : hour.toString();
var minites = date.getMinutes();
minites = minites < 10 ? '0' + minites.toString() : minites.toString();
var seconds = date.getSeconds();
seconds = seconds < 10 ? '0' + seconds.toString() : seconds.toString();

let oid="${memberInfo.mid}"+"_"+year + month + day + hour + minites + seconds;
// 주문 요청 
  $(".btn_payment").on("click", function(){
	  console.log(totalKind + '종' + totalCount + '개');
	  console.log("${orderList[0].pname}");
		//결제 코드 받아오기
		var IMP = window.IMP;
		IMP.init("imp71146844");
		console.log(oid);
		console.log(typeof finalTotalPrice);
		//주문총금액이 쿠폰금액보다 작다면 예외처리
		if(finalTotalPrice < 0) {
			alert("최종결제금액을 확인해주세요.");
		}
		else {
		 	//결제 부분 시작
			  IMP.request_pay({
				        pg : 'html5_inicis',//이니시스 결제 시스템을 하기 위한 부분 고정시켜야합니다
				        pay_method : 'card',
				        merchant_uid: oid,  //주문 아이템 oid값
				        name : '${orderList[0].pname}', //주문한거 이름
				        //amount : finalTotalPrice, //가격
				        amount : finalTotalPrice, //가격
				        buyer_email : '${memberInfo.memail}', //산사람 이메일 
				        buyer_name : '${memberInfo.mname}',//산사람 이름
				        buyer_tel : '${memberInfo.mtel}',//산사람 번호
				        buyer_addr : '${memberInfo.maddress1}',//산사람 주소
				        buyer_postcode : '${memberInfo.mzipcode}'//산사람 주소코드
				
				    }, function (rsp) { // callback
				        if (rsp.success) {
				        	//db에 컬럼만들어서 넣어줘야됨 이게 service에 들어가면됨
				        	let imp_uid = rsp.imp_uid;
				        	//결제 성공에 대한 부분
				            console.log(rsp);
				        	// 주소 정보 & 받는이
				        	$(".addressInfo_input_div").each(function(i, obj){
				        		if($(obj).find(".selectAddress").val() === 'T'){
				        			$("input[name='member_mid']").val("${memberInfo.mid}");
				        			$("input[name='orderer']").val($(obj).find(".addressee_input").val());
				        			$("input[name='ozipcode']").val($(obj).find(".zipcode_input").val());
				        			$("input[name='oaddress1']").val($(obj).find(".address1_input").val());
				        			$("input[name='oaddress2']").val($(obj).find(".address2_input").val());	
				        		}
				        	});	
				        	
				        	// 사용 포인트 
				        	$("input[name='usePoint']").val($(".order_point_input").val());	
				        	// 주문한 imp_uid
				        	$("input[name='imp_uid']").val(imp_uid);
				        	// 상품정보 
				        	let form_contents = ''; 
				        	$(".order_pd_group_item").each(function(index, element){
				        		let pid = $(element).find(".individual_pid_input").val();
				        		let pcount = $(element).find(".individual_pcount_input").val();
				        		let pid_input = "<input name='orders[" + index + "].pid' type='hidden' value='" + pid + "'>";
				        		form_contents += pid_input;
				        		let pcount_input = "<input name='orders[" + index + "].olquantity' type='hidden' value='" + pcount + "'>";
				        		form_contents += pcount_input;
				        	});	
				        	$(".order_form").append(form_contents);	
				        	
				        	// 서버 전송 
				        	$(".order_form").submit();	
			  	
				    } else {
				    	//결제 실패에 대한 부분
				        console.log(rsp);
				    }
				}); 
		}

}); 


function selectCoupon(str) {
	couponPrice = parseInt(str);
	//console.log(couponPrice);
	setTotalInfo();

	//var index = $("#selectVoucher option").index($("#selectVoucher option:selected"));
	var a = $("#selectVoucher option:checked").text();
	var b = a.trimStart();
	$("input[name='cname']").val(b);
	//var b = $('#ccode1').val();
	console.log(b);
}


</script>