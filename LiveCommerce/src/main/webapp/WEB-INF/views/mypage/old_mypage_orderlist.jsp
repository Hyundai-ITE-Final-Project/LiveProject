<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>     
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/mypage_orderlist.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
</head>
<body>
<%-- 로그인ID : <sec:authentication property="name"/><br>
로그인 Auth : <sec:authentication property="authorities"/><br>
로그인 Detail : <sec:authentication property="Details"/><br>
로그인 Credentials : <sec:authentication property="Credentials"/>
로그인 Principal : <sec:authentication property="Principal"/><br>
 --%>				
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>주문 현황</span></div>
					<div class="author_table_wrap">
						<!-- 게시물 O -->
	                    	<table class="order_table">
	                    	<colgroup>
	                    		<col width="21%">
	                    		<col width="20%">
	                    		<col width="20%">
	                    		<col width="20%">
	                    		<col width="19%%">
	                    	</colgroup>
	                    		<thead>
	                    			<tr>
	                    				<td class="th_column_1">주문 번호</td>
	                    				<td class="th_column_2">주문 아이디</td>
	                    				<td class="th_column_3">주문 날짜</td>
	                    				<td class="th_column_4">주문 상태</td>
	                    				<td class="th_column_5">취소</td>
	                    			</tr>
	                    		</thead>
	                    		<c:forEach items="${list}" var="item" varStatus="status">
	                    		<tr>
	                    			<td><span id="oid${status.index}" value = "${item.oid}">${item.oid}</span> </td>
	                    			<td><c:out value="${item.member_mid}"></c:out></td>
	                    			<td><fmt:formatDate value="${item.odate}" pattern="yyyy-MM-dd"/></td>
	                    			<td><span id="ostate${status.index}" value="${item.ostate}">${item.ostate}</span></td>
	                    			<td><button id="cancelbtn" class="btn_orderCancel" value="${status.index}" onClick="setTotalInfo(this)">주문취소</button><td>
	                    			<td><span id="imp_uid${status.index}" value = "${item.imp_uid}">${item.imp_uid}</span> </td>
	                <form class="mypageOrderForm" action="/mypage/ordercancel" method="post">
	                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="oid" value="${item.oid}">
						<input type="hidden" name="ostate" value="${item.ostate}">
						<input type="hidden" name="imp_uid" value="${item.imp_uid}">
					</form>        
	                    		</tr>
	                    		</c:forEach>
	                    	</table> 					
									
               
                    </div> 
                
                </div>
 
 			<%-- 	<%@include file="../includes/admin/footer.jsp" %> --%>

<script>

//주문삭제 버튼
function setTotalInfo(btn){
	var index = btn.value;
	var ostate = $("#ostate"+index).text();
	var oimp_uid = $("#imp_uid"+index).text();
	var oid1 = $("#oid"+index).text();
	//console.log("index: " + index + " , oid : " + oid);
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

</body>
</html>