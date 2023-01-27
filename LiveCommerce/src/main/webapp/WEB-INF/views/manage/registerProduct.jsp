<%@page pageEncoding="UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/header/tool_header.jsp"%>
<!-- 박소은 작성 -->



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

<script id="preview">
	function readURL(input) {
		if (input.files && input.files[0]) {
			var reader = new FileReader();
			reader.onload = function(e) {
				document.getElementById('preview').src = e.target.result;
			};
			reader.readAsDataURL(input.files[0]);
		} else {
			document.getElementById('preview').src = "";
		}
	}
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
			<form role="form" action="/manage/registerProduct" method="post">

				<div class="product_create_wrap">
					<div class="product_create_area">
						<div class="product_create_inner">
							<div class="_title">
								<h1>제품 수정</h1>
							</div>
							<div class="product_create_content">

								<div class="create_layout">
									<div class="layout_subject _asterisk">대분류</div>
									<select class="layout_input update_selected" id="lcateSelect"
										selected="selected" name="lcategory" size="1">
										<option value="0" >대분류 선택</option>
										<option value="과일과채소">과일과 채소</option>
										<option value="곡물과견과">곡물과 견과</option>
										<option value="생선과 해산물,건어물">생선과 해산물, 건어물</option>
										<option value="육류와달걀">육류와 달걀</option>
										<option value="밥과국,면">밥과 국, 면</option>
										<option value="밑반찬과간식">밑반찬과 간식</option>
										<option value="양념과오일,통조림">양념과 오일, 통조림</option>
										<option value="베이커리와치즈">베이커리와 치즈</option>
										<option value="과자와초콜릿,캔디">과자와 초콜릿, 캔디</option>
										<option value="물과우유,커피,음료">물과 우유, 커피, 음료</option>


									</select>
								</div>

								<div class="create_layout">

									<div class="layout_subject _asterisk">소분류</div>
									<select class="layout_input update_selected" id="scateSelect"
										name="scategory" size="1">
										<option value="0">소분류 선택</option>


										<option value="계절과일" class="scate과일과채소">계절과일</option>
										<option value="일상채소" class="scate과일과채소">일상 채소</option>
										<option value="버섯*나물*두부" class="scate과일과채소">버섯, 나물, 두부</option>
										<option value="샐러드*쌈채소" class="scate과일과채소">샐러드, 쌈채소</option>
										<option value="냉동*간편*건과일" class="scate과일과채소">냉동, 간편, 건과일</option>

										<option value="쌀*진공미" class="scate곡물과견과">쌀, 진공미</option>
										<option value="잡곡*혼합곡" class="scate곡물과견과">잡곡, 혼잡곡</option>
										<option value="견과*건과" class="scate곡물과견과">견과, 건과</option>
										<option value="시리얼*그래놀라" class="scate곡물과견과">시리얼, 그래놀라</option>
										<option value="선식*누룽지*곡물스낵" class="scate곡물과견과">선식, 누룽지, 곡물스낵</option>
										<option value="현대쌀집" class="scate곡물과견과">현대쌀집</option>

										<option value="생선*해산물" class="scate생선과해산물*건어물">생선, 해산물</option>
										<option value="새우*조개류*갑각류" class="scate생선과해산물*건어물">새우, 조개류, 갑각류</option>
										<option value="김*미역*해조류" class="scate생선과해산물*건어물">김, 미역, 해조류</option>
										<option value="연어*간편수산물" class="scate생선과해산물*건어물">연어, 간편수산물</option>
										<option value="멸치*건어물*Dried-H*어부의밥상" class="scate생선과해산물*건어물">멸치, 건어물, Dried-H,
											어부의밥상</option>

										<option value="소고기" class="scate육류와달걀">소고기</option>
										<option value="돼지고기" class="scate육류와달걀">돼지고기</option>
										<option value="닭*오리*양고기" class="scate육류와달걀">닭, 오리, 양고기</option>
										<option value="갈비*양념육" class="scate육류와달걀">갈비, 양념육</option>
										<option value="베이컨*샤퀴테리*가공육" class="scate육류와달걀">베이컨, 샤퀴테리, 가공육</option>
										<option value="달걀류" class="scate육류와달걀">달걀류</option>
										<option value="프리미엄(1+,1++)" class="scate육류와달걀">프리미엄 (1+, 1++)</option>
										<option value="화식한우*암소한우" class="scate육류와달걀">화식한우, 암소한우</option>

										<option value="밥*볶음밥*도시락" class="scate밥과국*면">밥, 볶음밥, 도시락</option>
										<option value="국*탕*찌개" class="scate밥과국*면">국, 탕 찌개</option>
										<option value="면*스파게티*국수" class="scate밥과국*면">면, 스파게티, 국수</option>
										<option value="라면*햇반*즉석밥" class="scate밥과국*면">라면, 햇반, 즉석밥</option>
										<option value="샐러드*저칼로리식" class="scate밥과국*면">샐러드, 저칼로리식</option>

										<option value="엄마손맛즉석반찬" class="scate밑반찬과간식">엄마 손맛 즉석반찬</option>
										<option value="김치*젓갈*장아찌" class="scate밑반찬과간식">김치, 젓갈, 장아찌</option>
										<option value="메인요리*밀키트" class="scate밑반찬과간식">메인요리, 밀키트</option>
										<option value="떡볶이*만두*냉동간식" class="scate밑반찬과간식">떡볶이, 만두, 냉동간식</option>
										<option value="죽*스프*카레" class="scate밑반찬과간식">죽, 스프, 카레</option>

										<option value="식초*간장*장류" class="scate양념과오일*통조림">식초, 간장, 장류</option>
										<option value="소금*설탕*조미료*향신료" class="scate양념과오일*통조림">소금, 설탕, 조미료, 향신료</option>
										<option value="소스*드레싱" class="scate양념과오일*통조림">소스, 드레싱</option>
										<option value="식용유*참기름*올리브유" class="scate양념과오일*통조림">식용유, 참기름, 올리브유</option>
										<option value="밀가루*분말" class="scate양념과오일*통조림">밀가루, 분말</option>

										<option value="베이커리*케이크*파이" class="scate베이커리와치즈">베이커리, 케이크, 파이</option>
										<option value="치즈" class="scate베이커리와치즈">치즈</option>
										<option value="잼*버터*꿀" class="scate베이커리와치즈">잼, 버터, 꿀</option>
										<option value="선물용베이커리와치즈" class="scate베이커리와치즈">선물용 베이커리와 치즈</option>

										<option value="스낵*쿠키류" class="scate과자와초콜릿*캔디">스낵, 쿠키류</option>
										<option value="떡*전통간식" class="scate과자와초콜릿*캔디">떡, 전통간식</option>
										<option value="초콜릿*캔디*젤리" class="scate과자와초콜릿*캔디">초콜릿, 캔디, 젤리</option>
										<option value="아이스크림" class="scate과자와초콜릿*캔디">아이스크림</option>

										<option value="생수*탄산수" class="scate물과우유*커피*음료">생수, 탄산수</option>
										<option value="우유*두유*요거트" class="scate물과우유*커피*음료">우유, 두유, 요거트</option>
										<option value="탄산음료*주스" class="scate물과우유*커피*음료">탄산음료, 주스</option>
										<option value="커피" class="scate물과우유*커피*음료">커피</option>
										<option value="차*과실청" class="scate물과우유*커피*음료">차, 과실청</option>


									</select>
								</div>


								<div class="create_layout form-group">
									<div class="layout_subject _asterisk">상품명</div>
									<input class="form-control layout_input" name='pname'>
								</div>

								<div class="create_layout form-group">
									<div class="layout_subject _asterisk">상품 가격</div>
									<input class="form-control layout_input" name='price'>
								</div>

								<div class="create_layout">
                            <div class="layout_subject _asterisk">상품 상세</div>
	                        <textarea id="psContentText" name="psContentText">${product.detail }</textarea>
	                        <iframe id="psContentIframe" name="psContentIframe" scrolling=yes border=0 width="100%" height=300 frameborder=0></iframe>                    
                        </div>


								<div class="create_layout form-group">
									<div class="layout_subject _asterisk">이미지</div>
									<input class="form-control layout_input" name='img1'>
								</div>



								<div class="create_layout form-group">
									<div class="layout_subject _asterisk">판매 상태</div>
									<div class="layout_filter">
										<select name="pstatus" id="pstatus" class="_filter">
											<option value="100">판매상태 선택</option>
											<option value="0">판매중지</option>
											<option value="1">판매중</option>

										</select>
									</div>
									<div class="memo">* 미전시 선택 시 판매등록이 불가능합니다.</div>
								</div>





								<!--
								 <div class="create_layout filebox">
									<div class="layout_subject _asterisk">판매글 메인 이미지</div>
									<div class="layout_memo">5MB 크기의 정사각형 이미지를 올려주세요.</div>
									<input class="uploadName" disabled="disabled"
										<c:choose>
                                    <c:when test="${!empty postInfo}">
                                        value='${postInfo.pdPostFileVo.getFileName()}'
                                    </c:when>
                                    <c:otherwise>
                                        value="파일선택"
                                    </c:otherwise>
                                </c:choose>>
									<label for="img1">업로드</label> <input type='file' name='uploadFile' multiple>
								</div> -->


								<input type="hidden" name="${_csrf.parameterName}"
									value="${_csrf.token}" />
								<button type="submit" class="btn btn-default">Submit</button>
			</form>
		</div>
	</div>

</body>
</html>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>