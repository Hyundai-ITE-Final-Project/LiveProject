<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %> 
<%-- <%
	response.setHeader("Cache-Control","no-store");
	response.setHeader("Pragma","no-cache");
	response.setDateHeader("Expires",0);
	if (request.getProtocol().equals("HTTP/1.1"))
	        response.setHeader("Cache-Control", "no-cache");
%> --%>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> -->
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <link rel="shortcut icon" href="/img/logo/logo_header_icon.png">
    <title>오늘의쇼핑</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/common.css" >
    <link rel="stylesheet" type="text/css" href="/resources/css/shop.css" > 
    <link rel="stylesheet" type="text/css" href="/resources/css/mypage.css" >
    <script type="text/javascript" src="/resources/js/common.js"></script>
    <script type="text/javascript" src="/resources/js/shop.js"></script>
    <script type="text/javascript" src="/resources/js/mypage.js"></script>
    <script type="text/javascript" src="/resources/js/order.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2dbd6c0b5c00df629f26d19c5981c33&libraries=services"></script>
    <script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
</head>
<body>
	<%@ include file="/WEB-INF/views/header/main_header.jsp"%>
    <main class="container">
		<div id="shop_wrap">
		    <div class="shop_content">
		        <div class="shop_menulist" role="presentation">
		        </div>
		        <div class="menu_tabpanel">
		            <div class="infiniteScroll_wrap">
		                <!-- c:if -->
		                <c:forEach var="live" items="${lives}">
		                <div class="videoCard_wrap videoVerticalList_item">
		                    <c:choose>
		                        <c:when test="${live.liveStatus eq 1}">
		                            <a href="/live/${live.liveId}" target="self" class="video_link">
		                        </c:when>
		                        <c:otherwise>
		                            <a href="/replay/${live.liveId}" target="self" class="video_link">
		                        </c:otherwise>
		                    </c:choose>
		                    <div class="video_wrap">
		                       <!-- 라이브 -->
		                        <div class="video_container">
		                            <!--  기본 이미지 -->
		                            <%-- <img class="video_container_img videoload" draggable="false" src="https://s3.ap-northeast-2.amazonaws.com/onlshop.shop${live.uploadPath}/${live.fileId}"> --%>
		                            <div class="video_player" >
		                            <!-- video poster: 재생 전 보여줄 이미지  -->
		                                <c:choose>
		                                    <c:when test="${live.liveStatus eq 1}">
					                          <video class="VideoPlayer_video liveVideo" id="vid" autoplay muted loop >
				                                          </video>
					                        </c:when>
					                        <c:otherwise>
					                          <video class="VideoPlayer_video replayVideo" autoplay muted loop poster="/resources/img/chun.jpg">
					                            <source src="/video/${live.videoName}.mp4" type="video/mp4">
					                          </video>  
					                        </c:otherwise>
					                    </c:choose>
		                            </div>
		                            <!-- 영상 상단 -->
		                            <span class="OnAirBadge_wrap">
		 <%--                               <jsp:useBean id="now" class="java.util.Date" />
		                                  <fmt:formatDate var="todayFormat" value="${now}" pattern="yyyy.MM.dd HH:mm" />
		                                  <c:set var="liveStartDate" value="${live.liveStartDay} ${live.liveStartTime}" />
		                                  <c:set var="liveEndDate" value="${live.liveStartDay} ${live.liveEndTime}" />  --%> 
		                               <c:choose>
		                                      <c:when test = "${live.liveStatus eq 1}">
		                                       <span class="LiveBadge">
		                                           <span class="LiveBadge_txt">LIVE</span>
		                                       </span>    
		                                      </c:when>
		                                      <c:otherwise>
		                                          <span class="video_viewer_type_ranking viewer-icon_span">
		                                             <span class="video_viewer-icon"></span>
		                                          </span>
		                                      </c:otherwise>
		                                  </c:choose>
		                                <span class="OnAirBadge_count">
		                                    <c:choose>
		                                           <c:when test="${live.liveView > 9999}">
		                                               <c:set var="liveView" value="${live.liveView / 10000}"/>
		                                               <fmt:formatNumber value="${liveView}" pattern="#.#" />만 시청
		                                           </c:when>
		                                           <c:otherwise>
		                                               <fmt:formatNumber value="${live.liveView}" pattern="#,###" /> 시청
		                                           </c:otherwise>
		                                       </c:choose>
		                                </span>
		                            </span>
		                            <span class="video_item_wrap">   
		                            <!-- 영상 하단 --> 
		                              <span class="video_item_inner">
		                                  <span class="video_item_img">
		                                      <img class="video_mini_img" src="/resources/img/chun.jpg">
		                                  </span>
		                                  <span class="video_item_title">
		                                      <%-- ${live.livePdVo.getPsTitle()} --%>
		                                  </span>
		                                  <span class="video_item_price">
		                                      <!-- <span class="video_discount">20%</span> -->
		                                      <%-- <strong><fmt:formatNumber value="${live.livePdVo.getPsPrice()}" pattern="#,###" /></strong>원 --%>
		                                  </span>
		                              </span>
		                            </span>
		                        </div>                                    
		                    </div>
		                    <span class="video_title">${live.liveTitle}</span>
			                </a>
			                <a rel="opener" target="_self" href="javascript:0;" class="video_link_creator">
			                    <span class="video_profile">
		                            <%-- <img class="video_profile_img" alt="기업명" src="https://s3.ap-northeast-2.amazonaws.com/onlshop.shop${live.liveSellerVo.getSelUploadPath()}/${live.liveSellerVo.getSelFileId()}" draggable="false"> --%>
			                    <%-- </span>${live.liveSellerVo.getSelName()} --%>
			                </a>
		                </div>
		                </c:forEach>
		            </div>
		        </div>
		    </div>
		</div>
</main>
<script>
//라이브 연결

<c:forEach var="live" items="${lives}" varStatus='st'>

   <c:if test="${live.liveStatus eq 1}">
   
     var hls${st.index} = new Hls();
     var video${st.index} = $('.liveVideo')[${st.index}];
     var stream${st.index} = "${liveUrl}/${live.getStreamKey()}.m3u8";
     console.log(video${st.index});
   	 if(video${st.index}.canPlayType('application/vnd.apple.mpegurl')) {   // 우선 HLS를 지원하는지 체크
   		 video${st.index}.src = stream${st.index};
         console.log("지원");
     }else if(Hls.isSupported()){  // HLS를 지원하지 않는다면 hls.js를 지원
    	 console.log("지원 안함");
         hls${st.index}.loadSource(stream${st.index});
         hls${st.index}.attachMedia(video${st.index});
         hls${st.index}.on(Hls.Events.MANIFEST_PARSED,()=>{
             video${st.index}.play(); //라이브 시작
         })
         hls${st.index}.on(Hls.Events.ERROR, function(data) {
        	 video${st.index}.src="";
         });
     }
  </c:if>
</c:forEach>
</script>

</body>
</html>