<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/shop.css"> 
<link rel="stylesheet" type="text/css" href="/resources/css/mypage.css">
<sec:authentication var="user" property="principal" />
<header class="shop_header">
	<style>
		#shop_tablist {
		    height: 50px;
		    background: #fcc;
		}
		.one {
		    width: 800px;
		    height: 100%;
		    margin: 0 auto;
		}
		.one>li {
		    float: left;
		    width: 25%;
		    line-height: 35px;
		    text-align: center;
		    position: relative;
		}
		.one>li:hover .two {
		    left: 0;
		}
		.one>li a {
		    display: block;
		}
		.one>li a:hover {
		    background: #F8F8F8;
		    color: #767678;
		    font-weight: bold;
		}
		.two {
		    position: absolute;
		    top: 39px;
		    left: -9999px;
		    background: #ffffff;
		    width: 120%;
		}
		.two>li {
		    position: relative;
		}
		.two>li:hover .three {
		    left: 100%;
		}
		/* .two>li a, .three>li a {
		    border-radius: 10px;
		    margin: 10px;
		} */
		.three {
		    position: absolute;
		    top: 0;
		    background: #F8F8F8;
		    width: 100%;
		    left: -9999px;
		}
		.three>li a:hover {
		    background: #F8F8F8;
		    color: #767678;
		}
		.asd{
			margin-right:15px;
		}
	</style>
	<script>
    function category(lcategory, scategory){
        console.log(lcategory + " " + scategory);
        var cate = '/product/listCategory?lcategory='+lcategory+'&scategory='+scategory;
        
        location.href = cate;
    }
    
	</script>
	
    <div class="shop_logo_wrap">
        <a href="/" class="logo_link">
            <i class="header_icon logo_icon"></i>
            <span class="blind">오늘의쇼핑</span>
        </a>
    </div>
	<form action="/logout" method="POST" id="logoutForm">
       <nav class="header_nav">
           <c:choose>
               <c:when test="${user eq 'anonymousUser'}">
                   <a href="/login" class="h_nav_pa asd">
                       <span class="h_btn_login">로그인</span>
                   </a>
               </c:when>
               <c:otherwise>
               <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
                   <button class="h_btn_login h_btn_logout asd" type="submit">로그아웃</button>
               </c:otherwise>
           </c:choose>
           <a href="/mypage/main" class="h_nav_pa">
               <i class="header_icon header_nav_icon user_icon"></i>
               <span class="blind">유저정보</span>
           </a>
           <a href="/cart/<sec:authentication property="name"/>" class="h_nav_pa">
               <i class="header_icon header_nav_icon cart_icon"></i>
               <span class="blind">장바구니</span>
           </a>
       </nav>
    </form>
    <div class="shop_menulist" role="presentation">
	    <div class="shop_tablist" role="tablist" style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms;">
	    	<ul class="one">
	    		<li><a href="#" class="main_tab ">카테고리</a>
		    		<ul class="two">
		    			<li><a href="#">과일과 채소</a>
		    				<ul class="three">
		    				    <li><a href="#" onclick="category('과일과채소','');">전체보기</a></li>
		                        <li><a href="#" onclick="category('과일과채소','계절과일');">계절 과일 </a></li>
		                        <li><a href="#" onclick="category('과일과채소','일상채소');">일상 채소 </a></li>
		                        <li><a href="#" onclick="category('과일과채소','버섯*나물*두부');">버섯 · 나물 · 두부 </a></li>
		                        <li><a href="#" onclick="category('과일과채소','샐러드*쌈채소');">샐러드 · 쌈채소 </a></li>
		                        <li><a href="#" onclick="category('과일과채소','냉동*간편*건과일');">냉동 · 간편 · 건과일 </a></li>
		                        <li><a href="#" onclick="category('과일과채소','H-SWEET*약속농장');">H-SWEET · 약속농장 </a></li>
		                        <li><a href="#" onclick="category('과일과채소','산들내음');">산들내음 </a></li>
		    				</ul>
		    			</li>
		    			<li><a href="#">곡물과 견과</a>
		    				<ul class="three">
		                        <li><a href="#" onclick="category('곡물과견과','');">전체보기 </a></li>
		                        <li><a href="#" onclick="category('곡물과견과','쌀*진공미');">쌀 · 진공미 </a></li>
		                        <li><a href="#" onclick="category('곡물과견과','잡곡*혼합곡');">잡곡ㆍ혼합곡 </a></li>
		                        <li><a href="#" onclick="category('곡물과견과','견과*건과');">견과ㆍ건과 </a></li>
		                        <li><a href="#" onclick="category('곡물과견과','시리얼*그래놀라');">시리얼 · 그래놀라</a></li>
		                        <li><a href="#" onclick="category('곡물과견과','선식*누룽지*곡물스낵');">선식 · 누룽지 · 곡물스낵 </a></li>
		                        <li><a href="#" onclick="category('곡물과견과','현대쌀집');">현대쌀집 </a></li>		    					
		    				</ul>
		    			</li>
		    			<li><a href="#">생선과 해산물, 건어물</a>
		    				<ul class="three">
		      					<li><a href="#" onclick="category('생선과해산물,건어물','');">전체보기 </a></li>
		                        <li><a href="#" onclick="category('생선과해산물,건어물','생선*해산물');">생선 · 해산물 </a></li>
		                        <li><a href="#" onclick="category('생선과해산물,건어물','새우*조개류*갑각류');">새우 · 조개류 · 갑각류 </a></li>
		                        <li><a href="#" onclick="category('생선과해산물,건어물','김*미역*해조류');">김 · 미역 · 해조류 </a></li>
		                        <li><a href="#" onclick="category('생선과해산물,건어물','연어*간편수산물');">연어 · 간편수산물 </a></li>
		                        <li><a href="#" onclick="category('생선과해산물,건어물','멸치*건어물*Dried-H*어부의밥상 ');">멸치 · 건어물 · Dried-H · 어부의밥상 </a></li>
		    				</ul>
		    			</li>
		    			<li><a href="#">육류와 달걀</a>
		    				<ul class="three">
		      					<li>
		                            <a href="#" onclick="category('육류와달걀','');">전체보기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('육류와달걀','소고기');">소고기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('육류와달걀','돼지고기');">돼지고기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('육류와달걀','닭*오리*양고기');">닭 · 오리 · 양고기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('육류와달걀','갈비*양념육');">갈비 · 양념육 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('육류와달걀','베이컨*샤퀴테리*가공육');">베이컨 · 샤퀴테리 · 가공육 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('육류와달걀','달걀류');">달걀류 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('육류와달걀','프리미엄(1+,1++)');">프리미엄 (1+, 1++) </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('육류와달걀','화식한우*암소한우');">화식한우 · 암소한우 </a>
		                        </li>   				
                        	</ul>
		    			</li>
		    			<li><a href="#">밥과 국, 면</a>
		    				<ul class="three">
		      					<li>
		                            <a href="#" onclick="category('밥과국,면','');">전체보기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('밥과국,면','밥*볶음밥*도시락');">밥 · 볶음밥 · 도시락 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('밥과국,면','국*탕*찌개');">국 · 탕 · 찌개 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('밥과국,면','면*스파게티*국수');">면 · 스파게티 · 국수 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('밥과국,면','라면*햇반*즉석밥 ');">라면 · 햇반 · 즉석밥 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('밥과국,면','샐러드*저칼로리식');">샐러드 · 저칼로리식 </a>
		                        </li>		    				
                        	</ul>
		    			</li>
		    			<li><a href="#">밑반찬과 간식</a>
		    				<ul class="three">
		    				</ul>
		    			</li>
		    			<li><a href="#">밑반찬과 간식</a>
		    				<ul class="three">
		    				    <li>
		                            <a href="#" onclick="category('밑반찬과간식','');">전체보기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('밑반찬과간식','엄마손맛즉석반찬');">엄마 손맛 즉석반찬 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('밑반찬과간식','김치*젓갈*장아찌');">김치 · 젓갈 · 장아찌 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('밑반찬과간식','메인요리*밀키트');">메인 요리 · 밀키트 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('밑반찬과간식','떡볶이*만두*냉동간식');">떡볶이 · 만두 · 냉동간식 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('밑반찬과간식','죽*스프*카레');">죽 · 스프 · 카레 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('밑반찬과간식','햄*어묵*반찬재료');">햄 · 어묵 · 반찬재료 </a>
		                        </li>
		    				</ul>
		    			</li>
		    			<li><a href="#">양념과 오일, 통조림</a>
		    				<ul class="three">
				    			<li>
		                            <a href="#" onclick="category('양념과오일,통조림','');">전체보기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('양념과오일,통조림','식초*간장*장류');">식초 · 간장 · 장류 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('양념과오일,통조림','소금*설탕*조미료*향신료');">소금 · 설탕 · 조미료 · 향신료 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('양념과오일,통조림','소스*드레싱');">소스 · 드레싱 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('양념과오일,통조림','식용유*참기름*올리브유');">식용유 · 참기름 · 올리브유 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('양념과오일,통조림','밀가루*분말');">밀가루 · 분말 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('양념과오일,통조림','육수*다시팩');">육수 · 다시팩 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('양념과오일,통조림','통조림*캔');">통조림 · 캔 </a>
		                        </li>
		    				</ul>
		    			</li>
		    			<li><a href="#">베이커리와 치즈</a>
		    				<ul class="three">
				    			<li>
		                            <a href="#" onclick="category('베이커리와치즈','');">전체보기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('베이커리와치즈','베이커리*케이크*파이');">베이커리 · 케이크 · 파이 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('베이커리와치즈','치즈');">치즈 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('베이커리와치즈','잼*버터*꿀');">잼 · 버터 · 꿀 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('베이커리와치즈','선물용베이커리와치즈');">선물용 베이커리와 치즈 </a>
		                        </li>
		    				</ul>
		    			</li>
		    			<li><a href="#">과자와 초콜릿, 캔디</a>
		    				<ul class="three">
				    			<li>
		                            <a href="#" onclick="category('과자와초콜릿,캔디','');">전체보기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('과자와초콜릿,캔디','스낵*쿠키류');">스낵 · 쿠키류 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('과자와초콜릿,캔디','떡*전통간식');">떡 · 전통간식 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('과자와초콜릿,캔디','초콜릿*캔디*젤리');">초콜릿 · 캔디 · 젤리 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('과자와초콜릿,캔디','아이스크림');">아이스크림 </a>
		                        </li>
		    				</ul>
		    			</li>
		    			<li><a href="#">물과 우유, 커피, 음료</a>
		    				<ul class="three">
		    				    <li>
		                            <a href="#" onclick="category('물과우유,커피,음료','');">전체보기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('물과우유,커피,음료','생수*탄산수');">생수 · 탄산수 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('물과우유,커피,음료','우유*두유*요거트');">우유 · 두유 · 요거트 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('물과우유,커피,음료','탄산음료*주스');">탄산음료 · 주스 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('물과우유,커피,음료','커피');">커피 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('물과우유,커피,음료','차*과실청');">차 · 과실청 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('물과우유,커피,음료','전통주*논알콜');">전통주 · 논알콜 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('물과우유,커피,음료','대용량음료');">대용량 음료 </a>
		                        </li>
		    				</ul>
		    			</li>
		    			<li><a href="#">홍삼과 비타민, 영양제</a>
		    				<ul class="three">
		    				    <li>
		                            <a href="#" onclick="category('홍삼과비타민,영양제','');">전체보기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('홍삼과비타민,영양제','인삼*홍삼');">인삼 · 홍삼 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('홍삼과비타민,영양제','비타민*유산균');">비타민 · 유산균 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('홍삼과비타민,영양제','건강음료*즙*꿀');">건강음료 · 즙 · 꿀 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('홍삼과비타민,영양제','영양제');">영양제 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('홍삼과비타민,영양제','건강선물세트');">건강 선물 세트 </a>
		                        </li>
		    				</ul>
		    			</li>
		    			<li><a href="#">생활용품</a>
		    				<ul class="three">
				    			<li>
		                            <a href="#" onclick="category('생활용품','');">전체보기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('생활용품','스킨케어*헤어*바디');">스킨케어 · 헤어 · 바디 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('생활용품','화장지*위생용품');">화장지 · 위생용품 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('생활용품','구강케어*면도');">구강케어 · 면도 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('생활용품','청소*세탁용품');">청소 · 세탁용품 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('생활용품','주방소모품');">주방소모품 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('생활용품','마스크*손세정제');">마스크 · 손세정제 </a>
		                        </li>
		    				</ul>
		    			</li>
		    			<li><a href="#">리빙, 라이프스타일</a>
		    				<ul class="three">
				    			<li>
		                            <a href="#" onclick="category('리빙,라이프스타일','');">전체보기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('리빙,라이프스타일','냄비*팬*그릴');">냄비 · 팬 · 그릴 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('리빙,라이프스타일','조리도구');">조리도구 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('리빙,라이프스타일','키친소품');">키친소품 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('리빙,라이프스타일','테이블웨어');">테이블웨어 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('리빙,라이프스타일','WILLIAMSSONOMA');">WILLIAMS SONOMA </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('리빙,라이프스타일','가전제품');">가전제품 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('리빙,라이프스타일','베딩*홈데코');">베딩 · 홈데코 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('리빙,라이프스타일','유아용품*장난감');">유아용품 · 장난감 </a>
		                        </li>
		    				</ul>
		    			</li>
		    			<li><a href="#">반려동물 사료와 간식</a>
		    				<ul class="three">
		    				    <li>
		                            <a href="#" onclick="category('반려동물사료와간식','');">전체보기 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('반려동물사료와간식','강아지 사료*간식');">강아지 사료 · 간식 </a>
		                        </li>
		                        <li>
		                            <a href="#" onclick="category('반려동물사료와간식','반려동물 놀이*도구');">반려동물 놀이 · 도구 </a>
		                        </li>
		    				</ul>
		    			</li>
		    		</ul>
	    		</li>
	    	</ul>
	        <a href="/" class="main_tab main1" role="tab" aria-selected="false">홈</a>
	        <a href="/live/view" role="tab" class="main_tab main2" aria-selected="false">인기라이브</a>
	        <a href="/live/recent" role="tab" class="main_tab main3" aria-selected="false">최신라이브</a>
	        <a href="/product/listDate" role="tab" class="main_tab main4" aria-selected="false">신상품</a>
	        <a href="/coupon/Eventcouponpage" role="tab" class="main_tab main5" aria-selected="false">이벤트</a>
	        <a href="/recipe/api" role="tab" class="main_tab main6" aria-selected="false">레시피</a>
	        <script>
	        	function maintab(value){
	        		if(value == 'one'){
	        			$(".main1").attr("aria-selected","true");
	        		}
	        		else if(value == 'two'){
	        			$(".main2").attr("aria-selected","true");
	        		}
	        		else if(value == 'three'){
	        			$(".main3").attr("aria-selected","true");
	        		}
	        		else{
	        			$(".main4").attr("aria-selected","true");
	        		}
	        	}
	        </script>
	    </div>
	</div>
</header>
