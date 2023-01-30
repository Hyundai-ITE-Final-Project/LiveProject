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
                            <c:when test="${!empty listOid}">
                                <c:forEach var="list3" items="${list3}" varStatus="stay">
                                    <div class="my-box">
                                        <input type="hidden" value='${list3 }' />
                                        <ul class="orderList_card">
                                            <li class="orderList_card_title">
                                                <span class="order_day">
                                                    <fmt:formatDate value="${list3[0].odate}" pattern="yyyy.MM.dd" />
                                                </span> 주문번호 &nbsp;
                                                ${list3[0].oid}
                                                <!-- <a class="a_order_detail" href="/orders/주문번호">상세정보</a> -->
                                            </li>
                                            <li class="orderList_card_body">
                                                <h3 class="order_status">
                                                    <c:choose>
                                                        <c:when test="${list3[0].ostate ne null}">
                                                            <c:if test="${list3[0].ostate eq '배송준비'}">배송준비</c:if>
                                                            <c:if test="${list3[0].ostate eq '배송중'}">배송중</c:if>
                                                            <c:if test="${list3[0].ostate eq '주문취소'}">주문취소</c:if>
                                                        </c:when>
                                                    </c:choose>
                                                </h3>
                                                <c:forEach var="olist" items="${list3}" varStatus="status">

                                                    <div class="goods_item">
                                                        <div class="goods_thumb">
                                                            <img src="${olist.img1}" width=90 height=90>
                                                        </div>
                                                        <div class="goods_info">
                                                            <div id="ostate${stay.index}${status.index}"
                                                                value="${item.ostate}" class="goods_seller">
                                                            </div>
                                                            <input type="hidden" id="ostate${status.index}" value="${list3[0].ostate}">
                                                            <input type="hidden" id="imp_uid${status.index}" value="${list3[0].imp_uid }">
                                                            <input type="hidden" id="oid${status.index}" value="${list3[0].oid }">
                                                            
                                                            <div class="goods_name">${olist.pname}</div>
                                                            <div class="goods_order_info">
                                                                <span class="goods_price">
                                                                    <fmt:formatNumber value="${olist.olprice}"
                                                                        pattern="#,###" />원</span>
                                                                <fmt:formatNumber value="${olist.olquantity}"
                                                                    pattern="#,###" />개
                                                                <span id="imp_uid${stay.index}${status.index}"
                                                                    value="${olist.imp_uid}"
                                                                    style="display:none">${olist.imp_uid}</span>
                                                                <span id="oid${stay.index}${status.index}"
                                                                    value="${olist.oid}"
                                                                    style="display:none">${olist.oid}</span>
                                                            </div>
                                                        </div>
                                                    </div>

                                                </c:forEach>
                                                <div>
                                                    <c:choose>
                                                        <c:when test="${list3[0].ostate ne null}">
                                                            <c:if test="${list3[0].ostate eq '배송준비'}">
                                                                <button class="btn_cancel"
                                                                    value="${stay.index}${status.index}"
                                                                    onClick="setTotalInfo(this)">주문 취소</button>
                                                            </c:if>
                                                            <c:if test="${list3[0].ostate eq '배송중'}">
                                                                <button class="btn_cancel"
                                                                    value="${stay.index}${status.index}"
                                                                    style="display:none" onClick="setTotalInfo(this)">주문
                                                                    취소</button>
                                                            </c:if>
                                                            <c:if test="${list3[0].ostate eq '주문취소'}">
                                                                <button class="btn_complete"
                                                                    value="${stay.index}${status.index}"
                                                                    onClick="setTotalInfo(this)">취소완료</button>
                                                            </c:if>
                                                        </c:when>
                                                    </c:choose>
                                                </div>
                                                <form class="mypageOrderForm" action="/mypage/ordercancel"
                                                    method="post">
                                                    <input type="hidden" name="${_csrf.parameterName}"
                                                        value="${_csrf.token}">
                                                    <input type="hidden" name="oid" value="${list3[0].oid}">
                                                    <input type="hidden" name="ostate" value="${list3[0].ostate}">
                                                    <input type="hidden" name="imp_uid" value="${list3[0].imp_uid}">
                                                </form>
                                            </li>
                                        </ul>
                                    </div>
                                    <br />
                                    <br />
                                    <br />
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
    function setTotalInfo(btn) {
        var index = btn.value;
        console.log("index : " + index);
        var ostate = document.getElementById('ostate'+index).value;
        var oimp_uid = document.getElementById('imp_uid'+index).value;
        var oid1 = document.getElementById('oid'+index).value;
        console.log("ostate : " + ostate);
        console.log("oimp_uid : " + oimp_uid);
        console.log("oid1 : " + oid1);
        if (ostate == '배송준비') {
            alert("주문취소 완료되었습니다.");
            $("input[name='imp_uid']").val(oimp_uid);
            $("input[name='oid']").val(oid1);
            $(".mypageOrderForm").submit();
        } else if (ostate == '주문취소') {
            alert("이미 주문이 취소되었습니다.");
        } else {
            alert("관리자에게 문의주세요.");
        }
    }
</script>