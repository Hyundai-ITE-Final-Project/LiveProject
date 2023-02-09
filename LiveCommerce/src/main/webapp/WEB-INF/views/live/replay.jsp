<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<sec:authentication var="user" property="principal"/>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="_csrf" content="${_csrf.token}"/>
    <meta name="_csrf_header" content="${_csrf.headerName}"/>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="/img/logo/logo_header_icon.png">
    <title>H-LIVE</title>
    <link rel="stylesheet" type="text/css" href="/resources/css/video.css" >
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script type="text/javascript" src="/resources/js/common.js" ></script>
    <script type="text/javascript" src="/resources/js/live_common.js" ></script>  
</head>
<body>
    <div class="videoLayout_wrap videoLayout_pc">
        <div class="videoLayout_inner">
            <div style="height: 100%;">
                <div class="eg-flick-viewport">
                    <div class="eg-flick-camera">
                    <div class="FlickingContainer_content eg-flick-panel">
                        <div class="FlickingContainer_inner">
                            <header class="LiveHeader_wrap">
                                <h1 class="LiveHeader_logo">
							        <a href="/" class="logo_link">
							            <i class="header_icon logo_icon"></i>
							            <span class="blind">H-LIVE</span>
							        </a>
                                </h1>
                                <div class="ToolBox_wrap">
                                    <div class="SoundButton_wrap"> 
                                        <button type="button" class="SoundButton">
                                            <i class="SoundButton_icon header_icon header_icons"></i>
                                            <span class="blind">음소거</span>
                                        </button>
                                    </div>
                                    <div>
                                       <button type="button" class="CloseButton">
                                            <i class="CloseButton_icon header_icon header_icons"></i>
                                            <span class="blind">닫기</span>
                                        </button>
                                    </div>
                                </div>
                                <div class="LiveHeader_title">
                                    <div class="LiveHeader_img_area" >
                                        <span class="LiveBadge_live blind">LIVE</span>
                                    </div>           
                                    <div class="LiveHeader_text_area">
                                        <h2 class="LiveHeader_text">${replay.liveTitle}</h2>
                                        <div class="LiveHeader_item_box">
                                            <span class="LiveHeader_nickname">${replay.getMId()}</span>
                                            <span class="LiveHeader_live">
                                                <i class="LiveHeader_view_icon"></i>
                                                <span class="LiveHeader_view_count">${replay.liveView}</span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </header>
                            <div class="NoticeContent_area blind"></div>
                            <div class="LiveVideoPlayer_wrap">
                                <div class="video_container">
                                    <video id="video" autoplay muted loop controls disablepictureinpicture="true" 
                                    controlslist="nodownload" width="100%" height="100%" preload="auto" 
                                        poster="/resources/img/logo/trailer_logo.png"
                                        src="/video/${replay.videoName}.mp4">
                                    </video>  
                                </div>
                            </div>
                            <div class="Comments_wrap" id="Comments_wrap">
                                <div clas="Comments_inner">
                                    <div class="Comments_animation_area"></div>
                                    <div class="Comments_animation_area bottom_ani"></div>
                                </div>
                            </div>
                            
                            <div class="TagItem_wrap" >
                                <div class="TagItem_current">
                                    <a class="TagItem_link">
                                        <div class="TagItem_thumbnail">
                                            <img class="TagItem_image" width="64" height="64" draggable="false" src="/resources/img/live/shopstore.png">
                                        </div>
                                        <div class="TagItem_title">
                                        </div>
                                        <span class="TagItem_price">
                                        </span>
                                    </a>
                                </div>
                            </div>
                            	<!-- 쿠폰버튼영역 -->
                             <div class="TagItem_wrap2" >
                                <div class="TagItem_current">
                                    <a class="TagItem_link">
                                        <div class="TagItem_thumbnail">
                                        	<img class="TagItem_image" width="64" height="64" draggable="false" src="/resources/img/free-icon-coupon-6713699.png">
                                        </div>
                                        <div class="TagItem_title">
                                        </div>
                                        <span class="TagItem_price">
                                        </span>
                                    </a>
                                </div>
                            </div>
                            <div class="TagItem_wrap3" >
                                <div class="TagItem_current">
                                    <a class="TagItem_link">
                                        <div class="TagItem_thumbnail">
                                            <img class="TagItem_image" width="64" height="64" draggable="false" src="/resources/img/free-icon-recipe-book-1021460.png">
                                        </div>
                                        <div class="TagItem_title">
                                        </div>
                                        <span class="TagItem_price">
                                        </span>
                                    </a>
                                </div>
                            </div>
                            
                            <section class="ItemModal_section" style="display: none;">
                                <div class="ItemModal_content ItemModal_content_iframe">
                                    <div class="ModelTitle_wrap">
                                        <button type="button" class="ModelTitle_btn">
                                            <i class="ModelTitle_icon"></i>
                                        </button>
                                    </div>
                                    <iframe class="TagItemIframe_iframe" src="/live/item?ps_index=${replay.psIndex}"></iframe>
                                </div>
                            </section>
                            <!-- 쿠폰페이지iframe영역 -->
                            <section class="ItemModal_section2" style="display: none;">
                                <div class="ItemModal_content ItemModal_content_iframe">
                                    <div class="ModelTitle_wrap">
                                        <%-- <h3 class="ModelTitle_title">${replay.livePdVo.getPsTitle()}</h3> --%>
                                        <button type="button" class="ModelTitle_btn2">
                                            <i class="ModelTitle_icon"></i>
                                        </button>
                                    </div>
                                    <iframe class="TagItemIframe_iframe2" src="/coupon/couponpage?ps_index=${replay.psIndex}" scrolling="no"></iframe>
                                </div>
                            </section>
                            <section class="ItemModal_section3" style="display: none;">
                                <div class="ItemModal_content ItemModal_content_iframe">
                                    <div class="ModelTitle_wrap">
                                        <%-- <h3 class="ModelTitle_title">${replay.livePdVo.getPsTitle()}</h3> --%>
                                        <button type="button" class="ModelTitle_btn3">
                                            <i class="ModelTitle_icon"></i>
                                        </button>
                                    </div>
                                    <iframe class="TagItemIframe_iframe3" src="/live/recipe?ps_index=${replay.psIndex}"></iframe>
                                </div>
                            </section>
                            <div class="CommentWrite_wrap">
                                <textarea class="CommentWrite_text" id="wa_textarea" placeholder="실시간 채팅에 참여하세요" cols="1" ></textarea>
                                <button type="submit" class="CommentWrite_btn" id="send_btn" disabled>전송</button>
                            </div>
                        </div>
                    </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>