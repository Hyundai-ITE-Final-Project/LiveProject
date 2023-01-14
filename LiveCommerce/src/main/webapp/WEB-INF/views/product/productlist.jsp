<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
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
            <!-- 카테고리별 보기 -->
				<div id="popCategory">
				    <script type="text/javascript">
				        function category(lcategory, scategory){
				        	console.log(lcategory + " " + scategory);
				        	var cate = '/product/listCategory?lcategory='+lcategory+'&scategory='+scategory;
				        	
				        	location.href = cate;
				        	console.log(cate);
				        	$('input[name=lcategory]').attr('value',lcategory);
				        	$('input[name=scategory]').attr('value',scategory);
				        }
				        
				        $(document).ready(
				        function () {
				            $('.depth1 .depth2 li').hover(function () {
				                $(this).addClass('on');
				                $(this).parent('ul').addClass('on');
				            }, function () {
				                $(this).parent('ul').removeClass('on');
				                $(this).removeClass('on');
				            });
				        });
				    </script>
						<input type='hidden' name='lcategory' value='${lc}'>
						<input type='hidden' name='scategory' value='${sc}'>
				    <button type="button" class="btn-category">카테고리 전체보기</button>
				    <!-- 팝업 : category// -->
				    <div id="p_popCategory" class="popcategory">
				        <nav class="lnb-list">
				            <ul class="lnb">
				                <li class="depth1">
				                    <button type="button" onclick="" style="font-size: 20px;"><strong>과일과 채소</strong></button>
				                    <ul class="depth2">
				                        <li>
				                            <a href="#" onclick="category('과일과채소','');">전체보기</a>
				                        </li>
				                        <li>
				                            <a href="#" onclick="category('과일과채소','계절과일');">계절 과일 </a>
				                        </li>
				                        <li>
				                            <a href="#" onclick="category('과일과채소','일상채소');">일상 채소 </a>
				                        </li>
				                        <li>
				                            <a href="" onclick="">버섯 · 나물 · 두부 </a>
				                        </li>
				                        <li>
				                            <a href="" onclick="">샐러드 · 쌈채소 </a>
				                        </li>
				                        <li>
				                            <a href="" onclick="">냉동 · 간편 · 건과일 </a>
				                        </li>
				                        <li>
				                            <a href="" onclick="">H-SWEET · 약속농장 </a>
				                        </li>
				                        <li>
				                            <a href="" onclick="">산들내음 </a>
				                        </li>
				                    </ul>
				                </li>
				                <br>
				                <li class="depth1">
				                    <button type="button" onclick="">곡물과 견과</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">쌀 · 진공미
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">잡곡ㆍ혼합곡
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">견과ㆍ건과
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">시리얼 · 그래놀라
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">선식 · 누룽지 · 곡물스낵
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">현대쌀집
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				                <li class="depth1">
				                    <button type="button" onclick="">생선과 해산물, 건어물</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">생선 · 해산물
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">새우 · 조개류 · 갑각류
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">김 · 미역 · 해조류
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">연어 · 간편수산물
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">멸치 · 건어물 · Dried-H · 어부의밥상
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				                <li class="depth1">
				                    <button type="button" onclick="">육류와 달걀</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">소고기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">돼지고기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">닭 · 오리 · 양고기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">갈비 · 양념육
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">베이컨 · 샤퀴테리 · 가공육
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">달걀류
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">프리미엄 (1+, 1++)
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">화식한우 · 암소한우
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				                <li class="depth1">
				                    <button type="button" onclick="">밥과 국, 면</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">밥 · 볶음밥 · 도시락
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">국 · 탕 · 찌개
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">면 · 스파게티 · 국수
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">라면 · 햇반 · 즉석밥
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">샐러드 · 저칼로리식
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				
				                <li class="depth1">
				                    <button type="button" onclick="">밑반찬과 간식</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">엄마 손맛 즉석반찬
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">김치 · 젓갈 · 장아찌
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">메인 요리 · 밀키트
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">떡볶이 · 만두 · 냉동간식
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">죽 · 스프 · 카레
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">햄 · 어묵 · 반찬재료
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				
				                <li class="depth1">
				                    <button type="button" onclick="">양념과 오일, 통조림</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">식초 · 간장 · 장류
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">소금 · 설탕 · 조미료 · 향신료
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">소스 · 드레싱
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">식용유 · 참기름 · 올리브유
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">밀가루 · 분말
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">육수 · 다시팩
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">통조림 · 캔
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				
				                
				                <li class="depth1">
				                    <button type="button" onclick="">베이커리와 치즈</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">베이커리 · 케이크 · 파이
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">치즈
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">잼 · 버터 · 꿀
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">선물용 베이커리와 치즈
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				
				                <li class="depth1">
				                    <button type="button" onclick="">과자와 초콜릿, 캔디</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">스낵 · 쿠키류
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">떡 · 전통간식
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">초콜릿 · 캔디 · 젤리
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">아이스크림
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				
				                <li class="depth1">
				                    <button type="button" onclick="">물과 우유, 커피, 음료</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">생수 · 탄산수
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">우유 · 두유 · 요거트
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">탄산음료 · 주스
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">커피
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">차 · 과실청
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">전통주 · 논알콜
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">대용량 음료
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				
				                <li class="depth1">
				                    <button type="button" onclick="">홍삼과 비타민, 영양제</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">인삼 · 홍삼
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">비타민 · 유산균
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">건강음료 · 즙 · 꿀
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">영양제
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">건강 선물 세트
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				
				                <li class="depth1">
				                    <button type="button" onclick="">생활용품</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">스킨케어 · 헤어 · 바디
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">화장지 · 위생용품
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">구강케어 · 면도
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">청소 · 세탁용품
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">주방소모품
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">마스크 · 손세정제
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				
				                <li class="depth1">
				                    <button type="button" onclick="">리빙, 라이프스타일</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">냄비 · 팬 · 그릴
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">조리도구
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">키친소품
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">테이블웨어
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">WILLIAMS SONOMA
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">가전제품
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">베딩 · 홈데코
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">유아용품 · 장난감
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				
				                <li class="depth1">
				                    <button type="button" onclick="">반려동물 사료와 간식</button>
				                    <ul class="depth2">
				                        <li>
				                            <a href=""
				                                onclick="">전체보기
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">강아지 사료 · 간식
				                            </a>
				                        </li>
				                        <li>
				                            <a href=""
				                                onclick="">반려동물 놀이 · 도구
				                            </a>
				                        </li>
				                    </ul>
				                </li>
				            </ul>
				        </nav>
				    </div>
				</div>
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
			class="next">Next</a>
	</c:if>
	<a class="next2" href="#"></a>
</div>
<!--  end Pagination -->
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
	});//  end ready

</script>
</html>