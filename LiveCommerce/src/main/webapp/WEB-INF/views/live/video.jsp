<%@page contentType="text/html" pageEncoding="UTF-8" language="java"%>
<%@taglib prefix="sec" uri="http://www.springframework.org/security/tags" %>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
    <script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.4.0/sockjs.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
    <!-- <script type="text/javascript" src="/js/live.js" ></script>    -->
    <script type="text/javascript" src="/resources/js/common.js" ></script>  
    <script type="text/javascript" src="/resources/js/live_common.js" ></script>  
	<style>
		
	</style>
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
                                        <img class="LiveHeader_image" width="38" height="38" src="/resources/img/live/free-icon-user.png">
                                        <span class="LiveBadge_live blind">LIVE</span>
                                    </div>           
                                    <div class="LiveHeader_text_area">
                                        <h2 class="LiveHeader_text">${live.liveTitle}</h2>
                                        <div class="LiveHeader_item_box">
                                            <span class="LiveHeader_nickname">${live.getMId()}</span>
                                            <span class="LiveHeader_live">
                                                <i class="LiveHeader_view_icon"></i>
                                                <span class="LiveHeader_view_count"></span>
                                            </span>
                                        </div>
                                    </div>
                                </div>
                            </header>
                            <div class="NoticeContent_area blind"></div>
                            <div class="NoticeContent_box blind">
                            
                                <div class="NoticeContent_text">라이브가 종료되었습니다.</div>  
                                <div class="NoticeContent_text NoticeContent_count"></div>
                                <sec:authentication property="principal" var="user"/> 
                                <sec:authorize access="isAuthenticated()">
								   <c:if test="${user.username eq host}">
                                   
                                	   
                                	   <button class="LiveFinish" type="button" ><div class="NoticeContent_btn_home">라이브 종료</div></button>
                                	   
                                	</c:if>
								</sec:authorize>
                                
                            </div>
                            <div class="LiveVideoPlayer_wrap">
                                <div class="video_container">
                                    <video id="video" controls muted disablepictureinpicture="true" controlslist="nodownload" width="100%" height="100%" preload="auto" poster="/resources/img/logo/trailer_logo.png"></video>  
                                </div>
                            </div>
                            <div class="Comments_wrap" id="Comments_wrap">
                                <div class="Comments_inner">
                                    <div class="Comments_animation_area"></div>
                                </div>
                            </div>
                            <!-- 방송중인 아이템 이미지 -->
                            <div class="TagItem_wrap" >
                                <div class="TagItem_current">
                                    <a class="TagItem_link">
                                        <div class="TagItem_thumbnail">
                                            <img class="TagItem_image" width="64" height="64" draggable="false" src="/resources/img/live/shopstore.png">
                                        </div>
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
                            
                            <!-- 방송중인 아이템 리스트 -->
                            <section class="ItemModal_section" style="display: none;">
                                <div class="ItemModal_content ItemModal_content_iframe">
                                    <div class="ModelTitle_wrap">
                                        <%-- <h3 class="ModelTitle_title">${live.ProductPostVO.getPsTitle()}</h3> --%>
                                        <button type="button" class="ModelTitle_btn">
                                            <i class="ModelTitle_icon"></i>
                                        </button>
                                    </div>
                                    <iframe class="TagItemIframe_iframe" src="/live/item?ps_index=${live.psIndex}"></iframe>
                                </div>
                            </section>
                            <!-- 쿠폰페이지iframe영역 -->
                            <section class="ItemModal_section2" style="display: none; z-index:999;">
                                <div class="ItemModal_content ItemModal_content_iframe">
                                    <div class="ModelTitle_wrap">
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
                                    <iframe class="TagItemIframe_iframe3" src="/live/recipe?ps_index=${live.psIndex}"></iframe>
                                </div>
                            </section>
                            <button type="button" class="CommentBtn_wrap" aria-hidden="false">
                                <span class="CommentBtn_inner">
                                    <i class="header_icon CommentBtn_icon"></i>
                                    <!-- <span class="blind">댓글쓰기</span> -->
                                </span>
                            </button>
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
<script>
$(document).ready(function() {  
	
    const stream = "${live.streamKey}".trim();
    const status = '${live.liveStatus}';
    const liveId = '${live.liveId}';
    const host = '${host}';
    
    const liveUrl = '${liveUrl}';
    const nick = '${nick}';
    const chatUrl = '${chatUrl}';
    
    //라이브 연결
    var video = document.getElementById('video');
    var videoSrc =liveUrl+"/"+stream+".m3u8";
    var hls = new Hls();
    if(status==1){
    	video.pause();
        if(video.canPlayType('application/vnd.apple.mpegurl')) {   // 우선 HLS를 지원하는지 체크
            video.src = videoSrc;
        }else if(Hls.isSupported()){  // HLS를 지원하지 않는다면 hls.js를 지원
            hls.loadSource(videoSrc);
            hls.attachMedia(video);
            hls.on(Hls.Events.MANIFEST_PARSED,()=>{
            	video.oncanplaythrough = function(){
                    video.play(); //라이브 시작
                    $('.LiveBadge_live').removeClass('blind');
            	}
            })
            hls.on(Hls.Events.ERROR, function(data) {
                liveEnd();
            });
        }
    }else{
        liveEnd();
    }
    function liveEnd(){
        video.src ="";
        $('.NoticeContent_area').removeClass('blind');
        $('.NoticeContent_box').removeClass('blind');
        $('.CommentBtn_wrap').addClass('blind');
        $('.Comments_wrap').addClass('blind');
        $('.NoticeContent_count').innerHTML = $('.LiveHeader_view_count').text();
        console.log($('.LiveHeader_view_count').text());
        hls.destroy();              //hls 종료
    }
    $('#Comments_wrap').scrollTop($('#Comments_wrap')[0].scrollHeight);
    //채팅창 열기 - 하단 팝업창 닫기, 채팅 입력창 열기
    $(".CommentBtn_wrap").click(function(){
        if(nick==""){
            location.href="/login";
        }else{
            this.classList.toggle('active');
        
            if(this.classList.contains('active')){
                //하단 팝업 버튼 숨기기
                $(".TagItem_wrap").css('display','none');
                $(".CommentWrite_wrap").css('visibility','visible');
            }else{
                $(".TagItem_wrap").css('display','');
                $(".CommentWrite_wrap").css('visibility','');
            } 
        }
    })
    
    var sock = new SockJS(chatUrl+"/stomp/chat", null, {transports: ["websocket", "xhr-streaming", "xhr-polling"]});  // 연결 주소
    var client = Stomp.over(sock);
    var header = {request_type:'web'};
   // client.connected = true;     
    client.debug = null;  //프레임 개발자 도구에서 숨기기
    client.connect({}, function(frame){
        //subscribe(path, callback)으로 메세지 받기
        client.subscribe("/sub/chat/room/"+liveId,function(chat){   // 서버 연결
            var content = JSON.parse(chat.body);
            var writer = content.chatMid;
            var msg = content.ctext;
            var str = '';    
            if(writer == host){
                str = "<div class='Comments_master'>";
                str +="<span class='Comment_comment_master'>"+msg+"</span>";
                str +="</div>";             
            }else{
                str = "<div class='comment_user'>";
                str +="<strong class='Comment_id'>"+writer+"</strong>";
                str +="<span class='Comment_comment'>"+msg+"</span>";
                str +="</div>";             
            }
            $('.Comments_animation_area').append(str);   
            $('#Comments_wrap').scrollTop($('#Comments_wrap')[0].scrollHeight);
        });   
       //send(path,header,message)로 메세지 전송
       client.send('/pub/chat/enter', {}, JSON.stringify({'liveId': liveId}))
       //메세지 받기
       client.subscribe("/sub/chat/count/"+liveId,function(chat){
            var count = JSON.parse(chat.body);
            $('.LiveHeader_view_count').text(count);
         }); 
    })
    
    $("#send_btn").click(function(){
    	flask();
    	send();
    })
    
    //채팅 입력창 값 있으면 전송 버튼 활성화
    $("#wa_textarea").keyup(function(e){
    	
        //전송 버튼 활성화
        if($("#wa_textarea").val()==""){
            $("#send_btn").attr("disabled",true);
        }else{
            $("#send_btn").attr("disabled",false);
        }
        //textarea 키 값 이벤트
        /* if((e.ctrlKey || e.metaKey) && (e.keyCode == 13 || e.keyCode == 10)) {
            //ctrl+enter
            $("#wa_textarea").val(function(i,val){
                return val + "\n";
            });
        } */
       if(e.keyCode==13 || e.keyCode == 10){
    	   e.preventDefault(); //엔터시 줄바꿈 방지(동작중단)
    	   flask();
           send();
        }
       
    });
    function send(){
        var msg = $("#wa_textarea").val();
        client.send('/pub/chat/message', {}, JSON.stringify({liveId: liveId, ctext: msg, chatMid: nick}));
        $("#wa_textarea").val('');   
        $("#send_btn").attr("disabled",true);
    }
    
    function flask(){
    	$.ajax({
    		type:"get",
    		dataType : "json",
    		data: {
    			"ctext" : $("#wa_textarea").val(),
  				"live" : liveId
    			},
    		url: "http://127.0.0.1:5000/predict",
    		success:function(data){
    			console.log("전송 성공");
    		},
    		error : function(error){
    			console.log(error);
    		}
    	});
    }
    
    $(".LiveFinish").click(function() {
    	$.ajax({
    		type:"get",
    		data: {"liveId" : liveId},
    		url: "/live/finish",
    		success:function(data){
    			if(data === null){
    				alert("동영상이 정상적으로 저장되지 않았습니다.");
    			}else{
    				alert("동영상이 저장되었습니다.");
    				window.close();
    			}
    			
    		},
    		error : function(error){
    			console.log(error);
    			alert("데이터가 전달되지 않았습니다.");
    		}
    	});
    });
    
});
</script>
</html>