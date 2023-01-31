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
    <style>
        	body{
    		margin: 0 auto;
    		width: auto;
    		font-size:16px;
    	}
    </style>
</head>
<body>
<div id="shop_wrap">
	<input type="hidden" id="loginid" value="<sec:authentication property="name"/>">
	    	<div style="display:none;">
			로그인ID : <sec:authentication property="name"/><br>
			로그인 Auth : <sec:authentication property="authorities"/><br>
			로그인 Detail : <sec:authentication property="Details"/><br>
			로그인 Credentials : <sec:authentication property="Credentials"/>
			로그인 Principal : <sec:authentication property="Principal"/><br>
		</div>
    <div class="shop_content">
        <div class="shop_mainPage">
            <section id="HomeBanner">
                <div class="banner_view">
                    <div class="banner_pannel">
                        <div class="HomeBanner_wrap" style="position: absolute; left: 0px;">
                            <a href="#" class="HomeBanner_link link_black" style="background-color: #efdcec;">
	                            <div class="HomeBanner_banner">
	                                <span class="HomeBanner_txt">
	                                    <span class="HomeBanner_label">LIVE 예고</span>
	                                    <strong class="HomeBanner_title">Valentine's Day🧁<br>인기 발렌타인 데이 선물</strong>
	                                    <span class="HomeBanner_date">2월 10일 오후 2시</span>
	                                </span>
	                                <img style='text-align: right;' src="../../resources/img/banner/live_banner2.png" ></img>
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
                    <ul class="LiveList_list LiveList_pc_twoColumn">
                        <c:forEach var="trailer" items="${trailers}">
                        <li class="LiveList_item" data-id>
                            <div class="LiveList_itembox">
                                <div class="LiveList_inner">
                                        <div class="LiveItem_airtime">
                                        <time datetime="">
                                                
                                                <span class="LiveItem_day">
	                                                <fmt:parseDate value="${trailer.liveStartTime}" var="startDateTime" pattern="yy-MM-dd HH:mm" />
	                                                <fmt:formatDate value="${startDateTime}" pattern="MM월dd일" />
                                                </span>
                                                <fmt:formatDate value="${startDateTime}" var="starttime" pattern="HH:mm" />
                                                <span class="LiveItem_time">${starttime}</span>
                                            </time>
	                                        <%-- <span class="LiveItem_day">
		                                         <fmt:parseDate value="${trailer.liveStartTime}" var="startDate" pattern="yy-mm-dd HH:mm"/>
		                                         <fmt:formatDate value="${startDate}" var="trailTime" pattern="MM월dd일  HH:mm" />
		                                         <fmt:formatDate value="${startDate}" pattern="MM월dd일 " />
		                                         
											</span>
	                                        
	                                        <span class="LiveItem_time">
	                                        	<fmt:formatDate value="${startDate}" pattern="HH:mm" />
	                                        </span> --%>
                                        </div>
                                        <div class="LiveItem_thumbnail">
                                            <div class="video_container">
                                                <img class="video_container_img" src="/resources/img/chun.jpg" draggable="false">
                                            </div>
                                        </div>
                                        
                                </div>
                            </div>
                        </li>
                       </c:forEach>
                    </ul>
                </section>
            </div>
        </div>
                <div>
            <button  class="chatbot" title="chatbot"
			style="position: fixed; bottom: 30px; right: 30px;" rel="nofollow" onfocus='this.blur()'>
				<img src="/resources/img/free-icon-chatbot-2068998.png" style="width: 50px; height: 50px; border-radius: 15px; z-index:10000;"/>
			</button>   
        </div>
    </div>
</div>
<script>
$(function(){
	var marginLeft = parseInt($(".chatbot").css('margin-left'));
	$(window).scroll(function(e){
		$(".chatbot").css("margin-left", marginLeft - $(this).scrollLeft());
	});
});
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


<script>
$(function() {
	   $(".main1").attr("aria-selected","true");
	   
	});
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
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>