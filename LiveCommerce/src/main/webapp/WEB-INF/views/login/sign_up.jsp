<%@ page contentType="text/html" pageEncoding="UTF-8" language="java" %>
<%@ taglib prefix="c"       uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt"     uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="form"    uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="texts/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>오늘의쇼핑</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
    <link rel="stylesheet" type="text/css" href="/resources/css/login.css" >
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <!-- <script type="text/javascript" src="/resources/js/common.js"></script> -->
    <script type="text/javascript" src="/resources/js/login.js"></script>
    <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
	<script>
	window.onload = function(){
	    document.getElementById("userZipCodeSign").addEventListener("click", function(){ //주소입력칸을 클릭하면
	        //카카오 지도 발생
	        new daum.Postcode({
	            oncomplete: function(data) { //선택시 입력값 세팅
	            	document.getElementById("userZipCodeSign").value = data.zonecode;
	                document.getElementById("userAddressSign").value = data.address; // 주소 넣기
	                document.querySelector("input[name=maddress2]").focus(); //상세입력 포커싱
	            }
	        }).open();
	    });
	}
	</script>
</head>
<body>
    
<div id="signup_container">	
    <div class="img_logo" onclick="location.href='/'" style="cursor:pointer"><img src="/img/logo/logo.png"></div>
    <div id="signup_form">
        <div class="signup_title"><h1>회원가입</h1></div>
        <%-- <form name="signUpForm" id=" " autocomplete="off"> --%>
        <form name="signUpForm" id=" " autocomplete="off" action="signup/complete" method="post">
            <div class="signup_input_area" >
                <div class="subject">아이디</div>
                <div class="content">로그인, 비밀번호 찾기, 알림에 사용되니 정확한 이메일을 입력해 주세요.</div>
                <input type="text" name="mid" id="userIdSign" autocomplete="off" maxlength='50' placeholder="ex) onlShop@example.com">
                <div id="id_error" class="regul_div"></div>
            </div>
            <div class="signup_input_area">
                <div class="subject">비밀번호</div>
                <div class="content">8~16자 영문 대 소문자, 숫자, 특수문자(!@#$%^&*()-_+=\.)를 입력하세요.</div>            
                <input type="password" name="mpassword" id="userPwSign" autocomplete="off" maxlength='16' autocomplete="new-password">
                <div id="pw_error" class="regul_div"></div>
            </div>
            <div class="signup_input_area">
                <div class="subject">비밀번호 재확인</div>
                <input type="password" name="userRpw" id="userRpwSign" autocomplete="off" maxlength='16' autocomplete="new-password">
                <div id="rpw_error" class="regul_div"></div>
            </div>
            <div class="signup_input_area">
                <div class="subject">이름</div>
                <input type="text" name="mname" id="userNameSign" autocomplete="off" maxlength='15' placeholder="ex) 홍길동">
                <div id="name_error" class="regul_div"></div>
            </div>
            <div class="signup_input_area">
                <div class="subject">전화번호</div>
                <input type="text" name="mtel" id="userPhoneSign" autocomplete="off" placeholder="휴대폰 번호(번호만 입력)"
                    oninput="this.value = this.value.replace(/[^0-9.-]/g, '').replace(/(\..*)\./g, '$1');" maxlength='15'>
                <!-- <button type="button" id="sendPhoneCodeBtn" class="btn_sandCode btn_point btn_radius_5">인증번호 받기</button>
                <div class="relative">
                    <input type="text" name="authCode" id="authCodeSign" disabled="disabled" class="input_disabled" 
                            autocomplete="off" placeholder="인증번호를 입력하세요.">
                    <button type="button" id="phoneCodeCheckBtn" disabled="disabled" class="btn_checkCode btn_gray btn_radius_5" >확인</button>                
                </div> -->
                
                <div id="code_error" class="regul_div"></div>
            </div>
            
            
           <div class="signup_input_area">
                <div class="subject">생일</div>
                <input type="date" name="mbirth" id="userBirthSign">
                <div id="birth_error" class="regul_div"></div>
            </div>
       
            <div class="signup_input_area">
                <div class="subject">이메일</div>
                <input type="text" name="memail" id="userEmailSign" autocomplete="off" maxlength='15' placeholder="ex) hyundai5@hyundai.com">
                <div id="email_error" class="regul_div"></div>
            </div>
            
            <div class="signup_input_area">
                <div class="subject">주소</div>
                <input type="text" name="mzipcode" id="userZipCodeSign" autocomplete="off" maxlength='30' placeholder="ex) 123456">
                <input type="text" name="maddress1" id="userAddressSign" autocomplete="off" maxlength='30' placeholder="ex) 서울 강남구 대치동 945-11">
                <div id="addr_error" class="regul_div"></div>
                <input type="text" name="maddress2" id="userAddressDetailSign" autocomplete="off" maxlength='15' placeholder="ex) 6층">
                
                <div id="addr2_error" class="regul_div"></div>
            </div>
            
            <div class="signup_input_area">
                <div class="subject">성별</div>
            </div>
           
           <div>
            	<input type="radio" name="mgender" autocomplete="off" value="남자" checked>남자    
                <input type="radio" name="mgender" autocomplete="off" value="여자">여자
            </div>
            
            
            <div class="signup_input_area">
                <div class="subject">회원유형</div>
            </div>
            
            <div>
            	<input type="radio" name="mrole" id="userRoleSign" autocomplete="off" value="ROLE_USER" checked>일반유저 
                <input type="radio" name="mrole" id="userRoleSign" autocomplete="off" value="ROLE_ADMIN">관리자
            </div>
           
            <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
         
            <div class="signup_btn_area">
                <!-- <button type="button" id="btn_sign" class="btn_sign btn_point btn_radius_5">가입하기</button>  -->
                <button type="submit" id="btn_sign" class="btn_sign btn_point btn_radius_5">가입하기</button> 
            </div>            
        </form>
    </div>
</div>
</body>
</html>