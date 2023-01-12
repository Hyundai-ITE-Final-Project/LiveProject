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
<script type="text/javascript">
$(document).ready(function() {
	
	var formObj = $("form");
	
	$('button').on("click", function(e){
		e.preventDefault();
	})
	var operation = $(this).data("oper");
	
	console.log(operation);
	
	
	if(operation === 'remove') {
		formObj.attr("action", "/inquiry/remove");
	}else if(operation === 'list'){
		self.location = "/inquiry/list";
		return;
	}
	formObj.submit();
		
	
});

});
</script>
<div class="row">
    <div class="panel panel-heading">Board Read Page</div>
    <div class="panel-body">
    
    <form role="form" action="/inquiry/modify" method="post">
    	<div class="form-group">
    		<label>inq_id</label>
    		<input class="form-control" name='inq_id' value='<c:out value="${inquiry.inq_id }"/>' readonly="readonly">
    		
    	</div>
    	
    	<div class="form-group">
    		<label>inq_type</label>
    		<input class="form-control" name='inq_type' value='<c:out value="${inquiry.inq_type }"/>' >
    		
    	</div>
    	
    	<div class="form-group">
    		<label>inq_title</label>
    		<input class="form-control" name='inq_title' value='<c:out value="${inquiry.inq_title }"/>' >
    		
    	</div>
    	
    	
    	<div class="form-group">
    		<label>member_mid</label>
    		<input class="form-control" name='member_mid' value='<c:out value="${inquiry.member_mid }"/>' readonly="readonly">
    		
    	</div>
    	
    	
    	<div class="form-group">
    		<label>inq_content</label>
    		<textarea class="form-control" rows="3" name='inq_content' ><c:out value="${inquiry.inq_content }"/></textarea>
    		
    		
    	</div>
    	
    	
    
    	<button type="submit" data-oper='modify' class="btn btn-default">Modify</button>
    	<button type="submit" data-oper='remove' class="btn btn-danger">Remove</button>
    	<button type="submit" data-oper='list' class="btn btn-info">List</button>

       
       </form>
    </div>

</div>
</body>
</html>

