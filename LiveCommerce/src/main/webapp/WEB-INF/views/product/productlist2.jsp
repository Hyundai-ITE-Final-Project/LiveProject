<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header/main_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
	<style>
	body{
    	margin: 0 auto;
    	width: auto;
    	font-size:16px;
    }
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
							<c:if test="${pageMaker.prev}">
								<!-- 이전 버튼 -->
								<a class="arrow prev"
									href="/product/listCategory?lcategory=${lc}&scategory=${sc}&pageNum=${pageMaker.startPage -1}"></a>
							</c:if>
						
							<!-- 1~10 버튼 -->
							<span class="num">
								<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
									<c:if test="${(pageMaker.startPage+i) <= pageMaker.endPage}">
										<a href="/product/listCategory?lcategory=${lc}&scategory=${sc}&pageNum=${num}"
											class="pageBtn" onclick="click(${num})">${num}</a>
									</c:if>
								</c:forEach>
							</span>  
							<c:if test="${pageMaker.next}">
								<!-- 다음 버튼 -->
								<a href="/product/listCategory?lcategory=${lc}&scategory=${sc}&pageNum=${pageMaker.endPage +1}"
									class="arrow next"></a>
							</c:if>
						</div>
					</div>
					<!--  end Pagination -->
                </div>
            </div>
        </div>
    </main>
</body>
<script>
$(function() {
	   $(".main4").attr("aria-selected","true");
	   
	});
$(document).ready(function() {
		// 김나형 productDetail 페이지로 이동
		const products = document.querySelectorAll(".videoCard_wrap")
		for(i = 0; i < products.length; i++){
			var productid = products[i].getElementsByClassName("video_wrap")[0]
				.getAttribute("productid");
			products[i].getElementsByClassName("video_link")[0].setAttribute(
					"href", "/product/productDetail?pid=" + productid);
		}

	    function click(num){
	    	var strText = $(num).text();
	    	alert(strText);
	    }
	});//  end ready
</script>
</html>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>