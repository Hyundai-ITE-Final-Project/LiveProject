<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>오늘의쇼핑</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
<link rel="stylesheet" type="text/css" href="/resources/css/login.css" >
<link rel="stylesheet" type="text/css" href="/resources/css/admin.css"> 

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript" src="/resources/js/login.js"></script>
</head>

<div id="admin_wrap">
    <div class="admin_content">
        <div class="admin_menulist">
            <div class="admin_tablist">
                <a href="/tool/live" class="main_tab" aria-selected="false">라이브 관리</a>
                <a href="/tool/products" class="main_tab" aria-selected="false">상품 관리</a>
                <a href="/tool/pdpost" class="main_tab" aria-selected="true">판매글 관리</a>
                <a href="/tool/sale" class="main_tab" aria-selected="false">판매 내역 관리</a>
                <a href="/tool/setting" class="main_tab" aria-selected="false">설정</a>
            </div>
        </div>
        <div class="admin_tool_wrap">
            <div class="admin_tool_area">
                <div class="admin_tool_inner">
                    <div class="admin_tool_top">
                        <div class="chk_deletePost chk_del" onclick="select('remove');">선택 삭제</div>
                        <a href="/manage/productpostadd" class="btn_post_create_move btn_move">판매글 등록</a>
                    </div>
                    <div class="admin_tool_content">
                        <div class="admin_list_body">
                            <div class="admin_list_header">
                                <div class="admin_list_header_viewport">
                                    <div class="pd_h_check">
                                        <input type="checkbox" class="isChek" name="allCheck">
                                    </div>
                                    <!-- <div class="post_cell_1">카테고리</div> -->
                                    <div class="post_cell_2">판매글 번호</div>
                                    <div class="post_cell_3"></div>
                                    <div class="post_cell_4">제목</div>
                                    <div class="post_cell_5">판매가</div>
                                    <div class="post_cell_6">배송방법</div>
                                    <div class="post_cell_7">배송비</div>
                                    <div class="post_cell_8">전시 상태</div>
                                </div>
                            </div>
                            <div class="pdPost_content">
                                <c:forEach var="list" items="${list}" varStatus="postIndex">
                                    <div class="pdPost_content_area">
                                        <div class="pd_h_check">
                                            <div><input type="checkbox" data-pk="${list.ps_index}" name="postlist" id="psId" class="iChek" value="${list.ps_index}">
                                            </div>
                                        </div>
                                        <div class="post_cell_2">
                                            <a href="/tool/pdpost/create?psIndex=${list.ps_index}"
                                                class="text_blue">${list.ps_index}</a>
                                        </div>
                                        <div class="post_cell_3">
                                        </div>
                                        <div class="post_cell_4">
                                            ${list.ps_title}
                                        </div>
                                        <div class="post_cell_5">
                                            <fmt:formatNumber value="${list.ps_price}" pattern="#,###" />
                                        </div>
                                        <div class="post_cell_6">
   <%--                                          <c:choose>
                                                <c:when test="${pds.psDeliveryOpt eq 0}">
                                                   	 무료 배송
                                                </c:when>
                                                <c:otherwise>
                                                    	일반 배송
                                                </c:otherwise>
                                            </c:choose> --%>
                                            	무료배송
                                        </div>
                                        <div class="post_cell_7">
                                            <div>
                                                <fmt:formatNumber value="0" pattern="#,###" />
                                            </div>
                                        </div>
                                        <div class="post_cell_8">
											${list.ps_post_status}
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
	function select(msg){
		var checkArr = new Array();
		
		$(".pd_h_check").each(function(index, item){
			if($(this).find("input[name='postlist']").is(":checked")){
				console.log($(this).find("input[name='postlist']").attr("data-pk"));
				checkArr.push($(this).find("input[name='postlist']").attr("data-pk"));
			}
		});

		if(msg == 'remove'){
			var confirm_val = confirm("선택한 post를 삭제하시겠습니까?");
			if(confirm_val){
				$.ajax({
					url:"/manage/delete",
					type:"POST",
					data:{
						chbox:checkArr
					},
					success: function(){
						location.href = "/manage/productpost";
					},
					error : function(){
						alert("실패");
					}
				});
			}
		}
	}
</script>
