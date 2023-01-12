<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<main class="container">




	<div id="orderList_wrap" class="mypage_wrap">
		<div id="orderList_area" class="mypage_area">
			<div class="mypage_title">
				<h1>상담 목록</h1>
			</div>
			<div class="orderList_content">
				<div class="orderList_group">

					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th scope="col">문의 번호<!-- 문의 번호 --></th>
								<th scope="col">문의 유형<!-- 문의 유형 --></th>
								<th scope="col">제목<!-- 제목 --></th>
								<th scope="col">작성자<!-- 작성자--></th>
							</tr>
						</thead>

						<c:forEach items="${list}" var="inquiry">
							<tr>
								<td><c:out value="${inquiry.inq_id}" /></td>
								<td><c:out value="${inquiry.inq_type}" /></td>
								<td><a href='/inquiry/get?inq_id=<c:out value="${inquiry.inq_id }"/>'>
								<c:out value="${inquiry.inq_title }"/></a></td>
								
								<td><c:out value="${inquiry.member_mid}" /></td>

							</tr>
						</c:forEach>
					</table>

				</div>
			</div>
		</div>
	</div>

	</main>
</body>
</html>