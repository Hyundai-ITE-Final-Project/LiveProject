<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>  
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>          
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome BookMall</title>
<link rel="stylesheet" href="/resources/css/goodsDetail.css">
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
</head>
<body>

						<div class="button_set">
							<a class="btn_cart">장바구니 담기</a>
							<a class="btn_buy">바로구매</a>
						</div>

<form action="/order/gd" method="get" class="order_form">
	<input type ="hidden" name = "orders[0].pid" value = 1>
	<input type ="hidden" name = "orders[0].pcount" value = 1>
</form>


</body>
<script>
/* 바로구매 버튼 */
$(".btn_buy").on("click", function(){
	let pcount = 1
	$(".order_form").find("input[name='orders[0].pcount']").val(pcount);
	$(".order_form").submit();
});
</script>
</html>