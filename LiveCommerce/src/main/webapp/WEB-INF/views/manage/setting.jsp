<%@page  pageEncoding="UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/header/tool_header.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<script type="text/javascript" src="/resources/js/admin.js"></script>

</head>
<div id="admin_wrap">

    <div class="admin_content">
        <div class="setting_wrap">
            <div class="setting_area">
                <div class="setting_content">
                    
                    <div class="setting_part">
		                <div class="_title">
			                <h1>방송 암호키 설정</h1>
			            </div>
			            <div class="setting_layout">
			                <div class="layout_subject">방송 암호 키</div>
			                <input type="password" id="stream" class="layout_input" value="${streamkey}">
			                
			                <div class="setting_layout_botton">
	                            <button class="btn_input_type">표시</button>
	                            <span class="setting_layout_btn_area">
		                            <button type="button" class="btn_copy _btn btn_blue">복사</button>
		                            <button onclick="location.href='/manage/setting/updateKey?mid=${user.username}';" type="button" class="btn_clean _btn">초기화</button>                               
	                            </span>
			                </div>
			            </div>  
		            </div>
	            </div>        
            </div>
        </div>
    </div>
</div>
	<script>
	$(function() {                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
	console.log("테스트 입니다.");
	
	$(".setting_tab").attr("aria-selected","true");
	
})
</script>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>