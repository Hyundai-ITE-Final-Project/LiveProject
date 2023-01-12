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
<div class="row">
    <div class="panel panel-heading">Board Read Page</div>
    <div class="panel-body">
    	<div class="form-group">
    		<label>inq_id</label>
    		<input class="form-control" name='inq_id' value='<c:out value="${inquiry.inq_id }"/>' readonly="readonly">
    		
    	</div>
    	
    	<div class="form-group">
    		<label>inq_type</label>
    		<input class="form-control" name='inq_type' value='<c:out value="${inquiry.inq_type }"/>' readonly="readonly">
    		
    	</div>
    	
    	<div class="form-group">
    		<label>inq_title</label>
    		<input class="form-control" name='inq_title' value='<c:out value="${inquiry.inq_title }"/>' readonly="readonly">
    		
    	</div>
    	
    	
    	<div class="form-group">
    		<label>member_mid</label>
    		<input class="form-control" name='member_mid' value='<c:out value="${inquiry.member_mid }"/>' readonly="readonly">
    		
    	</div>
    	
    	
    	<div class="form-group">
    		<label>inq_content</label>
    		<input class="form-control" name='inq_content' value='<c:out value="${inquiry.inq_content }"/>' readonly="readonly">
    		
    	</div>
    	
    	
    
    

        <button data-oper='modify' 
        class="btn btn-default"
        onclick="location.href='/inquiry/modify?inq_id=<c:out value="${inquiry.inq_id }"/>'">Modify</button>
        <button data-oper='list' 
        class="btn btn-default"
        onclick="location.href='/inquiry/list'">
        list</button>
    </div>

</div>
</body>
</html>