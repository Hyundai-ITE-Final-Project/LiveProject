<%@page pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ include file="/WEB-INF/views/header/main_header.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>     
<div id="orderList_wrap" class="mypage_wrap">
    <div id="orderList_area" class="mypage_area">
        <div class="mypage_title">
            <h1>주문 목록</h1>
        </div>
        <div class="orderList_content">
            <div class="orderList_group">
                <div>
                    <div class="orderList_list_wrap">
                        <c:choose>
                        <c:when test="${!empty list1}">
                      <c:forEach var="list" items="${list1}" varStatus="stay">
                      <div class="my-box">
                         <ul class="orderList_card">

                           <c:forEach var="olist" items="${list}" varStatus="status">
                           <li class="orderList_card_title">
                                <span class="order_day"><fmt:formatDate value="${olist.odate}" pattern="yyyy.MM.dd" /></span> 주문번호 &nbsp; ${olist.oid}
                               <!-- <a class="a_order_detail" href="/orders/주문번호">상세정보</a> -->
                           </li> 
                              <li class="orderList_card_body">
                                <h3 class="order_status">
                                    <c:choose>
                                        <c:when test="${olist.ostate ne null}">
                                            <c:if test="${olist.ostate eq '배송준비'}">배송준비</c:if>
                                            <c:if test="${olist.ostate eq '배송중'}">배송중</c:if>
                                            <c:if test="${olist.ostate eq '주문취소'}">주문취소</c:if>
                                        </c:when>                          
                                    </c:choose>
                                </h3>
                                <div class="goods_item">
                                    <div class="goods_thumb">
                                        <img src="${olist.img1}" width=90 height=90>
                                    </div>
                                    <div class="goods_info">
                                        <div id="ostate${stay.index}${status.index}" value="${item.ostate}" class="goods_seller">${olist.ostate}</div>
                                        <div class="goods_name">${olist.pname}</div>
                                        <div class="goods_order_info">
                                            <span class="goods_price"> <fmt:formatNumber value="${olist.olprice}" pattern="#,###" />원</span>
                                             <fmt:formatNumber value="${olist.olquantity}" pattern="#,###" />개
                                             <span id="imp_uid${stay.index}${status.index}" value = "${olist.imp_uid}" style="display:none">${olist.imp_uid}</span> 
                                             <span id="oid${stay.index}${status.index}" value = "${olist.oid}" style="display:none">${olist.oid}</span> 
                                        </div>
                                    </div>
                                    <div>
                                       <c:choose>
                                        <c:when test="${olist.ostate ne null}">
                                            <c:if test="${olist.ostate eq '배송준비'}">
                                                <button class="btn_cancel" value="${stay.index}${status.index}" onClick="setTotalInfo(this)">주문 취소</button>
                                            </c:if>
                                            <c:if test="${olist.ostate eq '배송중'}">
                                                <button class="btn_cancel" value="${stay.index}${status.index}" style="display:none" onClick="setTotalInfo(this)">주문 취소</button>
                                            </c:if>
                                            <c:if test="${olist.ostate eq '주문취소'}">
                                                <button class="btn_complete" value="${stay.index}${status.index}" onClick="setTotalInfo(this)">취소완료</button>
                                            </c:if>
                                        </c:when>
                                    </c:choose> 
                                </div>
                               </div>
                               </li>
                    <form class="mypageOrderForm" action="/mypage/ordercancel" method="post">
	                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="oid" value="${item.oid}">
						<input type="hidden" name="ostate" value="${item.ostate}">
						<input type="hidden" name="imp_uid" value="${item.imp_uid}">
					</form>        
                           </c:forEach>
                         </ul>
                         </div>
                         <br/>
                         <br/>
                         <br/>         
                        </c:forEach>
                       </c:when>
                       <c:otherwise>
                            <div> 구매 이력이 없습니다.</div>
                       </c:otherwise>
                      </c:choose>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>
<script>
//주문삭제 버튼
function setTotalInfo(btn){
	var index = btn.value;
	console.log(index);
 	var ostate = $("#ostate"+index).text();
	var oimp_uid = $("#imp_uid"+index).text();
	var oid1 = $("#oid"+index).text();
	console.log(ostate);
	console.log(oimp_uid);
	console.log(oid1);
	console.log(oimp_uid);
     if(ostate == '배송준비') {
		alert("주문취소 완료되었습니다.");
		$("input[name='imp_uid']").val(oimp_uid);
		$("input[name='oid']").val(oid1);
    	$(".mypageOrderForm").submit();	
	}
	else if(ostate == '주문취소'){
		alert("이미 주문이 취소되었습니다.");
	}
	else {
		alert("관리자에게 문의주세요.");
	}     
}
</script>