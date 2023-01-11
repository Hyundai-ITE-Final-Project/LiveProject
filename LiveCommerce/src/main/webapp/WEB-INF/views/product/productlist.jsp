<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/shop.css"> 
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
    <main class="container">
        <div id="shop_wrap">
            <div class="shop_content">
                <div class="menu_tabpanel">
                    <div class="infiniteScroll_wrap">
                        <!-- c:if -->
                            <c:forEach items="${list}" var="product" varStatus="status">
                                <div class="infiniteScroll_wrap">
                                    <div class="videoCard_wrap videoVerticalList_item">
                                        <a href="#" target="self" class="video_link">
                                            <div class="video_wrap">
                                                <div class="video_container">
                                                    <img class="video_container_img" draggable="false" src="${product.img1}">
                                                </div>
                                            </div>
                                        </a>
                                        <span class="video_title">${product.pname}</span>
                                        <a rel="opener" target="_self" href="javascript:0;" class="video_link_creator">
                                            ${product.price}
                                        </a>
                                    </div>
                                </div>
                            </c:forEach>
                    </div>
                </div>
            </div>
        </div>
    </main>
<!-- 김나형 페이지 번호 처리  -->
<div class="paging" style="display: block;">
	<input type="hidden" class="realEnd" value="${pageMaker.realEnd}">
	<a class="prev2" href="#"></a>
	<c:if test="${pageMaker.prev}">
		<!-- 이전 버튼 -->
		<a class="prev"
			href="/product/list?pageNum=${pageMaker.startPage -1}">Previous</a>
	</c:if>

	<!-- 1~10 버튼 -->
	<span class="num">
		<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
			<c:if test="${(pageMaker.startPage+i) <= pageMaker.endPage}">
				<a href="/product/list?pageNum=${num}"
					class="pageBtn">${num}</a>
			</c:if>
		</c:forEach>
	</span>  
	<c:if test="${pageMaker.next}">
		<!-- 다음 버튼 -->
		<a href="/product/list?pageNum=${pageMaker.endPage +1}"
			class="next">Next</a>
	</c:if>
	<a class="next2" href="#"></a>
</div>
<!--  end Pagination -->
<form id='actionForm' action="/list" method='get'>
	<input type='hidden' name='pageNum' value='${pageMaker.cri.pageNum}'>
	<input type='hidden' name='amount' value='${pageMaker.cri.amount}'>
</form>
</body>
<script>
$(document).ready(function() {		
		//페이징 버튼 처리
		var actionForm = $("#actionForm"); //폼등록
		$(".pageBtn").on("click",function(e) {
			e.preventDefault(); //<a> 작동 중지
			console.log('click');
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit(); //form submit
		});//end click
		
	});//  end ready

</script>
</html>