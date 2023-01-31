<%@page pageEncoding="UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/header/tool_header.jsp"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>오늘의쇼핑</title>
    <style>
   		 .post_cell_2{width:190px;}
   		 .post_cell_4{width:400px; text-align:center;}
   		 .post_cell_6{width:230px;}
   		 .post_cell_8{width:230px;}
   		 	.paging {
		margin-top:50px;
		margin-bottom:30px;
		text-align:center;
		font-size:0;
	}
	.paging2 {
		display:inline-block;
	}
	.paging .none {
		display:none;
	}
	.paging .pageBtn {
		display:block;
		margin:0 3px;
		float:left;
		border:1px solid #e6e6e6;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}
	.paging .arrow {
		border:1px solid #ccc;
		display:block;
		margin:0 3px;
		float:left;
		width:28px;
		height:28px;
		line-height:28px;
		text-align:center;
		background-color:#fff;
		font-size:13px;
		color:#999999;
		text-decoration:none;
	}

	.paging .prev {
		background:#f8f8f8 url('/resources/img/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.paging .arrow.next {
		background:#f8f8f8 url('/resources/img/page_next.png') no-repeat center center;
		margin-left:7px;
	}
 	.paging .pageBtn.active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
    </style>
</head>

<div id="admin_wrap">
    <div class="admin_content">
        <div class="admin_menulist">
            <div class="admin_tablist">
                <a href="/manage/live" class="main_tab" aria-selected="false">라이브 관리</a>
                <a href="/manage/products" class="main_tab" aria-selected="false">상품 관리</a>
                <a href="/manage/productpost" class="main_tab" aria-selected="true">판매글 관리</a>
                <a href="/manage/orderList" class="main_tab" aria-selected="false">판매 내역 관리</a>
                <a href="/manage/setting" class="main_tab" aria-selected="false">설정</a>
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
                                    <div class="post_cell_2">판매글 번호</div>
                                    <div class="post_cell_4">제목</div>
                                    <div class="post_cell_6">배송방법</div>
                                    <div class="post_cell_8">전시 상태</div>
                                </div>
                            </div>
                            <div class="pdPost_content">
                                <c:forEach var="list" items="${list}" varStatus="postIndex">
                                    <div class="pdPost_content_area">
                                        <div class="pd_h_check" style="padding-top: 60px;">
                                            <div><input type="checkbox" data-pk="${list.ps_index}" name="postlist" id="psId" class="iChek" value="${list.ps_index}">
                                            </div>
                                        </div>
                                        <div class="post_cell_2">
                                        	<input type="hidden" id="ps_index" name="ps_index" value="${list.ps_index}">
                                            <a href="/manage/postmodify?ps_index=${list.ps_index}"
                                                class="text_blue">${list.ps_index}</a>
                                        </div>
                                        <div class="post_cell_4">
                                            ${list.ps_title}
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
                                        <div class="post_cell_8">
											${list.ps_post_status}
                                        </div>
                                    </div>
                                </c:forEach>
                            </div>
                        </div>
                    </div>
                </div>
                <div style="height:50px"></div>
                <div class="paging" style="display: block;">
                	<div class="paging2">
						<input type="hidden" class="realEnd" value="${pageMaker.realEnd}">
						<c:if test="${pageMaker.prev}">
							<!-- 이전 버튼 -->
							<a class="arrow prev" href="/manage/productpost?pageNum=${pageMaker.startPage - 1}"></a>
						</c:if>
		
						<!-- 1~10 버튼 -->
						<span class="num">
							<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								<c:if test="${(pageMaker.startPage+i) <= pageMaker.endPage}">
									<a href="/manage/productpost?pageNum=${num}" class="pageBtn">${num}</a>
								</c:if>
							</c:forEach>
						</span>  
						<c:if test="${pageMaker.next}">
							<!-- 다음 버튼 -->
							<a href="/manage/productpost?pageNum=${pageMaker.endPage +1}" class="arrow next"></a>
						</c:if>
					</div>
				</div>
            </div>
        </div>
    </div>
</div>
<script>
$(function() {
	console.log("테스트 입니다.");
	
	$(".productpost_tab").attr("aria-selected","true");
	
})

let csrfHeaderName ="${_csrf.headerName}";
let csrfTokenValue="${_csrf.token}";
	$(document).ready(function(){
		$("input[name=allCheck]").on('click', function(){
			var chk = $(this).is(":checked");
			if(chk){
				$("input[name='postlist']").each(function(){
					var checkBoxOpt = $(this).prop("disabled");
					if(!checkBoxOpt){
						$(this).attr("checked", true);
					}
				});
			} else{
				$("input[name='postlist']").attr("checked", false);
			}
		});
		$("input[name=postlist]").click(function(){
			var total = $("input[name=postlist]").length;
			var checked = $("input[name=postlist]:checked").length;
			if(total != checked){
				$("input[name=allCheck]").prop("checked", false);
			}
			else{
				$("input[name=allCheck]").prop("checked", true);
			}
		});
	});

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
					beforeSend: function(xhr) { xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
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
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>