<%@page pageEncoding="UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/header/tool_header.jsp"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<!-- <link rel="shortcut icon"   href="https://drive.google.com/uc?id=1bbTmb2_R9gb6sEYY5zABHlybxCzhQVWX"> -->
<title>오늘의쇼핑</title>

<script type="text/javascript">
	$(document).ready(
			function() {
				var result = '<c:out value="${result}"/>';

				checkModal(result);

				history.replaceState({}, null, null);

				function checkModal(result) {
					if (result === '' || history.state) {
						return;
					}

					if (parseInt(result) > 0) {
						$(".modal-body").html(
								"게시글 " + parseInt(result) + " 번이 등록되었습니다.");
					}

					$("#myModal").modal("show");
				}

				$("#regBtn").on("click", function() {

					self.location = "/manage/registerProduct";
				});

				var actionForm = $("#actionForm");

				$(".paginate_button a").on("click", function(e) {
							e.preventDefault();

							console.log('click');
							alert('바보야!')

							actionForm.find("input[name='pageNum']").val($(this).attr("href"));
							actionForm.submit();
				});

			

				$(".move").on(
					"click",
					function(e) {
						e.preventDefault();
						actionFrom.append("<input type='hidden' name='pid' value'"
								+ $(this).attr("href") + "'>");
						actionFrom.attr("action", "manage/get");
						actionForm.submit();
					}
				);
			});
</script>
</head>

<body>
	<div id="admin_wrap">
		<div class="admin_content">
			<div class="admin_menulist">
				<div class="admin_tablist">
					<a href="/manage/live" class="main_tab" aria-selected="false">라이브
						관리</a> <a href="/manage/products" class="main_tab" aria-selected="true">상품
						관리</a> <a href="/manage/productpost" class="main_tab" aria-selected="false">판매글
						관리</a> <a href="/manage/orderList" class="main_tab" aria-selected="false">판매
						내역 관리</a> <a href="/manage/setting" class="main_tab"
						aria-selected="false">설정</a>
				</div>
			</div>
			<div class="admin_tool_wrap">
				<div class="admin_tool_area">
					<div class="admin_tool_inner">
						<div class="admin_tool_top">
							<div class="chk_deletePd chk_del">선택 삭제</div>
							<a href="/manage/registerProduct"
								class="btn_pd_create_move btn_move">제품 등록</a>
						</div>
						<div class="admin_tool_content">
							<div class="admin_list_body">
								<div class="admin_list_header">
									<div class="admin_list_header_viewport">
										<div class="pd_h_check">
											<input type="checkbox" class="isChek">
										</div>
										<div class="pd_cell_2">제품번호</div>
										<div class="pd_cell_3">제품명</div>
										<div class="pd_cell_4">판매상태</div>
										<div class="pd_cell_5">판매가격</div>
										<div class="pd_cell_6">재고수량</div>
										<div class="pd_cell_7">등록날짜</div>
									</div>
								</div>
								<div class="pd_content">
									<c:forEach var="products" items="${products}">
										<div class="pd_content_area">
											<div class="pd_h_check">
												<div>
													<input type="checkbox" class="iChek" id="pdId"
														value="${pds.pdId}">
												</div>
											</div>
											<div class="pd_cell_2">
												<a href="/manage/get?pid=${products.pid}" class="text_blue">${products.pid}</a>
											</div>
											<div class="pd_cell_3">
												<a class='move' href='<c:out value="${products.pid }"/>'>
													<c:out value="${products.pname }" />
												</a>

											</div>
											<div class="pd_cell_4">
												<c:choose>
													<c:when test="${products.pstatus eq '0'}">
		                                      판매중지
		                                  </c:when>
													<c:otherwise>
		                                      판매중
		                                  </c:otherwise>
												</c:choose>
											</div>
											<div class="pd_cell_5">
												<div>
													<fmt:formatNumber value="${products.price}" pattern="#,###" />
												</div>
											</div>
											<div class="pd_cell_6">
												<div>${products.pstock}</div>
											</div>
											<div class="pd_cell_7">
												<fmt:formatDate value="${products.pregdate}"
													pattern="yyyy-MM-d" type="date" />
											</div>
										</div>
									</c:forEach>
								</div>
							</div>

						</div>
						<div class="paging" style="display: block;">
					<input type="hidden" class="realEnd" value="${pageMaker.realEnd}">
					<a class="prev2" href="#"></a>
					<c:if test="${pageMaker.prev}">
						<!-- 이전 버튼 -->
						<a class="prev" href="/manage/products?pageNum=${pageMaker.startPage - 1}">Previous</a>
					</c:if>
	
					<!-- 1~10 버튼 -->
					<span class="num">
						<c:forEach var="num"
							begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							<c:if test="${(pageMaker.startPage+i) <= pageMaker.endPage}">
								<a href="/manage/products?pageNum=${num}" class="pageBtn">${num}</a>
							</c:if>
						</c:forEach>
					</span>  
					<c:if test="${pageMaker.next}">
						<!-- 다음 버튼 -->
						<a href="/manage/products?pageNum=${pageMaker.endPage +1}" class="next">Next</a>
					</c:if>
					<a class="next2" href="#"></a>
				</div>

					</div>

				</div>

			</div>

		</div>
	</div>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>