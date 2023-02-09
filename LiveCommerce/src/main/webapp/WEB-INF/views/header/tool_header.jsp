<%@page pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
<link rel="stylesheet" type="text/css" href="/resources/css/admin.css"> 
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css"> 

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/login.js"></script>
<sec:authentication var="user" property="principal"/>
<header class="admin_header">
    <form:form action="/logout" method="POST" id="logoutForm">
    <div class="admin_logo_wrap">
        <a href="/" class="logo_link">
            <i class="header_icon logo_icon"></i>
            <span class="blind">H-LIVE</span>
        </a>
        <a href="/tool/live" class="logo_link_admin">
            
        </a>
    </div>
    <nav class="header_nav">
        <c:choose>
            <c:when test="${user eq 'anonymousUser'}">
                <a href="/login" class="h_nav_pa">
                    <span class="h_btn_login">로그인</span>
                </a>
            </c:when>
            <c:otherwise>
                <span class="selName_area">${user.username}</span>
                <button class="h_btn_login h_btn_logout">로그아웃</button>
            </c:otherwise>
        </c:choose>
    </nav>
    </form:form>
    	<div id="admin_wrap">
			<div class="admin_content">
			<div class="admin_menulist">
				<div class="admin_tablist">

					<a href="/manage/live" onclick="maintab(one)" class="live_tab" aria-selected="false">라이브관리</a> 
					<a href="/manage/products" onclick="maintab(two)" class="products_tab" aria-selected="false">상품관리</a> 
					<a href="/manage/productpost" onclick="maintab(three)" class="productpost_tab" aria-selected="false">판매글관리</a> 
					<a href="/manage/orderList" onclick="maintab(four)" class="order_tab" aria-selected="false">판매내역 관리</a> 					
					<a href="/manage/setting?mid=${user.username}" onclick="maintab(five)" class="setting_tab"aria-selected="false">설정</a>
					<a href="/manage/role" onclick="maintab(six)" class="memberManage_tab"aria-selected="false">회원관리</a>
				</div>
			</div>
		</div>
	 </div>
    
</header>

