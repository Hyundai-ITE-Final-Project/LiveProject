<%@page  pageEncoding="UTF-8" language="java"%>
<%@ include file="/WEB-INF/views/header/main_header.jsp"%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <link rel="shortcut icon" href="/img/logo/logo_header_icon.png">
    <title>오늘의쇼핑</title>
    <script type="text/javascript" src="/resources/js/common.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
</head>
<body>
    <main class="container">
		<div id="shop_wrap">
		    <div class="shop_content">
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
		                            <div class="video_player" >
		                                <c:choose>
		                                    <c:when test="${live.liveStatus eq 1}">
					                          <video class="VideoPlayer_video liveVideo" id="vid" autoplay muted loop >
				                                          </video>
					                        </c:when>
					                        <c:otherwise>
					                          <video class="VideoPlayer_video replayVideo" autoplay muted loop poster="/resources/img/logo/trailer_logo.png">
					                            <source src="/video/${live.videoName}.mp4" type="video/mp4">
					                          </video>  
					                        </c:otherwise>
					                    </c:choose>
		                            </div>
		                            <!-- 영상 상단 -->
		                            <span class="OnAirBadge_wrap">
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
		                        </div>                                    
		                    </div>
		                    <span class="video_title">${live.liveTitle}</span>
			                </a>
		                </div>
		                </c:forEach>
		            </div>
		        </div>
		    </div>
		</div>
</main>
<script>
$(function() {
	   $(".main2").attr("aria-selected","true");
	   
	});
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
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>