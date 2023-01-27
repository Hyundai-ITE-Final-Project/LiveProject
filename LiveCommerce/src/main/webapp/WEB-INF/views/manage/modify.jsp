<%@page pageEncoding="UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/header/tool_header.jsp"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>



<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
	src="https://cpwebassets.codepen.io/assets/common/stopExecutionOnTimeout-2c7831bb44f98c1391d6a4ffda0e1fd302503391ca806e7fcc7b9b87197aec26.js"></script>

<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script id="rendered-js">
	var lcate = false;

	function update_selected() {
		$("#scateSelect").val(0);
		$("#scateSelect").find("option[value!=0]").detach();

		$("#scateSelect").append(lcate.filter(".scate" + $(this).val()));
	}

	$(function() {
		lcate = $("#scateSelect").find("option[value!=0]");
		lcate.detach();

		$("#lcateSelect").change(update_selected);
		$("#lcateSelect").trigger("change");
	});
	//# sourceURL=pen.js
</script>

<script type="text/javascript">
	$(document).ready(function() {
		var formObj = $("form");

		$('button').on("click", function(e) {
			e.preventDefault();

			var operation = $(this).data("oper");
			console.log(operation);

			if (operation === 'remove') {
				formObj.attr("action", "/manage/remove");

			} else if (operation === 'list') {
				self.location = "/manage/products";
				return;
			}
			formObj.submit();

		});

	});
