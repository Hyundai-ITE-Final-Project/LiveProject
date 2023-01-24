<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="/WEB-INF/views/header/main_header.jsp"%>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/shop.css"> 
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
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
	}
	.paging .prev2 {
		background:#f8f8f8 url('img/page_pprev.png') no-repeat center center;
		margin-left:0;
	}
	.paging .prev {
		background:#f8f8f8 url('img/page_prev.png') no-repeat center center;
		margin-right:7px;
	}
	.paging .next {
		background:#f8f8f8 url('/resources/img/next.png') no-repeat center center;
		margin-left:7px;
	}
	.paging .next2 {
		background:#f8f8f8 url('img/page_nnext.png') no-repeat center center;
		margin-right:0;
	}
 	.paging .pageBtn .active {
		background-color:#42454c;
		color:#fff;
		border:1px solid #42454c;
	}
	</style>
</head>
<body>
    <main class="container">
        <div id="shop_wrap">
            <div class="shop_content">
            <!-- 카테고리별 보기 -->
                <div class="menu_tabpanel">
                    <div class="infiniteScroll_wrap">
                        <!-- c:if -->
                    	<div class="infiniteScroll_wrap">
                            <c:forEach items="${list}" var="product" varStatus="status">
                                    <div class="videoCard_wrap videoVerticalList_item">
                                        <a href="#" class="video_link">
                                            <div class="video_wrap" productid="${product.pid}">
                                                <div class="video_container">
                                                    <img class="video_container_img" draggable="false" src="${product.img1}">
                                                </div>
                                            </div>
                                        </a>
                                        <span class="video_title">${product.pname}</span>
                                        <a rel="opener" href="javascript:0;" class="video_link_creator">
                                            ${product.price}
                                        </a>
                                    </div>
                            </c:forEach>
						</div>
                    </div>

	                <!-- 김나형 페이지 번호 처리  -->
					<div class="paging" style="display: block;">
						<div class="paging2">
							<input type="hidden" class="realEnd" value="${pageMaker.realEnd}">
							<a class="arrow prev2" href="#"></a>
							<c:if test="${pageMaker.prev}">
								<!-- 이전 버튼 -->
								<a class="arrow prev"
									href="/product/listCategory?lcategory=${lc}&scategory=${sc}&pageNum=${pageMaker.startPage -1}">Previous</a>
							</c:if>
						
							<!-- 1~10 버튼 -->
							<span class="num">
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<c:if test="${(pageMaker.startPage+i) <= pageMaker.endPage}">
										<a href="/product/listCategory?lcategory=${lc}&scategory=${sc}&pageNum=${num}"
											class="pageBtn">${num}</a>
									</c:if>
								</c:forEach>
							</span>  
							<c:if test="${pageMaker.next}">
								<!-- 다음 버튼 -->
								<a href="/product/listCategory?lcategory=${lc}&scategory=${sc}&pageNum=${pageMaker.endPage +1}"
									class="arrow next">Next</a>
							</c:if>
							<a class="arrow next2" href="#"></a>
						</div>
					</div>
					<!--  end Pagination -->
                </div>
            </div>
        </div>
    </main>
<%-- 
<form id='actionForm' action="/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form> --%>
</body>
<script>

$(document).ready(function() {
		// 김나형 productDetail 페이지로 이동
		const products = document.querySelectorAll(".videoCard_wrap")
		for(i = 0; i < products.length; i++){
			var productid = products[i].getElementsByClassName("video_wrap")[0]
				.getAttribute("productid");
			products[i].getElementsByClassName("video_link")[0].setAttribute(
					"href", "/product/productDetail?pid=" + productid);
		}
		var btn = $(".num");
		btn.find("a").click(function(){
			btn.removeClass("active");
			$(this).parent().addClass("active");
		});
	});//  end ready

</script>
</html>