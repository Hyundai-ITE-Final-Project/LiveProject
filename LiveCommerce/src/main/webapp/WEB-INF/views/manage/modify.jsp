<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/header/tool_header.jsp"%>


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
					<a href="/tool/live" class="main_tab" aria-selected="false">라이브
						관리</a> <a href="/manage/products" class="main_tab" aria-selected="true">상품
						관리</a> <a href="/manage/productpost" class="main_tab" aria-selected="false">판매글
						관리</a> <a href="/tool/sale" class="main_tab" aria-selected="false">판매
						내역 관리</a> <a href="/tool/setting" class="main_tab"
						aria-selected="false">설정</a>
				</div>
			</div>
			<form role="form" action="/manage/modify" method="post">
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
										selected="selected" name="lcategory" size="1">
										<option value="0">대분류 선택</option>
										<option value="11">과일과 채소</option>
										<option value="12">곡물과 견과</option>
										<option value="13">생선과 해산물, 건어물</option>
										<option value="14">육류와 달걀</option>
										<option value="15">밥과 국, 면</option>
										<option value="16">밑반찬과 간식</option>
										<option value="17">양념과 오일, 통조림</option>
										<option value="18">베이커리와 치즈</option>
										<option value="19">과자와 초콜릿, 캔디</option>
										<option value="20">물과 우유, 커피, 음료</option>


									</select>
								</div>
								<div class="create_layout">
									<div class="layout_subject_asterisk">소분류</div>
									<select class="layout_input update_selected" id="scateSelect"
										name="scategory" size="1">
										<option value="0">소분류 선택</option>

										<option value="111" class="scate11">계절과일</option>
										<option value="112" class="scate11">일상 채소</option>
										<option value="113" class="scate11">버섯, 나물, 두부</option>
										<option value="114" class="scate11">샐러드, 쌈채소</option>
										<option value="115" class="scate11">냉동, 간편, 건과일</option>

										<option value="121" class="scate12">쌀, 진공미</option>
										<option value="122" class="scate12">잡곡, 혼잡곡</option>
										<option value="123" class="scate12">견과, 건과</option>
										<option value="124" class="scate12">시리얼, 그래놀라</option>
										<option value="125" class="scate12">선식, 누룽지, 곡물스낵</option>
										<option value="126" class="scate12">현대쌀집</option>

										<option value="131" class="scate13">생선, 해산물</option>
										<option value="132" class="scate13">새우, 조개류, 갑각류</option>
										<option value="133" class="scate13">김, 미역, 해조류</option>
										<option value="134" class="scate13">연어, 간편수산물</option>
										<option value="135" class="scate13">멸치, 건어물, Dried-H,
											어부의밥상</option>

										<option value="141" class="scate14">소고기</option>
										<option value="142" class="scate14">돼지고기</option>
										<option value="143" class="scate14">닭, 오리, 양고기</option>
										<option value="144" class="scate14">갈비, 양념육</option>
										<option value="145" class="scate14">베이컨, 샤퀴테리, 가공육</option>
										<option value="146" class="scate14">달걀류</option>
										<option value="147" class="scate14">프리미엄 (1+, 1++)</option>
										<option value="148" class="scate14">화식한우, 암소한우</option>

										<option value="151" class="scate15">밥, 볶음밥, 도시락</option>
										<option value="152" class="scate15">국, 탕 찌개</option>
										<option value="153" class="scate15">면, 스파게티, 국수</option>
										<option value="154" class="scate15">라면, 햇반, 즉석밥</option>
										<option value="155" class="scate15">샐러드, 저칼로리식</option>

										<option value="161" class="scate16">엄마 손맛 즉석반찬</option>
										<option value="162" class="scate16">김치, 젓갈, 장아찌</option>
										<option value="163" class="scate16">메인요리, 밀키트</option>
										<option value="164" class="scate16">떡볶이, 만두, 냉동간식</option>
										<option value="165" class="scate16">죽, 스프, 카레</option>

										<option value="171" class="scate17">식초, 간장, 장류</option>
										<option value="172" class="scate17">소금, 설탕, 조미료, 향신료</option>
										<option value="173" class="scate17">소스, 드레싱</option>
										<option value="174" class="scate17">식용유, 참기름, 올리브유</option>
										<option value="175" class="scate17">밀가루, 분말</option>

										<option value="181" class="scate18">베이커리, 케이크, 파이</option>
										<option value="182" class="scate18">치즈</option>
										<option value="183" class="scate18">잼, 버터, 꿀</option>
										<option value="184" class="scate18">선물용 베이커리와 치즈</option>

										<option value="191" class="scate19">스낵, 쿠키류</option>
										<option value="192" class="scate19">떡, 전통간식</option>
										<option value="193" class="scate19">초콜릿, 캔디, 젤리</option>
										<option value="194" class="scate19">아이스크림</option>

										<option value="201" class="scate20">생수, 탄산수</option>
										<option value="202" class="scate20">우유, 두유, 요거트</option>
										<option value="203" class="scate20">탄산음료, 주스</option>
										<option value="204" class="scate20">커피</option>
										<option value="205" class="scate20">차, 과실청</option>


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
