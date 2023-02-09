<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/header/main_header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1">
  <link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.css" />
  <link rel="stylesheet" href="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.css">
  
<!-- <meta http-equiv="Content-Security-Policy" content="upgrade-insecure-requests"> -->
<meta name="_csrf" content="${_csrf.token}" />
<meta name="_csrf_header" content="${_csrf.headerName}" />
<link rel="shortcut icon" href="/img/logo/logo_header_icon.png">
<title>H-LIVE</title>
<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script type="text/javascript" src="/resources/js/common.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=c2dbd6c0b5c00df629f26d19c5981c33&libraries=services"></script>
<script src="https://cdn.jsdelivr.net/npm/hls.js@latest"></script>
<script src="https://cdn.jsdelivr.net/bxslider/4.2.12/jquery.bxslider.min.js"></script>
<script src="https://unpkg.com/swiper/swiper-bundle.js"></script>
<style>
body {
	margin: 0 auto;
	width: auto;
	font-size: 16px;
}

* {
	box-sizing: border-box;
}

body {
	font-family: Verdana, sans-serif;
}

.mySlides {
	display: none;
}

img {
	vertical-align: middle;
}

/* Slideshow container */
.slideshow-container {
	max-width: 1000px;
	position: relative;
	margin: auto;
}

/* Caption text */
.text {
	color: #f2f2f2;
	font-size: 15px;
	padding: 8px 12px;
	position: absolute;
	bottom: 8px;
	width: 100%;
	text-align: center;
}

/* Number text (1/3 etc) */
.numbertext {
	color: #f2f2f2;
	font-size: 12px;
	padding: 8px 12px;
	position: absolute;
	top: 0;
}

/* The dots/bullets/indicators */
.dot {
	height: 15px;
	width: 15px;
	margin: 0 2px;
	background-color: #bbb;
	border-radius: 50%;
	display: inline-block;
	transition: background-color 0.6s ease;
}

.active {
	background-color: #717171;
}

/* Fading animation */
.fade {
	animation-name: fade;
	animation-duration: 1.5s;
}

@keyframes fade {
	from {opacity: .4
}

to {
	opacity: 1
}

}

/* On smaller screens, decrease text size */
@media only screen and (max-width: 300px) {
	.text {
		font-size: 11px
	}
}
/* .swiper-container {
      width: 100%;
      height: 100%;
    } */
    .swiper-slide {
      text-align: center;
      font-size: 18px;
      /* Center slide text vertically */
      display: -webkit-box;
      display: -ms-flexbox;
      display: -webkit-flex;
      display: flex;
      -webkit-box-pack: center;
      -ms-flex-pack: center;
      -webkit-justify-content: center;
      justify-content: center;
      -webkit-box-align: center;
      -ms-flex-align: center;
      -webkit-align-items: center;
      align-items: center;
    }
    .no-scroll {
	  -ms-overflow-style: none; /* IE, Edge */
	  scrollbar-width: none; /* Firefox */
	}
	.no-scroll::-webkit-scrollbar {
	  display: none; /* Chrome, Safari, Opera */
	}
	.bx-wrapper{
		-moz-box-shadow:none;
		-webkit-box-shadow:none;
		box-shadow:none;
		border:0;
	}
	.bx-wrapper .bx-controls-direction a{
		z-index:10;
	}
</style>
  <script>
    $(document).ready(function(){
      $('.slider').bxSlider({
    	  auto:true,
    	  speed:500,
    	  pause:3000,
    	  mode:'horizontal',
    	  autoControls : false,
    	  pager:false,
    	  captions:true,
    	  preloadImages:'all',
    	  controls:false
      });
    });
  </script>