</script>
<style>
.select_img img {
	margin: 20px 0;
}
</style>
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
			<form role="form" action="/manage/modify" method="post">
			<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
			
				<div class="product_create_wrap">
					<div class="product_create_area">
						<div class="product_create_inner">
							<div class="_title">
								<h1>제품 수정</h1>
							</div>
							<div class="product_create_content">
								<div class="create_layout form-group">
									<label>상품 번호</label> <input class="form-control layout_input"
										name='pid' value='<c:out value="${product.pid }"/>'
										readonly='readonly'>

								</div>




								<div class="create_layout">
									<div class="layout_subject_asterisk">대분류</div>
									<select class="layout_input update_selected" id="lcateSelect"
										name="lcategory" size="1" value="${product.lcategory}">
										
										<option value="과일과채소" <c:if test="${product.lcategory == '과일과채소'}"> selected </c:if>>과일과 채소</option>
										<option value="곡물과견과" <c:if test="${product.lcategory == '곡물과견과'}"> selected </c:if> >곡물과 견과</option>
										<option value="생선과해산물*건어물" <c:if test="${product.lcategory == '생선과해산물*건어물'}"> selected </c:if> >생선과 해산물, 건어물</option>
										<option value="육류와달걀" <c:if test="${product.lcategory == '육류와달걀'}"> selected </c:if> >육류와 달걀</option>
										<option value="밥과국*면" <c:if test="${product.lcategory == '밥과국*면'}"> selected </c:if> >밥과 국, 면</option>
										<option value="밑반찬과간식" <c:if test="${product.lcategory == '밑반찬과간식'}"> selected </c:if> >밑반찬과 간식</option>
										<option value="양념과오일*통조림" <c:if test="${product.lcategory == '양념과오일*통조림'}"> selected </c:if> >양념과 오일, 통조림</option>
										<option value="베이커리와치즈" <c:if test="${product.lcategory == '베이커리와치즈'}"> selected </c:if> >베이커리와 치즈</option>
										<option value="과자와초콜릿*캔디" <c:if test="${product.lcategory == '과자와초콜릿*캔디'}"> selected </c:if> >과자와 초콜릿, 캔디</option>
										<option value="물과우유*커피*음료" <c:if test="${product.lcategory == '물과우유*커피*음료'}"> selected </c:if> >물과 우유, 커피, 음료</option>


									</select>
								</div>
								<div class="create_layout">
									<div class="layout_subject_asterisk">소분류</div>
									<select class="layout_input update_selected" id="scateSelect"
										name="scategory" size="1">

										<option <c:if test="${product.scategory == '계절과일'}"> selected </c:if> value="계절과일" class="scate과일과채소">계절과일</option>
										<option <c:if test="${product.scategory == '일상채소'}"> selected </c:if> value="일상채소" class="scate과일과채소">일상 채소</option>
										<option <c:if test="${product.scategory == '버섯*나물*두부'}"> selected </c:if> value="버섯*나물*두부" class="scate과일과채소">버섯, 나물, 두부</option>
										<option <c:if test="${product.scategory == '샐러드*쌈채소'}"> selected </c:if> value="샐러드*쌈채소" class="scate과일과채소">샐러드, 쌈채소</option>
										<option <c:if test="${product.scategory == '냉동*간편*건과일'}"> selected </c:if> value="냉동*간편*건과일" class="scate과일과채소">냉동, 간편, 건과일</option>
										<option <c:if test="${product.scategory == '쌀*진공미'}"> selected </c:if> value="쌀*진공미" class="scate곡물과견과">쌀, 진공미</option>
										<option <c:if test="${product.scategory == '잡곡*혼합곡'}"> selected </c:if> value="잡곡*혼합곡" class="scate곡물과견과">잡곡, 혼잡곡</option>
										<option <c:if test="${product.scategory == '견과*건과'}"> selected </c:if> value="견과*건과" class="scate곡물과견과">견과, 건과</option>
										<option <c:if test="${product.scategory == '시리얼*그래놀라'}"> selected </c:if> value="시리얼*그래놀라" class="scate곡물과견과">시리얼, 그래놀라</option>
										<option <c:if test="${product.scategory == '선식*누룽지*곡물스낵'}"> selected </c:if> value="선식*누룽지*곡물스낵" class="scate곡물과견과">선식, 누룽지, 곡물스낵</option>
										<option <c:if test="${product.scategory == '현대쌀집'}"> selected </c:if> value="현대쌀집" class="scate곡물과견과">현대쌀집</option>
										<option <c:if test="${product.scategory == '생선*해산물'}"> selected </c:if> value="생선*해산물" class="scate생선과해산물*건어물">생선, 해산물</option>
										<option <c:if test="${product.scategory == '새우*조개류*갑각류'}"> selected </c:if> value="새우*조개류*갑각류" class="scate생선과해산물*건어물">새우, 조개류, 갑각류</option>
										<option <c:if test="${product.scategory == '김*미역*해조류'}"> selected </c:if> value="김*미역*해조류" class="scate생선과해산물*건어물">김, 미역, 해조류</option>
										<option <c:if test="${product.scategory == '연어*간편수산물'}"> selected </c:if> value="연어*간편수산물" class="scate생선과해산물*건어물">연어, 간편수산물</option>
										<option <c:if test="${product.scategory == '멸치*건어물'}"> selected </c:if> value="멸치*건어물*Dried-H*어부의밥상" class="scate생선과해산물*건어물">멸치, 건어물, Dried-H, 어부의밥상</option>
										<option <c:if test="${product.scategory == '소고기'}"> selected </c:if> value="소고기" class="scate육류와달걀">소고기</option>
										<option <c:if test="${product.scategory == '돼지고기'}"> selected </c:if> value="돼지고기" class="scate육류와달걀">돼지고기</option>
										<option <c:if test="${product.scategory == '닭*오리*양고기'}"> selected </c:if> value="닭*오리*양고기" class="scate육류와달걀">닭, 오리, 양고기</option>
										<option <c:if test="${product.scategory == '갈비*양념육'}"> selected </c:if> value="갈비*양념육" class="scate육류와달걀">갈비, 양념육</option>
										<option <c:if test="${product.scategory == '베이컨*샤퀴테리*가공육'}"> selected </c:if> value="베이컨*샤퀴테리*가공육" class="scate육류와달걀">베이컨, 샤퀴테리, 가공육</option>
										<option <c:if test="${product.scategory == '달걀류'}"> selected </c:if> value="달걀류" class="scate육류와달걀">달걀류</option>
										<option <c:if test="${product.scategory == '프리미엄(1+,1++)'}"> selected </c:if> value="프리미엄(1+,1++)" class="scate육류와달걀">프리미엄 (1+, 1++)</option>
										<option <c:if test="${product.scategory == '화식한우*암소한우'}"> selected </c:if> value="화식한우*암소한우" class="scate육류와달걀">화식한우, 암소한우</option>
										<option <c:if test="${product.scategory == '밥*볶음밥*도시락'}"> selected </c:if> value="밥*볶음밥*도시락" class="scate밥과국*면">밥, 볶음밥, 도시락</option>
										<option <c:if test="${product.scategory == '국*탕*찌개'}"> selected </c:if> value="국*탕*찌개" class="scate밥과국*면">국, 탕 찌개</option>
										<option <c:if test="${product.scategory == '면*스파게티*국수'}"> selected </c:if> value="면*스파게티*국수" class="scate밥과국*면">면, 스파게티, 국수</option>
										<option <c:if test="${product.scategory == '라면*햇반*즉석밥'}"> selected </c:if> value="라면*햇반*즉석밥" class="scate밥과국*면">라면, 햇반, 즉석밥</option>
										<option <c:if test="${product.scategory == '샐러드*저칼로리식'}"> selected </c:if> value="샐러드*저칼로리식" class="scate밥과국*면">샐러드, 저칼로리식</option>
										<option <c:if test="${product.scategory == '엄마손맛즉석반찬'}"> selected </c:if> value="엄마손맛즉석반찬" class="scate밑반찬과간식">엄마 손맛 즉석반찬</option>
										<option <c:if test="${product.scategory == '김치*젓갈*장아찌'}"> selected </c:if> value="김치*젓갈*장아찌" class="scate밑반찬과간식">김치, 젓갈, 장아찌</option>
										<option <c:if test="${product.scategory == '메인요리*밀키트'}"> selected </c:if> value="메인요리*밀키트" class="scate밑반찬과간식">메인요리, 밀키트</option>
										<option <c:if test="${product.scategory == '떡볶이*만두*냉동간식'}"> selected </c:if> value="떡볶이*만두*냉동간식" class="scate밑반찬과간식">떡볶이, 만두, 냉동간식</option>
										<option <c:if test="${product.scategory == '죽*스프*카레'}"> selected </c:if> value="죽*스프*카레" class="scate밑반찬과간식">죽, 스프, 카레</option>
										<option <c:if test="${product.scategory == '식초*간장*장류'}"> selected </c:if> value="식초*간장*장류" class="scate양념과오일*통조림">식초, 간장, 장류</option>
										<option <c:if test="${product.scategory == '소금*설탕*조미료*향신료'}"> selected </c:if> value="소금*설탕*조미료*향신료" class="scate양념과오일*통조림">소금, 설탕, 조미료, 향신료</option>
										<option <c:if test="${product.scategory == '소스*드레싱'}"> selected </c:if> value="소스*드레싱" class="scate양념과오일*통조림">소스, 드레싱</option>
										<option <c:if test="${product.scategory == '식용유*참기름*올리브유'}"> selected </c:if> value="식용유*참기름*올리브유" class="scate양념과오일*통조림">식용유, 참기름, 올리브유</option>
										<option <c:if test="${product.scategory == '밀가루*분말'}"> selected </c:if> value="밀가루*분말" class="scate양념과오일*통조림">밀가루, 분말</option>
										<option <c:if test="${product.scategory == '베이커리*케이크*파이'}"> selected </c:if> value="베이커리*케이크*파이" class="scate베이커리와치즈">베이커리, 케이크, 파이</option>
										<option <c:if test="${product.scategory == '치즈'}"> selected </c:if> value="치즈" class="scate베이커리와치즈">치즈</option>
										<option <c:if test="${product.scategory == '잼*버터*꿀'}"> selected </c:if> value="잼*버터*꿀" class="scate베이커리와치즈">잼, 버터, 꿀</option>
										<option <c:if test="${product.scategory == '선물용베이커리와치즈'}"> selected </c:if> value="선물용베이커리와치즈" class="scate베이커리와치즈">선물용 베이커리와 치즈</option>
										<option <c:if test="${product.scategory == '스낵*쿠키류'}"> selected </c:if> value="스낵*쿠키류" class="scate과자와초콜릿*캔디">스낵, 쿠키류</option>
										<option <c:if test="${product.scategory == '떡*전통간식'}"> selected </c:if> value="떡*전통간식" class="scate과자와초콜릿*캔디">떡, 전통간식</option>
										<option <c:if test="${product.scategory == '초콜릿*캔디*젤리'}"> selected </c:if> value="초콜릿*캔디*젤리" class="scate과자와초콜릿*캔디">초콜릿, 캔디, 젤리</option>
										<option <c:if test="${product.scategory == '아이스크림'}"> selected </c:if> value="아이스크림" class="scate과자와초콜릿*캔디">아이스크림</option>
										<option <c:if test="${product.scategory == '생수*탄산'}"> selected </c:if> value="생수*탄산수" class="scate물과우유*커피*음료">생수, 탄산수</option>
										<option <c:if test="${product.scategory == '우유*두유*요거트'}"> selected </c:if> value="우유*두유*요거트" class="scate물과우유*커피*음료">우유, 두유, 요거트</option>
										<option <c:if test="${product.scategory == '탄산음료*주스'}"> selected </c:if> value="탄산음료*주스" class="scate물과우유*커피*음료">탄산음료, 주스</option>
										<option <c:if test="${product.scategory == '커피'}"> selected </c:if> value="커피" class="scate물과우유*커피*음료">커피</option>
										<option <c:if test="${product.scategory == '차*과실청'}"> selected </c:if> value="차*과실청" class="scate물과우유*커피*음료">차, 과실청</option>


									</select>
								</div>


								<div class="create_layout form-group">
									<label>상품명</label> <input class="form-control layout_input"
										name='pname' value='<c:out value="${product.pname }"/>'>

								</div>

								<div class="create_layout form-group">
									<label>상품 가격</label> <input class="form-control layout_input"
										name='price' value='<c:out value="${product.price }"/>'>

								 </div>
								<div class="create_layout form-group">
									<label>상품 상세</label> <input class="form-control layout_input"
										name='detail' value='<c:out value="${product.detail }"/>'>

								</div> 
								
								<div class="create_layout">
                            <div class="layout_subject _asterisk">판매글 상세 내용</div>
	                        <textarea id="psContentText" name="psContentText"><c:out value="${product.detail }"/></textarea>
	                        <iframe id="psContentIframe" name="psContentIframe" scrolling=yes border=0 width="100%" height=300 frameborder=0></iframe>                    
                        </div>

								<div class="create_layout form-group">
									<label>이미지</label> <input class="form-control layout_input"
										name='img1' value='<c:out value="${product.img1 }"/>'>

								</div>


								<div class="create_layout form-group">
									<label>재고량</label> <input class="form-control layout_input"
										name='pstock' value='<c:out value="${product.pstock }"/>'>

								</div>

								<div class="create_layout form-group">
									<label>판매 상태</label> <input class="form-control layout_input"
										name='pstatus' value='<c:out value="${product.pstatus }"/>'>

								</div>


								<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
								<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
								<button type="submit" data-oper='list' class="btn btn-info">List</button>
			</form>
</body>
</html>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>