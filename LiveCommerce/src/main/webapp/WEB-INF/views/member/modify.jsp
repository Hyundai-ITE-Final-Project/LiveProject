<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/header/tool_header.jsp"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<!-- /**
 * @author 박소은
 * @since 2023.01.24
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.24		박소은		최초생성
 * </pre>
 */  -->

<form role="form" action="/member/modify" method="post">
<head>
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
        <link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
	<link rel="stylesheet" type="text/css" href="/resources/css/login.css" >
	<link rel="stylesheet" type="text/css" href="/resources/css/admin.css"> 
    
	<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
	<script type="text/javascript" src="/resources/js/common.js"></script>
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
<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />

<div id="userInfo_wrap" class="mypage_wrap">
    <div id="userInfo_area" class="mypage_area">
        <div class="mypage_title">
            <h1>회원정보 수정</h1>
        </div>
        <!-- mtel, memail, mzipcode, maddress1, maddress2 수정되어야함 -->
        <div class="mypage_content">
            <div class="mypage_group">
	            <div class="withdrawal"><a href="">탈퇴하기</a></div>
	            <input type="hidden" name="mid" value="${userInfo.mid}">
	            <div class="userInfo_input_area">
	                <div class="subject">이메일</div>
	                <input type="text" class="input_w_100" name="memail" value="${userInfo.memail}" readonly>
	            </div>
	            <div class="userInfo_input_area">
	                <span class="subject">이름</span>
	                <input type="text" class="input_w_100" name="mname" value="${userInfo.mname}" readonly>
	            </div>
	            <div class="userInfo_input_area">
	                <span class="subject">전화번호</span>
	                <input type="text" class="input_w_100" name="mtel" value="${userInfo.mtel}" >
	            </div>
	          
	            <div class="signup_input_area">
                <div class="subject">주소</div>
                <input type="text" name="mzipcode" id="userZipCodeSign" autocomplete="off" maxlength='30' value="${userInfo.mzipcode }">
                <input type="text" name="maddress1" id="userAddressSign" autocomplete="off" maxlength='30' value="${userInfo.maddress1}">
                <div id="addr_error" class="regul_div"></div>
                <input type="text" name="maddress2" id="userAddressDetailSign" autocomplete="off" maxlength='15' value="${userInfo.maddress2}">
                
                <div id="addr2_error" class="regul_div"></div>
            </div>
	            
	            
	            <div class="userInfo_btn_area">
	               <button type="submit" id="btn_userEdit" class="info_edit btn_point btn_radius_5">회원정보 수정</button>
	            </div>
            </div>
        </div>
    </div>
</div>
</form>
