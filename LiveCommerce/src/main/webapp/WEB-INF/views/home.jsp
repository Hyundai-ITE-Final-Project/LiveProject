<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script> 
    <script type="text/javascript" src="/resources/js/common.js"></script>
    <script type="text/javascript" src="/resources/js/shop.js"></script>
    <script type="text/javascript" src="/resources/js/mypage.js"></script>
    <script type="text/javascript" src="/resources/js/order.js"></script>
    <script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2dbd6c0b5c00df629f26d19c5981c33&libraries=services"></script>
    <script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
    <script src="http://code.jquery.com/jquery-3.5.1.min.js"></script>
    
<%-- <script src="<!-- https://cdn.jsdelivr.net/npm/hls.min.js.map -->"></script> --%>
</head>
<body>
<div id="shop_wrap">
    <div class="shop_content">
        <div class="shop_menulist" role="presentation">
            <div class="shop_tablist" role="tablist" style="transition-timing-function: cubic-bezier(0.1, 0.57, 0.1, 1); transition-duration: 0ms;">
                <a href="/home" class="main_tab" aria-selected="true">홈</a>
                <a href="/shop?category=98" class="main_tab">라이브</a>
                <a href="javascript:void(0);" class="main_tab loc_live" class="main_tab">우리동네라이브</a>
                <a href="/shop?category=101" class="main_tab">패션</a>
                <a href="/shop?category=102" class="main_tab">뷰티</a>
                <a href="/shop?category=103" class="main_tab">푸드</a>
                <a href="/shop?category=104" class="main_tab">라이프</a>
                <a href="/shop?category=105" class="main_tab">취미 · 문화생활</a>
            </div>
        </div>
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
<c:forEach var="live" items="${lives}" varStatus='st'>
   <c:if test="${live.liveStatus eq 1}">
     var hls${st.index} = new Hls();
     var video${st.index} = $('.liveVideo')[${st.index}];
     var stream${st.index} = "${url}/${live.getStreamKey()}.m3u8";
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
console.log(video);
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