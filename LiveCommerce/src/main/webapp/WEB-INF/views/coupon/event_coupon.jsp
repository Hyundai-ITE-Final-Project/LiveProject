<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ include file="/WEB-INF/views/header/main_header.jsp"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<style>
. imageclass {
	background-color: white;
}
.eventimage {
width: 1280px;
}
.box {
  width: 1500px;
  height: 500px;
  margin: 4px;
}

.fixed {
  position: fixed;
  top: 500px;
  left: 50px;
}
.backbtn {
  width: 1500px;
  height: 500px;
}
</style>
<body>
	<div class="imageclass">
		<img class ="eventimage"src="${pageContext.request.contextPath}/resources/img/coupon/event_coupon.jpg">
		<div class="fixed box">
		<button class="backbtn"></button>
		</div>
	</div>
</body>

<script>
let csrfHeaderName ="${_csrf.headerName}";
let csrfTokenValue="${_csrf.token}";
let date = new Date();
let year = date.getFullYear();
let month = ('0' + (date.getMonth() + 1)).slice(-2);           
let day = ('0' + date.getDate()).slice(-2);
const dateStr = year + '-' + month + '-' + day;
const EnddateStr = year + '-' + ('0' + (date.getMonth() + 2)).slice(-2) + '-' + day;
let ccode1 = '<sec:authentication property="name"/>' + "_" + year + month + "p20000";

const form = {
        ccode : ccode1,
     	cname : "신규&웰컴[20000원쿠폰]",
     	cprice : 20000,
     	cstartdate : dateStr,
     	cenddate : EnddateStr
}
//쿠폰 버튼
$(function() {
    $('button').click(function() {

   		$.ajax({
			url: '/coupon/add',
			type: 'POST',
			data: JSON.stringify(form),
			contentType : 'application/json',
			beforeSend: function(xhr) { xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
            success : function (data) {
            	couponAlert(data);
            },
            error : function(xhr){
                alert("error : " + xhr.status)
            }
		})
    });
});

function couponAlert(data){
		if(data == '0'){
			alert("쿠폰을 발급받지 못하였습니다.");
		} else if(data == '1'){
			alert("쿠폰이 발급되었습니다..");
		} else if(data == '2'){
			alert("쿠폰 이미 발급되었습니다..");
		}
	}
</script>
</html>


<%@ include file="/WEB-INF/views/footer/footer.jsp"%>