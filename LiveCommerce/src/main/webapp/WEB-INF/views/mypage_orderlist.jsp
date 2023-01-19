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
로그인ID : <sec:authentication property="name"/><br>
로그인 Auth : <sec:authentication property="authorities"/><br>
로그인 Detail : <sec:authentication property="Details"/><br>
로그인 Credentials : <sec:authentication property="Credentials"/>
로그인 Principal : <sec:authentication property="Principal"/><br>
			<%-- 	<%@include file="../includes/admin/header.jsp" %> --%>
				
                <div class="admin_content_wrap">
                    <div class="admin_content_subject"><span>주문 현황</span></div>
					<div class="author_table_wrap">
						<!-- 게시물 O -->
						<c:if test="${listCheck != 'empty' }">
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
	                    			<td><span id="ostate${status.index}" value="${item.ostate}"/>${item.ostate}</span></td>
	                    			<td><button id="cancelbtn" class="btn_orderCancel" value="${status.index}" onClick="setTotalInfo(this)">주문취소</button><td>
	                    		</tr>
	                <form class="mypageOrderForm" action="/ordercancel" method="post">
	                	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
						<input type="hidden" name="oid" value="${item.oid}">
						<input type="hidden" name="ostate" value="${item.ostate}">
						<input type="hidden" name="imp_uid" value="${item.imp_uid}">
					</form>        
	                    		</c:forEach>
	                    	</table> 					
						</c:if>
						
                		<!-- 게시물 x -->
                		<c:if test="${listCheck == 'empty'}">
                			<div class="table_empty">
                				등록된 작가가 없습니다.
                			</div>
                		</c:if> 						
                			
                    </div> 
                    
                     <!-- 검색 영역 -->
 <%--                    <div class="search_wrap">
                    	<form id="searchForm" action="/orderList" method="get">
                    		<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                    			<button class='btn search_btn'>검 색</button>
                    		</div>
                    	</form>
                    </div> --%>
                    
                                        <!-- 페이지 이동 인터페이스 영역 -->
                    <div class="pageMaker_wrap" >
                    
	                    <ul class="pageMaker">
	                    
	                    	<!-- 이전 버튼 -->
	                    	<c:if test="${pageMaker.prev}">
	                    		<li class="pageMaker_btn prev">
	                    			<a href="${pageMaker.startPage - 1}">이전</a>
	                    		</li>
	                    	</c:if>
	                    	
	                    	<!-- 페이지 번호 -->
	                    	<c:forEach begin="${pageMaker.startPage}" end="${pageMaker.endPage}" var="num">
	                    		<li class="pageMaker_btn ${pageMaker.cri.pageNum == num ? "active":""}">
	                    			<a href="${num}">${num}</a>
	                    		</li>
	                    	</c:forEach>
	                    	
	                    	<!-- 다음 버튼 -->
	                    	<c:if test="${pageMaker.next}">
	                    		<li class="pageMaker_btn next">
	                    			<a href="${pageMaker.endPage + 1 }">다음</a>
	                    		</li>
	                    	</c:if>
	                    	
	                    </ul>
	                    
                    </div>          
                </div>
                

                    
					<form id="moveForm" action="/orderList" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>                             
 
 			<%-- 	<%@include file="../includes/admin/footer.jsp" %> --%>

<script>
$(document).ready(function(){
	


});


let searchForm = $('#searchForm');
let moveForm = $('#moveForm');

/* 작거 검색 버튼 동작 */
$("#searchForm button").on("click", function(e){
	
	e.preventDefault();
	
	/* 검색 키워드 유효성 검사 */
	if(!searchForm.find("input[name='keyword']").val()){
		alert("키워드를 입력하십시오");
		return false;
	}
	
	searchForm.find("input[name='pageNum']").val("1");
	
	searchForm.submit();
	
});


/* 페이지 이동 버튼 */
$(".pageMaker_btn a").on("click", function(e){
	
	e.preventDefault();
	
	console.log($(this).attr("href"));
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit();
	
});
//주문삭제 버튼
function setTotalInfo(btn){
	var index = btn.value;
	var ostate = $("#ostate"+index).text();
	//console.log("index: " + index + " , oid : " + oid);
	if(ostate == '배송준비') {
		alert("주문취소 완료되었습니다.");
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