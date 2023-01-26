<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@ include file="/WEB-INF/views/header/tool_header.jsp"%>

<div id="mypage_wrap" class="mypage_wrap">
    <div id="mypage_area" class="mypage_area">      
        <div class="mypage_title">
	        <h1>My Page</h1>
	    </div>
	    <div class="menubox">
	       <div class="menubox_group">
            <div class="mypage_boxs">                   
                <div class="order_list" onclick="location.href='/mypage/orderList';">
                    <p>구매내역</p>
                    <img height='70px' style='text-align:center; margin-top:50px;' src="/resources/img/receipt.jpg">
                </div>              
            </div>
           
            <div class="mypage_boxs" onclick="location.href='/member/modify';">
                <div class="user_modify" style="background-position: 0 -200px;">
                    <p>회원정보수정</p>
                    <img height='70px' style='text-align:center; margin-top:50px' src="/resources/img/modify.jpg">
                </div>
            </div>
            
	       </div>

	    </div>
	</div>
</div>