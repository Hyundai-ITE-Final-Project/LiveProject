<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"    prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/video.css">
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">    --> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>오늘의쇼핑</title>
    <link rel="stylesheet" type="text/css" href="/css/video.css" >
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="/js/common.js" ></script>
    <script type="text/javascript" src="/js/item.js" ></script>
</head>
<body class="selective">
    <script>
    $(document).ready(function(){
		// 숫자 format
		Number.prototype.format = function () {
			if (this == 0) return 0;

			var reg = /(^[+-]?\d+)(\d{3})/;
			var n = (this + '');

			while (reg.test(n)) n = n.replace(reg, '$1' + ',' + '$2');

			return n;
		};
		
		$("input[name='productlist']").on("click",function(){
			var cnt = 0;
			var total = 0;
			$("div[name=productlist]").each(function(index, item){
				if($(this).find("input[name='productlist']").is(":checked")){
					cnt++;
					var price = $(this).find("input[name='sumprice']").val()*1;
					total += price;
				}
			});
			console.log(cnt + " " + total);
			$(".sum_item_amount").html(total.format());
			$(".sum_count").html(cnt);
		});
    });
    // 수량변경
		function change_qty(pid, button) {
			var this_qty = $("#quantity" + pid).val() * 1;
			var this_price = $("#price" + pid).val() * 1;
			if (button == 'left') {
				this_qty -= 1;
				if (this_qty < 1) {
					this_qty = 1;
				}
			} else if (button == 'right') {
				this_qty += 1;
			}
			$("#quantity" + pid).val(this_qty);
			var sumtotal = this_price * this_qty;
			console.log(sumtotal);
			$("#sumprice"+pid).val(sumtotal);
			$(".item_amount"+pid).html(sumtotal.format());
			
			var cnt = 0;
			var total = 0;
			$("div[name=productlist]").each(function(index, item){
				if($(this).find("input[name='productlist']").is(":checked")){
					cnt++;
					var price = $(this).find("input[name='sumprice']").val()*1;
					total += price;
				}
			});
			console.log(cnt + " " + total);
			$(".sum_item_amount").html(total.format());
			$(".sum_count").html(cnt);
	    }
	</script>
    <div class="fix_filter_inner">
    	<c:forEach var="pd" items="${productlist}" varStatus='status'>
	        <div class="ft_select_area" name="productlist">
	                <ul class="ft_select_ul">
	                    <li class="ft_select_li">
	                        <div>
	                            <input type="checkbox" id="addPdVal" class="iChek" data-pk="${pd.pid}" name="productlist"
	                                value="${pd.pid}">
	                        </div>
	                    </li>
	                    <li>
	                        <a><img src="${pd.img1}" height="100px"></a>
	                        <div class="item_name">${pd.pname}</div>
	                        <div class="item_num_box">
	                            <div class="item_num_left">
	                                <div class="item_num_btn_area pd_15871">
	                                    <a class="count_btn count_minus" onclick="change_qty('${pd.pid}','left');"></a>
	                                    <input type="text" id="quantity${pd.pid}" name="quantity" class="item_count" value="1" readonly="readonly" />
	                                    <a class="count_btn count_plus" onclick="change_qty('${pd.pid}','right');"></a>
	                                </div>
	                            </div>
	                            <div class="item_num_right">
	                            	<span class="item_amount${pd.pid}">
	                                    <fmt:formatNumber value="${pd.price}" pattern="#,###" />
	                                </span>원</div>
	                                <input type="hidden" id="price${pd.pid}" value="${pd.price}" >
	                                <input type="hidden" id="sumprice${pd.pid}" name="sumprice" value="${pd.price }">
	                        </div>
	                    </li>
	                </ul>
	        </div>
        </c:forEach>
        <div class="ft_result">
            <div class="sum_count_box">
                총 수량
                <em class="sum_count">0</em>개
            </div>
            <div class="sum_amount_box">
                <strong>총 금액</strong>
                <div class="sum_amount_div">
                    <em class="sum_item_amount">
                    	<fmt:formatNumber value="${pd.price}" pattern="#,###" />
					</em> 원
                </div>
            </div>
        </div>
    </div>
    <div class="fix_btn_inner">
        <div class="click_be" style="display: none;">
            <button type="button" class="btn_buy fix_btn">구매하기</button>
        </div>
        <div class="fix_a_btn_area" style="">
            <button type="button" class="btn_bk fix_btn">장바구니</button>
        </div>
        <div class="fix_a_btn_area" style="">
            <button type="button" class="btn_buyPage btn_buy fix_btn">바로구매</button>
        </div>
    </div>
</body>
</html>