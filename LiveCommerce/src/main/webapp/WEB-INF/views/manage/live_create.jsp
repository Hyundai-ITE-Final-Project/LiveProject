<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <link rel="shortcut icon" href="/img/logo/logo_header_icon.png">
    <title>오늘의쇼핑</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
    <link rel="stylesheet" type="text/css" href="/resources/css/admin.css" >
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script> 
    <script type="text/javascript" src="/resources/js/common.js"></script>
    <script type="text/javascript" src="/resources/js/manage.js"></script>
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
			        <div class="product_create_wrap">
			            <div class="product_create_area">
			                <div class="product_create_inner">
			                    <div class="_title">
			                        <c:choose>
			                            <c:when test="${empty live}">
			                                <h1>라이브 등록</h1>
			                            </c:when>
			                            <c:otherwise>
			                                <h1>라이브 수정</h1>
			                            </c:otherwise>
			                        </c:choose>
			                    </div>
			                    <div class="product_create_content">
			                        <form name="LiveCreateForm" id=" " autocomplete="off" action="/manage/live/create_process" method="post">
				                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
				                        <div class="create_layout">
				                            <div class="layout_subject _asterisk">라이브 제목</div>
				                            <input type="text" name="liveTitle" id="liveTitle" class="layout_input" value="${live.liveTitle}" maxlength='30' >                       
				                        </div>
				                        <%-- <div class="create_layout">
				                            <div class="layout_subject _asterisk">라이브 메인 이미지</div>
				                            <div class="layout_live_upload">
				                                <span class="live_img_upload">
				                                    <c:choose>
				                                        <c:when test="${empty live}">
				                                            <img src="" class="title_img">
				                                        </c:when>
				                                        <c:otherwise>
				                                            <img src="https://s3.ap-northeast-2.amazonaws.com/onlshop.shop${live.uploadPath}/${live.fileId}" class="title_img">
				                                        </c:otherwise>
				                                    </c:choose>
				                                    
				                                    <label for="" class="btn_img">이미지</label> 
				                                </span>                                
				                                <span class="live_img_text">
				                                    <label for="fileName" class="btn_up">업로드</label> 
				                                    <input type="file" id="fileName" class="layout_input_file btn_title_img" multiple> 
				                                    <p class="p_red">- 최대 용량 : 20MB</p>
				                                    <p class="p_red">- 권장 크기 : 720 X 1280</p>
				                                    <p class="p_gray">- 라이브의 대표 이미지를 등록해주세요.</p>
				                                    <p class="p_gray">- 글자가 포함되지 않은 이미지를 사용해주세요.</p>
				                                </span>
				                            </div>                    
				                        </div> --%>
				                        <div class="create_layout">
				                            <div class="layout_subject _asterisk">라이브 예정 일시</div>
				                            <div>
				                                <jsp:useBean id="today" class="java.util.Date" />
				                                <input type="date" name="liveStartDay" id="live_day" class="input_date" 
				                                    <c:choose>
				                                        <c:when test="${empty live}">
				                                            value="<fmt:formatDate value="${today}" pattern="yyyy-MM-dd" />"
				                                        </c:when>
				                                        <c:otherwise>
				                                            value="${live.liveStartDay}"
				                                        </c:otherwise>
				                                    </c:choose> >                                                                      
				                                <input type="time" name="liveStartTime" id="live_startTime" class="input_date" min="7" max="24"
				                                    <c:choose>
				                                        <c:when test="${empty live}">
				                                            value="<fmt:formatDate value="${today}" pattern="HH:mm" />"
				                                        </c:when>
				                                        <c:otherwise>
				                                            value="${live.liveStartTime}"
				                                        </c:otherwise>
				                                    </c:choose> >
				                                <span style="font-size: 24px;padding: 0 10px;">~</span>
				                                <input type="time" name="liveEndTime" id="live_endTime" class="input_date" min="7" max="24"
				                                    <c:choose>
				                                        <c:when test="${empty live}">
				                                            value="<fmt:formatDate value="${today}" pattern="HH:mm" />"
				                                        </c:when>
				                                        <c:otherwise>
				                                            value="${live.liveEndTime}"
				                                        </c:otherwise>
				                                    </c:choose> >
				                            </div>
				                        </div>
				                        
				                        <div class="create_layout">
				                            <div class="layout_subject _asterisk">라이브에 소개할 상품</div>
				                            <div class="layout_filter">
				                                <select name="psIndex" id="psPostSel" class="_filter">
				                                    <option value="non">판매글 선택</option>
				                                    <c:forEach items="${pdPostList}" var="post">
				                                    
				                                        <option value="${post.ps_index}" 
				                                           <c:if test="${post.ps_index eq live.psIndex}"> selected="selected" </c:if>>
				                                           ${post.ps_title}</option>
				                                    </c:forEach>
				                                </select>
				                             </div>
				                        </div>
				                        <div class="create_layout">
				                        
				                        <c:choose>
				                            <c:when test="${empty live}">
				                                <button class="btn_live_create btn_pp">라이브 등록하기</button>
				                            </c:when>
				                            <c:otherwise>
				                                <button class="btn_live_update btn_pp">라이브 수정하기</button>
				                            </c:otherwise>
				                        </c:choose>
				                        </div>
			                        </form>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
			    <input type="hidden" id="live_id" value="${live.liveId}">
			    <%-- <input type="hidden" id="file_id" value="${live.fileId}"> --%>
			</div>
		</main>
		   
	</body>
</html>