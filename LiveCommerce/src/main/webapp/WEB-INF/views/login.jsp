<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib uri="http://www.springframework.org/tags" prefix="spring" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form"    uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <!-- <link rel="shortcut icon"   href="https://drive.google.com/uc?id=1bbTmb2_R9gb6sEYY5zABHlybxCzhQVWX"> -->
    <title>오늘의쇼핑</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
    <link rel="stylesheet" type="text/css" href="/resources/css/login.css" >
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="/resources/js/common.js"></script>
    <script type="text/javascript" src="/resources/js/login.js"></script>
</head>

<body>
<div id="sign_in_container">


    <div class="img_logo" onclick="location.href='/'" style="cursor:pointer"><img src="../../resources/img/logo/logo.png"></div>
    <div id="sign_in_form">      
        <form name="loginForm" action="/loginProcess" method="POST">
            <div class="login_input_area">
                <div class="login_input">
                    <input type="text" name="userId" id="userId" placeholder="이메일 주소">
                </div>
                <div class="login_input">
                    <input type="password" name="userPw" id="userPw" placeholder="비밀번호">
                </div>
            </div>
            <div class="login_check_area">
	            <input type="checkbox" name="rememberId" id="keep_id" class="keep_check" value="true">
                <label for="keep_id"></label>
                <label class="label_text">아이디 저장</label>
                <input type="checkbox" name="rememberMe" id="keep_signed" class="keep_check" value="true">
                <label for="keep_signed"></label>
                <label class="label_text">로그인 상태 유지</label>
            </div>
            
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
            <div id="login_regul" class="regul_div">${requestScope.loginFailMsg}</div>          
            <div id="btn_login">
                <button type="submit" id="btn_login" class="btn_login btn_point btn_radius_10">로그인</button>
            </div>              
        </form>
    </div>
	<div class="caption">
	    <a href="/find/id">아이디 찾기</a> <em></em> 
	    <a href="/find/pw">비밀번호 재설정</a> <em></em> 
	    <a href="/signup">회원가입</a>
	</div>
    <div id="link_id_login"> 
        <div class="or_bar_box">
            <span class="or_bar or_bar_left"></span>
            <div> 다른 서비스 계정으로 로그인</div>
            <span class="or_bar or_bar_right"></span>
        </div>
        <div id="naver_id_login" style="text-align:center"><a href="${naver_url}">
			<img width="223" src="https://developers.naver.com/doc/review_201802/CK_bEFnWMeEBjXpQ5o8N_20180202_7aot50.png"/></a></div>
			<br>

      

	</div>
</div>
</body>
<script>
$(document).ready(function() {
	/////////////////*sign in*///////////////////
	//쿠키로 저장한 id 가져와서 input에 출력
	//아이디저장하기 체크박스 체크하기
	if (_cookie.get("rememberId")) {
       document.loginForm.userId.value = _cookie.get("rememberId");
	   $("input:checkbox[name='rememberId']").prop("checked", true);
	} else {
	   $("input:checkbox[name='rememberId']").prop("checked", false);
	}
});
</script>