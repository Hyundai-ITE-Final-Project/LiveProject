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
						관리</a> <a href="/manage/sale" class="main_tab" aria-selected="false">판매
						내역 관리</a> <a href="/manage/setting" class="main_tab"
						aria-selected="false">설정</a>
			</div>
		</div>
		<div class="product_create_wrap">
			<div class="product_create_area">
				<div class="product_create_inner">
					<div class="_title">
						<h1>상품 상세 정보</h1>
					</div>
					<div class="product_create_content">
						<div class="create_layout">
							<div class="layout_subject_asterisk">상품번호</div>
							<input class="layout_input" name='pid'
									value='<c:out value="${product.pid }"/>' readonly='readonly'>
						</div>

						<div class="create_layout">
							<div class="layout_subject_asterisk">대분류</div>
							<input class="layout_input" name='lcategory'
									value='<c:out value="${product.lcategory }"/>' readonly='readonly'>
						</div>

						<div class="create_layout">
							<div class="layout_subject_asterisk">소분류</div>
							<input class="layout_input" name='scategory'
									value='<c:out value="${product.scategory }"/>' readonly='readonly'>
						</div>

						<div class="create_layout">
							<div class="layout_subject_asterisk">상품명</div>
							<input class="layout_input" name='pname'
									value='<c:out value="${product.pname }"/>' readonly='readonly'>
						</div>
<!-- 
						<div class="create_layout">
							<div class="layout_subject_asterisk">상품상세</div>
							<input style='text-overflow: ellipsis;' class="layout_input" name='detail'
									value='<c:out value="${product.detail }"/>' readonly='readonly'>
						</div>
						
						 -->

						<div class="create_layout">
							<div class="layout_subject_asterisk">상품가격</div>
							<input class="layout_input" name='price'
									value='<c:out value="${product.price }"/>' readonly='readonly'>
						</div>

						<div class="create_layout">
							<div class="layout_subject_asterisk">이미지</div>
							<input class="layout_input" name='img1'
									value='<c:out value="${product.img1 }"/>' readonly='readonly'>
						</div>

						<div class="create_layout">
							<div class="layout_subject_asterisk">재고량</div>
							<input class="layout_input" name='pstock'
									value='<c:out value="${product.pstock }"/>' readonly='readonly'>
						</div>


						<div class="create_layout">
							<div class="layout_subject_asterisk">전시상태</div>
							<input class="layout_input" name='pstatus'
									value='<c:out value="${product.pstatus }"/>' readonly='readonly'>
						</div>
					</div>
					
						<form role="form" action="/manage/registerProduct" method="post"
							enctype="multipart/form-data">

							<button data-oper='modify' class="btn_pp btn_product_update btn btn-default" type="button"
								onclick="location.href='/manage/modify?pid=<c:out value="${product.pid }"/>'">Modify</button>
							<button data-oper='list' class="btn_pp btn_product_update btn btn-default" type="button"
								onclick="location.href='/manage/products'">list</button>

						</form>


					</body>
</html>
