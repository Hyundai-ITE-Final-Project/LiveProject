<%@page   contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <link rel="shortcut icon" href="/img/logo/logo_header_icon.png">
    <title>오늘의쇼핑</title>
    <link rel="stylesheet" type="text/css" href="/css/common.css" >
    <link rel="stylesheet" type="text/css" href="/css/admin.css" >
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script> 
    <script type="text/javascript" src="/js/common.js"></script>
    <script type="text/javascript" src="/js/admin.js"></script>
</head>
<body>
    <%@ include file="/WEB-INF/views/header/tool_header.jsp"%>
    <main class="container">
		<div id="admin_wrap">
		    <div class="admin_content">
		        <div class="admin_menulist">
		            <div class="admin_tablist">
		                <a href="/tool/live"      class="main_tab" aria-selected="true">라이브 관리</a>
		                <a href="/tool/products"  class="main_tab" aria-selected="false">상품 관리</a>
		                <a href="/tool/pdpost" class="main_tab" aria-selected="false">판매글 관리</a>
		                <a href="/tool/sale"     class="main_tab" aria-selected="false">판매 내역 관리</a>
		                <a href="/tool/setting"   class="main_tab" aria-selected="false">설정</a>
		            </div>
		        </div>
		        <div class="admin_tool_wrap">
		            <div class="admin_tool_area">
		                <div class="admin_tool_inner">
		                    <div class="admin_tool_top">
		                        <a href ="/manage/live/create" class="btn_pd_create_move btn_move">라이브 등록</a>
		                    </div>
		                    <div class="admin_tool_content">
		                        <div class="admin_list_body">
		                            <div class="admin_list_header">
		                                <div class="admin_list_header_viewport">
		  <!--                                   <div class="pd_h_check">
		                                      <input type="checkbox" class="isChek">
		                                    </div> -->
		                                    <div class="live_cell_2">상태</div>
		                                    <div class="live_cell_3">라이브아이디</div>
		                                    <div class="live_cell_4"></div>
		                                    <div class="live_cell_5">라이브 제목</div>
		                                    <div class="live_cell_6"></div>
		                                </div>
		                            </div>
		                            <div class="live_content">
		                              <c:forEach var="live" items="${liveList}" varStatus="status">
		                                <div class="live_content_area">
		                                    <%-- <div class="pd_h_check">
		                                        <div><input type="checkbox" class="iChek" value="${pds.pdId}"></div>
		                                    </div> --%>
		                                    <div class="live_cell_2">
		                                        <c:if test="${live.liveStatus eq '0'}">대기</c:if>
		                                        <c:if test="${live.liveStatus eq '1'}">라이브중</c:if>
		                                        <c:if test="${live.liveStatus eq '2'}">종료</c:if>
		                                        <c:if test="${live.liveStatus eq '3'}">라이브불가</c:if>
		<%-- 	                                    <jsp:useBean id="now" class="java.util.Date" />
			                                    <fmt:formatDate var="todayFormat" value="${now}" pattern="yyyy.MM.dd HH:mm" />
			                                    <c:set var="liveStartDate" value="${live.liveStartDay} ${live.liveStartTime}" />
			                                    <c:set var="liveEndDate" value="${live.liveStartDay} ${live.liveEndTime}" />
		                                        <c:if test = "${todayFormat < liveStartDate}">대기</c:if>
		                                        <c:if test = "${todayFormat >= liveStartDate && todayFormat <= liveEndDate}">라이브중</c:if>
		                                        <c:if test = "${todayFormat > liveEndDate}">종료</c:if> --%>
		                                    </div>
		                                    <div class="live_cell_3">
		                                       <a href="/manage/live/create?live=${live.liveId}" id="liveid${status.index}" class="text_blue">${live.liveId}</a>
		                                    </div>
		                                    <div class="live_cell_4">
		                                    </div>
		                                    <div class="live_cell_5">
		                                            <div class="live_cell_5_1">${live.liveTitle}</div>
		                                            <div class="live_cell_5_2">${live.liveStartDay} ${live.liveStartTime}</div>
		                                            <div class="live_cell_5_3">${live.liveView}</div>
		                                    </div>
		                                    <div class="live_cell_6">
			                                    <c:if test="${live.liveStatus eq '2'}">
			                                        <button class="btn_live_delete" value="${status.index}" onClick="sendData(this)">통계</button>
			                                    </c:if>
		                                    </div>
		  
		                                </div>
		                                
		                            <form class="statistics" action="/manage/chart" method="post">
	              					  	<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}">
	              					  	<input type="hidden" name="live_id" value="">
									</form>    
		                                </c:forEach>
		                            </div>
		                        </div>
		                    </div>
		                </div>
		            </div>
		        </div>
		    </div>
		</div>

    </main>
<script>
	function sendData(btn) {
		var index = btn.value;
		console.log(index);
		var live_id = $("#liveid"+index).text();
		console.log(live_id);
		var a = $("input[name='live_id']").val(live_id);
    	$(".statistics").submit();	
	}
</script>
</body>
</html>