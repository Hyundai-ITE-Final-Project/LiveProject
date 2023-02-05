<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core"    prefix="c" %>
<%@taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>   
<link rel="stylesheet" type="text/css" href="/resources/css/common.css">
<link rel="stylesheet" type="text/css" href="/resources/css/video.css">
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0">    --> 
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <title>H-LIVE</title>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="/js/common.js" ></script>
    <script type="text/javascript" src="/js/item.js" ></script>
        <style>
        h3{
    		font-family: 'Pretendard-Regular';
		    margin-top: 20px;
		    margin-right: 20px;
		    margin-left: 20px;
		    text-align:center;
    	}
    	pre{
    		font-family: 'Pretendard-Regular';
		    margin-top: 20px;
		    margin-right: 20px;
		    margin-left: 20px;
		    font-size: 16px;
		    text-align:center;
		    white-space: break-spaces;
    	}
    </style>
</head>
<body>
	<h3>🍓🍆🧅👨‍🍳 오늘은 내가 요리사 👨‍🍳🥕🥔🍖</h3>
	<pre>${recipe.recipe}</pre>

</body>
</html>