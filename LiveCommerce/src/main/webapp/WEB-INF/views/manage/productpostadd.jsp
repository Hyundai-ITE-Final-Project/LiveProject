<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
<link rel="stylesheet" type="text/css" href="/resources/css/login.css" >
<link rel="stylesheet" type="text/css" href="/resources/css/admin.css"> 

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
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
        <div class="product_create_wrap">
            <div class="product_create_area">
                <div class="product_create_inner">
                    <div class="_title">
                        <h1>판매글 등록</h1>
                    </div>
                    <form id="postadd" name="formm" action="/manage/productpostadd" method="post">
                        <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                        <input type="hidden" id="mid" name="mid" value="${member}">
                        <div class="product_create_content">
                            <div class="create_layout">
                                <div class="layout_subject _asterisk">판매글 제목</div>
                                <input type="text" id="psTitle" name="ps_title" class="layout_input" value="" maxlength='30'>
                            </div>
                            <div class="create_layout">
                                <div class="layout_subject _asterisk">게시물 판매가(최소 금액)</div>
                                <input type="text" id="psPrice" class="layout_input" name="ps_price" value="" maxlength='11' oninput="this.value = this.value.replace(/[^0-9.,]/g, '').replace(/(\..*)\./g, '$1');">
                            </div>
                            <div class="create_layout">
						    	<div class="layout_subject _asterisk">판매 상품 추가</div>
						    	<div class="layout_memo">상품 체크/체크 해제 후 등록하면 상품이 새로 등록됩니다.</div>
							    <div>
							        <div class="pdAddList_area">
							            <div class="pdAddList_header">
							                <div class="pdAddList_h_viewport">
							                    <div class="pdAddList_h_check">
							                        <input type="checkbox" class="isChek">
							                    </div>
							                    <div class="pdAddList_cell_1">상품명</div>
							                    <div class="pdAddList_cell_2">상품금액</div>
							                </div>
							            </div>
							            <input type="hidden" id="productlist" name="productlist"/>
							            <div class="pdAddList_content">
							                <c:forEach items="${pd}" var="pd">
							                    <div class="pdAddList_content_area">
							                        <div class="pdAddList_h_check">
							                            <div>
							                                <input type="checkbox" id="addPdVal" class="iChek" data-pk="${pd.pid}" name="postlist" value="${pd.pid}">
							                            </div>
							                        </div>
							                        <div class="pdAddList_cell_1">${pd.pname}</div>
							                        <div class="pdAddList_cell_2">
							                            <fmt:formatNumber value="${pd.price}" pattern="#,###" />
							                        </div>
							                    </div>
							                </c:forEach>
							            </div>
							        </div>
							    </div>
							</div>
                            <div class="create_layout">
                                <div class="layout_subject _asterisk">판매 상태</div>
                                <select name="ps_post_status" id="pdPostOnOff" class="_filter">
                                    <option value="">판매 상태</option>
                                    <option value="판매중">판매중</option>
                                    <option value="판매중지">판매중지</option>
                                </select>
                            </div>
                            <div class="create_layout">
                    			<button class="btn_post_create btn_pp" onclick="go_save()">판매글 등록하기</button>
                    		</div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
/*     var ifrContent = $('#psContentText').text();
    //iframe 디자인모드
    var iframe = document.getElementById("psContentIframe").contentWindow;
    //var lodeContent=document.getElementById("psContentIframe").innerHTML;
    var iframeD = iframe.document;
    if (ifrContent != '') {
        iframeD.write("<!DOCTYPE html><html><body>" + ifrContent + "</body></html>");
    }
    iframeD.designMode = 'on';
    //iframe.focus();  */

    function go_save(){
        if(document.formm.ps_title.value ==""){
            alert("제목을 입력해주세요");
        } else if(document.formm.ps_price.value == ""){
            alert("가격을 설정해주세요");
        } else if(document.formm.ps_post_status.value ==""){
            alert("판매상태를 설정해주세요");
        } else{
    		var valueArr = new Array();
    		var list = $("input[name='postlist']");
    		for(var i=0; i<list.length; i++){
    			if(list[i].checked){
    				valueArr.push(list[i].value);
    			}
    		}
    		if(valueArr.length == 0){
    			alert("선택된 글이 없습니다.");
    		}
    		$("#productlist").val(valueArr);
    		
            document.formm.submit();
            //document.formm2.submit();
        }
    }
</script>