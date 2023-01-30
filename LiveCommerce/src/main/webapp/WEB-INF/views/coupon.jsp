<%@ page contentType="text/html; charset=UTF-8" %>

<%-- <%@ include file="/WEB-INF/views/common/header.jsp" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %> 
<link rel="stylesheet" href="/resources/css/coupon.css">
<script type="text/javascript" src="http://script.gmkt.kr/jQuery/1.8.3/jquery-1.8.3.min.js"></script>
<body oncontextmenu="return false">

<!-- bodyWrap -->
<div id="bodyWrap" class="products">
    <!--title-->
    <h3 class="cnts_title">
    </h3>
    <!--//title-->
    <div class="sub_container">
        <div class="mgz_view">
            <div class="evt_top">
      <%--           <p class="subj">${ename}</p> --%>
                <p class="date">
<%--                     <fmt:formatDate pattern="yyyy-MM-dd" value="${estartdate}"/>
                    ~
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${eenddate}"/> --%>
                </p>
            </div>
            <div class="evt_cnts">
                <!-- 7주년 메인 이벤트 S -->
                <div class="evt-7th-main">
                    <div class="evt-video-wrap">
                    </div>
                    <div class="evt7th-main-event01">
                        <div class="coupon-wrap">
                            <div>
                                     <img class="coupon2" 
                                     src="${pageContext.request.contextPath}/resources/img/coupon_2000.png"></img>
                            </div>
                            <div class="coupon-list">
                                <div class="coupon coupon01" style="display: none">
                                    <img
                                            src="http://cdn.thehandsome.com/_ui/desktop/common/images/event/event_7th/evt_main/img_main_evt01_coupon01.png">
                                </div>
                            </div>
                        </div>

                        <input id = "token" type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />


                        <div class="btn-coupon-wrap ready">
                            <a href="javascript:;" class="btn-coupon" id = "coupon2000Btn"> 
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/event/event_7th/evt_main/img_btn_coupon.jpg">
                            </a>

                        </div>
                        <script>
                        let csrfHeaderName ="${_csrf.headerName}";
                        let csrfTokenValue="${_csrf.token}";
                        let date = new Date();
                        let year = date.getFullYear();
                        let month = ('0' + (date.getMonth() + 1)).slice(-2);           
                        let day = ('0' + date.getDate()).slice(-2);
                        const dateStr = year + '-' + month + '-' + day;
                        const EnddateStr = year + '-' + ('0' + (date.getMonth() + 2)).slice(-2) + '-' + day;
                        let ccode1 = '<sec:authentication property="name"/>' + "_" + year + month + "p2000";


                             const form = {
                                    ccode : ccode1,
                                 	cname : "2000원쿠폰",
                                 	cprice : 2000,
                                 	cstartdate : dateStr,
                                 	cenddate : EnddateStr
                        	}
                        	//쿠폰 버튼
                        	$("#coupon2000Btn").on("click", function(e){
                                var token = $('#token').val();
                                console.log("token : " + token);
                                console.log(dateStr);
                                console.log(EnddateStr);
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
                    </div>
                </div>
                <!-- 7주년 메인 이벤트 E -->
            </div>
        </div>
        <div class="btn_list_wrap">
        </div>
    </div>
</div>
<!-- //bodyWrap -->
<script src="https://static.addtoany.com/menu/locale/ko-KR.js"></script>
<%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %><%@ page contentType="text/html; charset=UTF-8" %>

<%@ include file="/WEB-INF/views/common/header.jsp" %> --%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<link rel="stylesheet" href="/resources/css/coupon.css">
<body oncontextmenu="return false">
<!-- bodyWrap -->
<div id="bodyWrap" class="products">
    <!--title-->
    <h3 class="cnts_title">
    </h3>
    <!--//title-->
    <div class="sub_container">
        <div class="mgz_view">
            <div class="evt_top">
    <%--             <p class="subj">${ename}</p> --%>
                <p class="date">
     <%--                <fmt:formatDate pattern="yyyy-MM-dd" value="${estartdate}"/>
                    ~
                    <fmt:formatDate pattern="yyyy-MM-dd" value="${eenddate}"/> --%>
                </p>
            </div>
            <div class="evt_cnts">
                <!-- 7주년 메인 이벤트 S -->
                <div class="evt-7th-main">
                    <div class="evt-video-wrap">
                       <%--  <img src="../../../resources/upload/${eimage}" style="width: 65vw; min-width: 65px;"> --%>
                    </div>
                    <div class="evt7th-main-event01">
                        <div class="coupon-wrap">
                            <div>
                  <!--               <img
                                        src="http://cdn.thehandsome.com/_ui/desktop/common/images/event/event_7th/evt_main/img_main_evt01_coupon.gif"> -->
                                     <img class="coupon1" 
                                     src="${pageContext.request.contextPath}/resources/img/coupon_1000.png"></img>
                            </div>
                            <div class="coupon-list">
                                <div class="coupon coupon01" style="display: none">
                                    <img
                                            src="http://cdn.thehandsome.com/_ui/desktop/common/images/event/event_7th/evt_main/img_main_evt01_coupon01.png">
                                </div>
                            </div>
                        </div>

                        <input id = "token" type="hidden" name="${_csrf.parameterName}"
                               value="${_csrf.token}" />


                        <div class="btn-coupon-wrap ready">
         				    <a href="javascript:;" class="btn-coupon" id = "coupon1000Btn"> 
                            <img src="http://cdn.thehandsome.com/_ui/desktop/common/images/event/event_7th/evt_main/img_btn_coupon.jpg">
                            </a>

                        </div>
                     <script>      
                        let ccode2 = '<sec:authentication property="name"/>' + "_" + year + month + "p1000";
                        
                             const form1 = {
                                    ccode : ccode2,
                                 	cname : "1000원쿠폰",
                                 	cprice : 1000,
                                 	cstartdate : dateStr,
                                 	cenddate : EnddateStr
                        	}
                        	//쿠폰 버튼
                        	$("#coupon1000Btn").on("click", function(e){
                                var token = $('#token').val();
                                console.log("token : " + token);
                                console.log(ccode2);
                                console.log(EnddateStr);
                        		$.ajax({
                        			url: '/coupon/add',
                        			type: 'POST',
                        			data: JSON.stringify(form1),
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
                    </div>
                </div>
                <!-- 7주년 메인 이벤트 E -->
            </div>
        </div>
        <div class="btn_list_wrap">
        </div>
    </div>
</div>
<!-- //bodyWrap -->
<script src="https://static.addtoany.com/menu/locale/ko-KR.js"></script>
<%-- <%@ include file="/WEB-INF/views/common/footer.jsp" %> --%>