</head>
<body>
	<script>
	let csrfHeaderName ="${_csrf.headerName}";
	let csrfTokenValue="${_csrf.token}";
    function alarm(value){
    	var member_mid = '<sec:authentication property="name"/>';
    	//alert(member_mid);
    	//var login_id = document.getElementById("member_id").value;
    	if(member_mid == 'anonymousUser'){
    		alert("로그인 후 이용해주세요:)");
    	}
    	else{
        	if(confirm("해당 라이브 알림을 수신하겠습니까?") == true){
        		var checkArr = new Array();
        		checkArr.push(value);
        		$.ajax({
        			url: "/alarm/live",
        			type: "post",
        			data:{
        				chbox: checkArr
        			},
    				beforeSend: function(xhr) { xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);},
        			success: function(){
        				//alert("성공");
        			},error:function(jqXHR) {
        	            //alert("실패입니다.");
        	        }
        		});
        	}
    	}
    }
	</script>
	<div id="shop_wrap">
		<input type="hidden" id="loginid"
			value="<sec:authentication property="name"/>">
		<div style="display: none;">
			로그인ID :
			<sec:authentication property="name" />
			<br> 로그인 Auth :
			<sec:authentication property="authorities" />
			<br> 로그인 Detail :
			<sec:authentication property="Details" />
			<br> 로그인 Credentials :
			<sec:authentication property="Credentials" />
			로그인 Principal :
			<sec:authentication property="Principal" />
			<br>
		</div>
		<div class="shop_content">
			<div class="shop_mainPage">
				<section id="HomeBanner" style="text-align:center;">
					<ul class="slider">
					    <li><a href="#"><img src="/resources/img/banner/1.jpg" alt="img1"></a></li>
					    <li><a href="#"><img src="/resources/img/banner/2.jpg" alt="img2"></a></li>
					    <li><a href="#"><img src="/resources/img/banner/3.jpg" alt="img3"></a></li>
					    <li><a href="#"><img src="/resources/img/banner/4.jpg" alt="img4"></a></li>
					</ul>
				</section>
				<div id="MainContent">
					<section id="LiveNow" class="main_section">
						<div class="section_title">
 							<span class="color_point">⚡바로 지금! 라이브 방송⚡</span>
						</div>
						<div class="livenow_tab_wrap">
							<c:if test="${empty lives}">
								<h2 class="live_non_text">현재 라이브 중인 상품이 없습니다.</h2>
							</c:if>
							<div class="video_list_wrap">
								<div class="video_list_scroll" draggable="true">
									<c:forEach var="live" items="${lives}">
										<div class="video_list_item video_inline">
											<a href="/live/${live.liveId}" target="self"
												class="video_link">
												<div class="video_wrap">
													<!-- 라이브 -->
													<div class="video_container">
														<!-- 영상 상단 -->
														<video class="VideoPlayer_video liveVideo" id="vid"
															autoplay muted loop>
														</video>
														<span class="OnAirBadge_wrap"> <span
															class="LiveBadge"> <span class="LiveBadge_txt">LIVE</span>
														</span> <span class="OnAirBadge_count"> <c:choose>
																	<c:when test="${live.liveView > 9999}">
																		<c:set var="liveView" value="${live.liveView / 10000}" />
																		<fmt:formatNumber value="${liveView}" pattern="#.#" />만 시청
                                                            </c:when>
																	<c:otherwise>
																		<fmt:formatNumber value="${live.liveView}"
																			pattern="#,###" /> 시청
                                                            </c:otherwise>
																</c:choose>
														</span>
														</span>
													</div>
												</div> <span class="video_title">${live.liveTitle}</span>
											</a> <a rel="opener" target="_self" href="javascript:0;"
												class="video_link_creator"> <span class="video_profile"></a>
										</div>
									</c:forEach>
								</div>
							</div>
						</div>
					</section>
 					<section class="main_section swiper-section">
						<div class="section_title" style="padding-bottom:0;">
							<span class="color_point">MD's PICK</span>
						</div>
						<div class="swiper-container" style="overflow:hidden; padding-left:30px; padding-right:30px;">
						    <div class="swiper-wrapper" style="height: 400px;">
						        <c:forEach var="productRand" items="${productRand}">
						            <div class="swiper-slide">
						                <a href="/product/productDetail?pid=${productRand.pid}" target="self" class="video_link">
						                    <div>
						                        <img src="${productRand.img1}">
						                    </div>
						                    <span class="video_title" style="font-size:17px; white-space:normal;">${productRand.pname}</span>
						                    <span class="video_title" style="font-size:17px;">${productRand.price}원</span>
						                </a>
						            </div>
						        </c:forEach>
						    </div>
						  </div>
					</section>
					<section id="liveTrailer" class="main_section">
						<div class="section_title">라이브 예고</div>
						<ul class="LiveList_list LiveList_pc_twoColumn">
							<c:forEach var="trailer" items="${trailers}">
								<li class="LiveList_item" data-id>
									<div class="LiveList_itembox">
										<div class="LiveList_inner">
											<div class="LiveItem_airtime">
												<time datetime="">
													<span class="LiveItem_day"> <fmt:parseDate
															value="${trailer.liveStartTime}" var="startDateTime"
															pattern="yy-MM-dd HH:mm" /> <fmt:formatDate
															value="${startDateTime}" pattern="MM월dd일" />
													</span>
													<fmt:formatDate value="${startDateTime}" var="starttime"
														pattern="HH:mm" />
													<span class="LiveItem_time">${starttime}</span>
												</time>
                                        </div>
                                        <div class="LiveItem_thumbnail">
                                            <div class="video_container">
                                                <img class="video_container_img" src="/resources/img/logo/trailer_logo.png" draggable="false">
                                            </div>
                                        </div>
                                        
                                        <div>
                                            <div class="LiveContent_title">${trailer.liveTitle}</div>
                                            <div class="LiveContent_product">
                                            <div class="LiveContent_thumbnail">
                                                    <img class="LiveContent_img" src="/resources/img/product.png" draggable="false">
                                                </div>
                                                <div class="LiveContent_info">
                                           			<strong>
                                                        <span class="LiveContent_product_name">${trailer.pstitle}</span>
                                                    </strong>         
                                                    <div class="LiveContent_price">
                                                        
                                                    </div>
                                                </div>
                                                
                                            </div>
                                            <span class="LiveContent_seller">${trailer.mname}</span>
											<div>
												<input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}" />
		                        				<input type="hidden" id="mid" name="mid" value="${member}">
												<input type="hidden" id="live_id" name="live_id" value="${trailer.liveId}"/>
												<a href="#" class="livealarm0" onclick="alarm('${trailer.liveId}')" style="cursor: pointer">
													<div class="livealarm1">
														<div class="livealarm2">
															<img title="알림받기" class="livealarm_img" draggable="false" src="/resources/img/free-icon-notification-2326147.png" style="width:30px; height:30px; margin-top:90px;">
														</div>
													</div>
												</a>
											</div>
                                       </div>
                                </div>
                            </div>
                        </li>
                       </c:forEach>
                    </ul>
                </section>
                 <section class="main_section">
					<ul class="exhibition-ban">
						<li style="text-align:center;">
							<img src="https://tohomeimage.thehyundai.com/DP/DP034/2023/02/01/143747/tkcjl.jpg?RS=1204x160" alt="">
						</li>
					</ul>
				</section>
                 <section class="main_section swiper-section">
						<div class="section_title" style="padding-bottom:0;">
							<span class="color_point">품절 임박!</span>
						</div>
						<div class="swiper-container" style="overflow:hidden; padding-left:30px; padding-right:30px;">
						    <div class="swiper-wrapper" style="height: 400px;">
						        <c:forEach var="productStock" items="${productStock}">
						            <div class="swiper-slide">
						                <a href="/product/productDetail?pid=${productStock.pid}" target="self" class="video_link">
						                    <div>
						                        <img src="${productStock.img1}">
						                    </div>
						                    <span class="video_title" style="font-size:17px; white-space:normal;">${productStock.pname}</span>
						                    <span class="video_title" style="font-size:17px;">${productStock.price}원</span>
						                </a>
						            </div>
						        </c:forEach>
						    </div>
						  </div>
					</section>
            </div>
        </div>
                <div>
            <button  class="chatbot" title="chatbot"
			style="position: fixed; bottom: 30px; right: 30px; z-index:10000;" rel="nofollow" onfocus='this.blur()'>
				<img src="/resources/img/free-icon-chatbot-2068998.png" style="width: 50px; height: 50px; border-radius: 15px;"/>
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
<script>
	var swiper = new Swiper('.swiper-container', {
		slidesPerView: 5,
		spaceBetween: 30,
		pagination: {
						el: '.swiper-pagination',
						clickable: true,
					},
		});
</script>
<script>
let slideIndex = 0;
showSlides();

function showSlides() {
  let i;
  let slides = document.getElementsByClassName("mySlides");
  let dots = document.getElementsByClassName("dot");
  for (i = 0; i < slides.length; i++) {
    slides[i].style.display = "none";  
  }
  slideIndex++;
  if (slideIndex > slides.length) {slideIndex = 1}    
  for (i = 0; i < dots.length; i++) {
    dots[i].className = dots[i].className.replace(" active", "");
  }
  slides[slideIndex-1].style.display = "block";  
  dots[slideIndex-1].className += " active";
  setTimeout(showSlides, 2000); // Change image every 2 seconds
}
</script>
</body>
</html>
<%@ include file="/WEB-INF/views/footer/footer.jsp"%>