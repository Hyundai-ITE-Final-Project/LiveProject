<%@page pageEncoding="UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/header/tool_header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>     
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<!-- <link rel="shortcut icon"   href="https://drive.google.com/uc?id=1bbTmb2_R9gb6sEYY5zABHlybxCzhQVWX"> -->
<title>오늘의쇼핑</title>
</head>

<body>
			<div class="admin_tool_wrap">
				<div class="admin_tool_area">
					<div class="admin_tool_inner">			
						<div class="admin_tool_content">
							<div class="admin_list_body">
								<div class="admin_list_header">
									<div class="admin_list_header_viewport">
										<div class="pd_cell_2">주문번호</div>
										<div class="pd_cell_3">주문 아이디</div>
										<div class="pd_cell_4">주문 날짜</div>
										<div class="pd_cell_5">주문 상태</div>
										<div class="pd_cell_6">주문 Iamport번호</div>
										<div class="pd_cell_7">취소</div>
									</div>
								</div>

								<div class="pd_content">
									<c:forEach var="item" items="${list}" varStatus="status">
										<div class="pd_content_area">

											<div class="pd_cell_2">
												<a  class="text_blue">
													<span id="oid${status.index}" value = "${item.oid}">${item.oid}</span> 
												</a>
											</div>
											<div class="pd_cell_3">
												<a class='move'>
													<c:out value="${item.member_mid}" />
												</a>

											</div>
											<div class="pd_cell_4">
												<a class='move'>
													<c:out value="${item.odate}" />
												</a>
											</div>
											<div class="pd_cell_5">
												<a class='move'>
													<span id="ostate${status.index}" value="${item.ostate}">${item.ostate}</span>
												</a>
											</div>
											<div class="pd_cell_6">
												<div><span id="imp_uid${status.index}" value="${item.imp_uid}">${item.imp_uid}</span></div>
											</div>
											<div class="pd_cell_7">
												<button id="cancelbtn" class="btn_orderCancel" value="${status.index}" onClick="setTotalInfo(this)">주문취소</button>
											</div>
										</div>
									<form class="manageOrderForm" action="/manage/ordercancel" method="post">
	              					  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
										<input type="hidden" name="oid" value="">
										<input type="hidden" name="imp_uid" value="">
									</form>        
									</c:forEach>
	
								        <!-- 검색 영역 -->
                    <div class="search_wrap">
                    	<form id="searchForm" action="/manage/orderList" method="get">
                    		<div class="search_input">
                    			<input type="text" name="keyword" value='<c:out value="${pageMaker.cri.keyword}"></c:out>'>
                    			<input type="hidden" name="pageNum" value='<c:out value="${pageMaker.cri.pageNum }"></c:out>'>
                    			<input type="hidden" name="amount" value='${pageMaker.cri.amount}'>
                    			<button class='btn search_btn'>검 색</button>
                    		</div>
                    	</form>
                    </div>                 
                  
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
					
	
	                 <form id="moveForm" action="/manage/orderList" method="get">
						<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
						<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
						<input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
					</form>     
	                    
                    </div>
      
							</div>
						</div>
					</div>
				</div>
			</div>
<script>
$(function() {
	console.log("테스트 입니다.");
	
	$(".order_tab").attr("aria-selected","true");
	
})


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
	console.log("ddddd");
 	e.preventDefault();
	
	console.log($(this).attr("href"));
	
	moveForm.find("input[name='pageNum']").val($(this).attr("href"));
	
	moveForm.submit(); 
	
});

//주문삭제 버튼
function setTotalInfo(btn){
	var index = btn.value;
	var ostate = $("#ostate"+index).text();
	var oimp_uid = $("#imp_uid"+index).text();
	var oid1 = $("#oid"+index).text();
	//console.log("index: " + index + " , oid : " + oid);
	console.log(index);
	console.log(ostate);
	console.log(oid1);
	console.log(oimp_uid);
	if(ostate == '배송준비') {
		alert("주문취소 완료되었습니다.");
		$("input[name='imp_uid']").val(oimp_uid);
		$("input[name='oid']").val(oid1);
    	$(".manageOrderForm").submit();	
	}
	else if(ostate == '배송중'){
		alert("주문취소 완료되었습니다.");
		$("input[name='imp_uid']").val(oimp_uid);
		$("input[name='oid']").val(oid1);
    	$(".manageOrderForm").submit();	
	}
	else {
		alert("이미 주문이 취소되었습니다.");
	}
}
</script>
					
					
<%-- <%@include file="/WEB-INF/views/footer/footer.jsp" %> --%>