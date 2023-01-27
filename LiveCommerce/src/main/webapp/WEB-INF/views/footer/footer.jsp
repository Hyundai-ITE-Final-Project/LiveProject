<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<link rel="stylesheet" href="/resources/css/commons.css"></link>
<sec:authentication var="user" property="principal"/>
<footer class="shop_footer">
<div id="footer_view">
    <div class="footer_btn_area">
		I_LIVE
	</div>
	<div class="footer_nav">
	    <a href="javascript:void(0);">사이트 소개</a>
	    <a href="javascript:void(0);">개인정보처리방침 </a>
	    <a href="javascript:void(0);">이용약관</a>
	    <a href="javascript:void(0);">문제보고</a>
	</div>
    <div class="footer-capy minitext">
        © I-LIVE Corporation
    </div>
</div>
</footer> 