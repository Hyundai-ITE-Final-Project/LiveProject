<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header/main_header.jsp"%>
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
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script> 
    <script type="text/javascript" src="/resources/js/common.js"></script>
    <script type="text/javascript" src="/resources/js/shop.js"></script>
    <script type="text/javascript" src="/resources/js/mypage.js"></script>
    <script type="text/javascript" src="/resources/js/order.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2dbd6c0b5c00df629f26d19c5981c33&libraries=services"></script>
    <script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
</head>
<body>
<div id="shop_wrap">
    <div class="shop_content">
        <div class="shop_mainPage">
            <section id="HomeBanner">
                <div class="banner_view">
                    <div class="banner_pannel">
                        <div class="HomeBanner_wrap" style="position: absolute; left: 0px;">
                            <a href="#" class="HomeBanner_link link_black" style="background-color: #e9dcf3;">
	                            <div class="HomeBanner_banner">
	                                <span class="HomeBanner_txt">
	                                    <span class="HomeBanner_label">LIVE 예고</span>
	                                    <strong class="HomeBanner_title">스위트홈🧁<br>인기 과자폭탄 선물세트</strong>
	                                    <span class="HomeBanner_date">8월 10일 오후 9시</span>
	                                </span>
	                                <img class="HomeBanner_img" src="/img/banner/live_banner2.png" ></img>
	                            </div>
                            </a>
                        </div>
                    </div>
                </div>
      
            </section>
            <div id="MainContent">
                <section id="LiveNow" class="main_section">
                    <div class="section_title"><span class="color_point">⚡NOW⚡</span>
                    </div>
                    <div class="ListBox_wrap">
                        <div class="ListBox_list">
                            <a href="javascript:0;" class="livenow_tab_menu" aria-selected="true">전체</a>
                        </div>                     
                    </div>
                    <div class="livenow_tab_wrap">
                    
                        <c:if test="${empty lives}">
                            <h2 class="live_non_text">
                            
                                현재 라이브 중인 상품이 없습니다.
                            </h2>
                        </c:if>
                        <div class="video_list_wrap">
                            <div class="video_list_scroll" draggable="true">
                              <c:forEach var="live" items="${lives}">
                                <div class="video_list_item video_inline">
	                                <a href="/live/${live.liveId}" target="self" class="video_link">
		                                <div class="video_wrap">
		                                   <!-- 라이브 -->
		                                    <div class="video_container">
		                                        <!-- 영상 상단 -->
		                                        <video class="VideoPlayer_video liveVideo" id="vid" autoplay muted loop >
		                                          </video>
		                                        <span class="OnAirBadge_wrap">
                                                    <span class="LiveBadge">
                                                        <span class="LiveBadge_txt">LIVE</span>
                                                    </span>
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
		                                              </span>
		                                              <span class="video_item_title">
		                                              </span>
		                                              <span class="video_item_price">
		                                                  <span class="video_price">
		                                                  </span>
		                                              </span>
		                                          </span>
		                                        </span>
		                                    </div>                                    
		                                </div>
		                                <span class="video_title">${live.liveTitle}</span>
	                                </a>
                                    <a rel="opener" target="_self" href="javascript:0;" class="video_link_creator">
                                        <span class="video_profile">
                                    </a>
                                </div>
                              </c:forEach>
                            </div>
                        </div>
                    </div>
                </section>
                <section id="liveTrailer" class="main_section">
                    <div class="section_title">📆라이브 예고</div>
                </section>
            </div>
        </div>
    </div>
</div>

<script>
//라이브 연결
var hls = new Hls();
<c:forEach var="live" items="${lives}" varStatus='st'>

   <c:if test="${live.liveStatus eq 1}">
     var video = $('.liveVideo')[${st.index}];
     if(video.canPlayType('application/vnd.apple.mpegurl')) {   // 우선 HLS를 지원하는지 체크
         video.src = "${url}/${live.getStreamKey()}.m3u8";
     }else if(Hls.isSupported()){  // HLS를 지원하지 않는다면 hls.js를 지원
         hls.loadSource("${url}/${live.getStreamKey()}.m3u8");
         hls.attachMedia(video);
         hls.on(Hls.Events.MANIFEST_PARSED,()=>{
             video.play(); //라이브 시작
         })
         hls.on(Hls.Events.ERROR, function(data) {
             hls.destroy();  
         });
     }
  </c:if>
</c:forEach>
</script>
<div id='chatbot'/>
<button  class="chatbot" title="chatbot"
	style="display: scroll; position: fixed; bottom: 30px; right: 5px;" rel="nofollow" onfocus='this.blur()'>
<img src="그림 이미지 주소(URL)" style="width: 25px; height: 25px; border-radius: 15px;"/>
</button>
<script>
	$(document).ready(function() {
		$('.chatbot').on("click",function(e){
			e.preventDefault();
			let popUrl = "/chatbot/chat"
			let popOption = "width=430,height=800,scrollbars=yes";
			window.open(popUrl, "챗봇", popOption);
		});
	});

</script>
</body>
</html>