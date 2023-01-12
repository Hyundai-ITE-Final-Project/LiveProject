<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Document</title>
</head>
<body>
	<div class="panel-heading">Inquiry Register</div>
	<div class="panel-body">
		
		<form role="form" action="/inquiry/register" method="post">
		
			<div class="form-group">
				<label>Type</label> <input class="form-control" name='inq_type'>

			</div>
			<div class="form-group">
				<label>Title</label> <input class="form-control" name='inq_title'>

			</div>
			<div class="form-group">
				<label>Text Area</label>
				<textarea class="form-control" rows="3" name="inq_content"></textarea>
			</div>

			<div class="form-group">
				<label>Writer</label> <input class="form-control" name="member_mid">
			</div>
			<button type="submit" class="btn btn-default">Submit Button</button>
			<button type="reset" class="btn btn-default">Reset Button</button>
		</form>

	</div>
</body>
</html>
<script type="text/javascript">
$(document).ready(function(){
	var result = '<c:out value="${result}"/>'
})</script>