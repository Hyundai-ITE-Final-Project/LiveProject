<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<jsp:useBean id="now" class="java.util.Date" />
<!DOCTYPE html>
<html lang="ko" class="win chrome etc ui-d s480 col-4 is-mobile is-modal-open">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport"
        content="width=device-width,initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0,user-scalable=no">


    <title>GPT 챗봇</title>

    <link rel="apple-touch-icon" href="/client/apple-touch-icon.png">
    <link rel="apple-touch-icon-precomposed" href="/client/icon-normal.png">

    <link rel="shortcut icon" type="image/x-icon"
        href="https://ibot.hmall.com/images/20220816/5d2c556447e84403a00644ea61bdce3e.png">
    <!-- CSS -->
    <link rel="stylesheet" type="text/css" href="/resources/css/smartTalk.css">

    <!-- javascript -->
    <script src="https://code.jquery.com/jquery-3.5.1.js"></script>
    <script>
    function go_mypage() {
    	window.opener.location.href="/mypage/orderList";
    }
    </script>

</head>

<body id="smartchat" class="smartchat themeA scroll-no">
    <fmt:formatDate value="${now}" pattern="HH시mm분" var="now" />
    <div class="header">
        <div class="header-inner">
            <h1><span class="logo">아이들(IDLE-AI)봇</span></h1>
            <button class="btn-login" onclick="toggleHelloWrap()"><em>로그인하기</em></button>
            <a id="alarm-icon" class="btn-alarm js-alarm"><em>알림 new</em></a>
        </div>
    </div>
    <div class="wrapper">
        <div class="container">
            <div class="contents" id="contents" style="overflow: auto;">
                <div id="chat-list" class="chat-list theme">
                    <input type="hidden" id="dddd" value="??contextPath_ko_KR??">
                    <div class="introOuter" style="">
                        <div id="intro" class="intro-wrap" style="">
                            <div class="intro-character" style="padding:10px;">
                                <p>반갑습니다!</p>
                                <div id="subIntroMsg"
                                    style="font-size: 14px;font-weight: normal;text-align: center;padding-top: 10px;">
                                    챗봇입니다.
                                </div>
                                <div class="characters" style="margin: 10px auto 0;">
                                    <span class="">
                                        <img
                                            src="https://ibot.hmall.com/images/20220816/ac4647ab7974497b88181679e4549715.png">
                                    </span>
                                </div>
                            </div>
                            <div id="intro-faq-grid" class="intro-faq is-basic" style="margin: 0px; display: block;">
                                <p>다른 고객님들이 자주 이용하는 메뉴입니다.</p>
                                <div class="inner">
                                    <ul>
                                        <li title="내주문 보기">
                                            <a onclick="menulist('orderlist')">
                                                <span class="img">
                                                    <img src="https://ibot.hmall.com/images/20220906/dcd6005359724e4581820ab3f254d30a.png"
                                                        alt="">
                                                </span>
                                                <span class="txt">내 쿠폰 보기</span>
                                            </a>
                                        </li>
                                        <li title="My Coupon">
                                            <a onclick="menulist('couponlist')">
                                                <span class="img">
                                                    <img src="https://ibot.hmall.com/images/20220906/94216669d669493aaa293f06cdec9701.png"
                                                        alt="">
                                                </span>
                                                <span class="txt">방송상품 확인</span>
                                            </a>
                                        </li>
                                        <li title="자주하는 질문">
                                            <a onclick="menulist('faq')">
                                                <span class="img">
                                                    <img src="https://ibot.hmall.com/images/20220906/fd4c7fac4dae48fc9c0a531e073f33ba.png"
                                                        alt="">
                                                </span>
                                                <span class="txt">자주하는 질문</span>
                                            </a>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="chat-item is-ktalk" style="visibility: visible;">
                        <div class="bubble has-moving in" style="max-height: 357px;">
                            <div class="inner"> 고객님, 안녕하세요😊
                                무엇이 궁금하신가요?
                            </div>
                        </div>
                        <div class="date">
                            <c:out value="${now}" />
                        </div>
                    </div>
                </div>
            </div>
        </div>

        <div class="chat-wrap">
            <!-- 홈 버튼 -->
            <button type="button" class="btn-gohome" title="홈 버튼" onclick="home();"></button>
            <div class="chat-forms">
                <form id="f-chat-wrap" method="post" class="forms" onsubmit="return false;" autocomplete="off">
                    <input type="text" class="inp-chat" id="inp-chat" placeholder="하이(H-AI)봇에 무엇이든 물어보세요!">
                    <!-- 메시지 전송 버튼 -->
                    <button type="submit" id="btn-send" class="btn-send" title="전송"></button>
                </form>
            </div>
        </div>
    </div>
    <!-- GPT를 사용한 실시간 채팅 -->
    <script type="module">
        import { Configuration, OpenAIApi } from 'https://cdn.skypack.dev/openai';
		var cnt=1;
        /*전송 버튼을 누르면 내가 쓴 글자를 전송해주는 곳*/
        document.querySelector('#btn-send').addEventListener('click', function(){
			var txt = document.querySelector('#inp-chat').value;

            var template = `<div class="chat-item is-customer me">
                                    <div class="bubble has-moving in" style="max-height: 10000px;">
                                        <div class="inner mine"></div>
                                	</div>
                             	<span class="date"><c:out value="${now}"/></span>
                             </div>`
            document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);

			const list = document.querySelectorAll(".me");
			const len = list.length - 1;
			list[len].getElementsByClassName("mine")[0].setAttribute("id", cnt);
			document.getElementById(cnt).innerHTML = txt;		
			cnt++;
			const configuration = new Configuration({
                apiKey: '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',
            });
            const openai = new OpenAIApi(configuration);
            // AI에게 보내는 부분
            openai.createCompletion({
                model: "text-davinci-003",
                prompt: document.querySelector('#inp-chat').value,//AI에게 질문보내는 코드 (내가 입력한 글자)
                temperature: 0.7,
                max_tokens: 256,
                top_p: 1,
                frequency_penalty: 0,
                presence_penalty: 0,
            }).then((result)=>{ //result 변수에 답변 저장
				const txt2 = result.data.choices[0].text;
				txt2.split("\n").join("");
				txt2.replace(/\r/g, "");
				txt2.replace(/\n/g, "");
				console.log("txt2 : " + txt2);

                var template = `<div class="chat-item is-ktalk you" style="visibility: visible;">
                                	<div class="bubble has-moving in your" style="max-height: 10000px;"></div>
                                	<div class="date"><c:out value="${now}"/></div>
                            	</div>`
                document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);

				const list2 = document.querySelectorAll(".you");
				const len2 = list2.length - 1;
				list2[len2].getElementsByClassName("your")[0].setAttribute("id", cnt);
				document.getElementById(cnt).innerHTML = txt2;
				cnt++;
				scrollDown();
            })
			$('#inp-chat').val('');
			scrollDown();
        })
  </script>
    <script>
        let csrfHeaderName = "${_csrf.headerName}";
        let csrfTokenValue = "${_csrf.token}";
        //페이지 맨 하단으로 이동
        function scrollDown() {
            setTimeout(function () {
                $('.contents').animate({
                    'scrollTop': $('.contents')[0].scrollHeight
                }, 300);
            }, 100);
        }
        
        var cnt = 100;
        
		// 클릭한 버튼을 기준으로 답변 출력
        function menulist(value) {
            var login_id = opener.document.getElementById("loginid").value;
            console.log("로그인된 아이디 : " + login_id);
            
			// 주문목록 조회하기 버튼을 클릭했을 경우
            if (value == 'orderlist') {
                var template = `<div class="chat-item is-customer me">
				          	<div class="bubble has-moving in" style="max-height: 10000px;">
				            	<div class="inner mine">내 주문 보기</div>
				          	</div>
				       		<span class="date"><c:out value="${now}"/></span>
				       	   </div>`
                console.log("durl");
                document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
                const list = document.querySelectorAll(".me");
                const len = list.length - 1;
                list[len].getElementsByClassName("mine")[0].setAttribute("id", cnt);
                cnt++;
				// 로그인 하지 않았을 경우
                if (login_id == 'anonymousUser') {
                    console.log("로그인안됨");
                    var template = `<div class="chat-item is-ktalk you" style="visibility: visible;">
				              	<div class="bubble has-moving in your" style="max-height: 10000px;">
				              		로그인이 필요한 서비스 입니다.
				              		<br>👇로그인 버튼을 클릭해 주세요👇
				              		<div class="bubble-actions">
				                    	<button type="button" class="btn-link is-script is-dynamic-script" onclick="window.opener.location.href='/login'">
				                    		<span>🔒현대홈쇼핑 로그인🔒</span>
				                    	</button>
				                	</div>
				              	</div>
				              	<div class="date"><c:out value="${now}"/></div>
				          	   </div>`;
                    document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
                    const list2 = document.querySelectorAll(".you");
                    const len2 = list2.length - 1;
                    list2[len2].getElementsByClassName("your")[0].setAttribute("id", cnt);
                    cnt++;
                    scrollDown();
                }
                else {
                    var template = `<div class="chat-item is-ktalk you" style="visibility: visible;">
					              	<div class="bubble has-moving in your" style="max-height: 10000px;">
					              	최근 주문내역입니다😄
					              		<div class="bubble-actions">
					                	</div>	              		
					              	</div>
					              	<div class="date"><c:out value="${now}"/></div>
					          	 </div>`;
				    document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
                    const list2 = document.querySelectorAll(".you");
                    const len2 = list2.length - 1;
                    list2[len2].getElementsByClassName("your")[0].setAttribute("id", cnt);
                    cnt++;
                    list2[len2].getElementsByClassName("bubble-actions")[0].setAttribute("id", cnt);
                    $.ajax({
                        url: "/chatbot/chat2",
                        type: "GET",
                        dataType: "json",
                        async: false,
                        beforeSend: function (xhr) {
                            xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
                        },
                        error: function (request, status, error) {
                        	alert("error : " + error);
                        },
                        success: function (result) {
                            var html = "";
                            var lc = 0;
                            for(var i=0; i<result.length; i++){
                            	console.log(result[i].count);
                            	//alert(result[i].oid);
                            	lc++;
								var listcount = result[i].count -1;


								if(listcount > 0){
									i += listcount;
	                                html += 
	                                	`
	                                	<button type="button" class="btn-link is-script is-dynamic-script"
	                                	 onclick="go_mypage()" style="height:auto;">
										<span>
										\${result[i].oid}
											<br>
											<p style="white-space:initial; line-height:1.2;">
											\${result[i].pname} 외 \${listcount}건
											</p>
										</span>
										<span>
											<img style="width:50px; height:50px;" src=\${result[i].img1}>
										</span>
										</button>
										`
								}
								else{
	                                html += 
	                                	`
	                                	<button type="button" class="btn-link is-script is-dynamic-script"
	                                	 onclick="go_mypage()" style="height:auto;">
										<span>
										\${result[i].oid}
										<br>
											<p style="white-space:initial; line-height:1.2;">
											\${result[i].pname}
											</p>
										</span>
											<span>
											<img style="width:50px; height:50px;" src=\${result[i].img1}>
											</span>
										</button>
										`
								}
	                            if(lc>=5){
	                            	break;
	                            }
                            }
                            html += 
                            	`
                            	<button type="button" class="btn-link is-script is-dynamic-script"
                            	 onclick="go_mypage()" style="height:auto;">
									<span>
									👉더 많은 주문내역 보러가기👈
									</span>
								</button>
								`
                            $("#"+cnt).html(html);
                        }
                    });
                    cnt++;
                    scrollDown();
                }
            }

            if (value == 'couponlist') {
            	var template = `<div class="chat-item is-customer me">
						          	<div class="bubble has-moving in" style="max-height: 10000px;">
						            	<div class="inner mine">내 쿠폰 보기</div>
						          	</div>
						       		<span class="date"><c:out value="${now}"/></span>
						       	 </div>`
		        console.log("durl");
		        document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
		        const list = document.querySelectorAll(".me");
		        const len = list.length - 1;
		        list[len].getElementsByClassName("mine")[0].setAttribute("id", cnt);
		        cnt++;
				// 로그인 하지 않았을 경우
		        if (login_id == 'anonymousUser') {
		            console.log("로그인안됨");
		            var template = `<div class="chat-item is-ktalk you" style="visibility: visible;">
		              	<div class="bubble has-moving in your" style="max-height: 10000px;">
	              		로그인이 필요한 서비스 입니다.
	              		<br>👇로그인 버튼을 클릭해 주세요👇
	              		<div class="bubble-actions">
	                    	<button type="button" class="btn-link is-script is-dynamic-script" onclick="window.opener.location.href='/login'">
	                    		<span>🔒현대홈쇼핑 로그인🔒</span>
				                    	</button>
				                	</div>
				              	</div>
				              	<div class="date"><c:out value="${now}"/></div>
				          	   </div>`;
		            document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
		            const list2 = document.querySelectorAll(".you");
		            const len2 = list2.length - 1;
		            list2[len2].getElementsByClassName("your")[0].setAttribute("id", cnt);
		            cnt++;
		            scrollDown();
		        }
		        else{
			        $.ajax({
			            url: "/chatbot/coupon",
			            type: "GET",
			            dataType: "json",
			            async: false,
			            beforeSend: function (xhr) {
			                xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
			            },
			            error: function (request, status, error) {
			            	alert("error : " + error);
			            },
			            success: function (result) {
			                var html = "";
			                var lc = 0;
			                if(result.length == 0){
			                    var template = `<div class="chat-item is-ktalk you" style="visibility: visible;">
					              	<div class="bubble has-moving in your" style="max-height: 10000px;">
			                    		쿠폰이 존재하지 않습니다😓
					              		<div class="bubble-actions">
		                        			<button type="button" class="btn-link is-script is-dynamic-script"
				                        	 onclick="#" style="height:auto;">
												<span>
												👉쿠폰 받으러가기👈
												</span>
											</button>
					                	</div>	              		
					              	</div>
					              	<div class="date"><c:out value="${now}"/></div>
					          	 </div>`;
							    document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
						        const list2 = document.querySelectorAll(".you");
						        const len2 = list2.length - 1;
						        list2[len2].getElementsByClassName("your")[0].setAttribute("id", cnt);
						        cnt++;
						        list2[len2].getElementsByClassName("bubble-actions")[0].setAttribute("id", cnt);
			                }
			                else{
			                    var template = `<div class="chat-item is-ktalk you" style="visibility: visible;">
					              	<div class="bubble has-moving in your" style="max-height: 10000px;">
					              	나의 쿠폰내역입니다😄
					              		<div class="bubble-actions">
					                	</div>	              		
					              	</div>
					              	<div class="date"><c:out value="${now}"/></div>
					          	 </div>`;
							    document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
						        const list2 = document.querySelectorAll(".you");
						        const len2 = list2.length - 1;
						        list2[len2].getElementsByClassName("your")[0].setAttribute("id", cnt);
						        cnt++;
						        list2[len2].getElementsByClassName("bubble-actions")[0].setAttribute("id", cnt);
				                for(var i=0; i<result.length; i++){
				                	lc++;
				                    html += 
				                        	`
				                        	<button type="button" class="btn-link is-script is-dynamic-script"
				                        	 onclick="#" style="height:auto;">
												<span>
													\${result[i].cname}
												</span>
											</button>
											`
				                    if(lc>=5){
				                    	break;
				                    }
				                }
				                $("#"+cnt).html(html);
			                }

			            }
			        });
			        cnt++;
			        scrollDown();
		        }
            }

            if (value == 'faq') {
            	var template = `<div class="chat-item is-customer me">
		          	<div class="bubble has-moving in" style="max-height: 10000px;">
		            	<div class="inner mine">궁금한게 있어요!</div>
		          	</div>
		       		<span class="date"><c:out value="${now}"/></span>
		       	 </div>`
		       	document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
			    const list = document.querySelectorAll(".me");
			    const len = list.length - 1;
			    list[len].getElementsByClassName("mine")[0].setAttribute("id", cnt);
			    cnt++;
			    
			    var template = `<div class="chat-item is-ktalk you" style="visibility: visible;">
	              					<div class="bubble has-moving in your" style="max-height: 10000px;">
              							👇자주묻는 질문👇
	              						<div class="bubble-actions">
					                    	<button type="button" id="faq1" class="btn-link is-script is-dynamic-script" onclick="#">
					                    		<span>주문취소는 어떻게 하나요?</span>
								            </button>
					                    	<button type="button" id="faq2" class="btn-link is-script is-dynamic-script" onclick="#">
				                    			<span>전국 어디나 배송이 가능한가요?</span>
								            </button>
					                    	<button type="button" id="faq3" class="btn-link is-script is-dynamic-script" onclick="#">
				                    			<span>쿠폰은 어디서 확인할 수 있나요?</span>
							            	</button>
				                		</div>
			              			</div>
			              			<div class="date"><c:out value="${now}"/></div>
			          	   		</div>`;
	            document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
	            const list2 = document.querySelectorAll(".you");
	            const len2 = list2.length - 1;
	            list2[len2].getElementsByClassName("your")[0].setAttribute("id", cnt);
	            cnt++;
	            scrollDown();
	            
	            document.getElementById("faq1").onclick = function(){
					    var template = `<div class="chat-item is-ktalk you" style="visibility: visible;">
	      					<div class="bubble has-moving in your" style="max-height: 10000px;">
	  							주문전체 취소는 사이트에서 진행하실 수 있으며,
	  							<br>
	  							부분취소의 경우 고객센터를 통해 취소하실 수 있습니다.
	  							<br>
	  							주문 이후 배송준비가 시작될 경우 사이트에서 직접취소는 불가한 점 안내드립니다.
		                    	<button type="button" class="btn-link is-script is-dynamic-script" onclick="go_mypage()">
	                    			<span>나의 주문내역 보러가기</span>
				            	</button>
	              			</div>
	              			<div class="date"><c:out value="${now}"/></div>
	          	   		</div>`;
				    document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
				    const list2 = document.querySelectorAll(".you");
				    const len2 = list2.length - 1;
				    list2[len2].getElementsByClassName("your")[0].setAttribute("id", cnt);
				    cnt++;
				    scrollDown();
	            }
	            
	            document.getElementById("faq2").onclick = function(){
				    var template = `<div class="chat-item is-ktalk you" style="visibility: visible;">
      					<div class="bubble has-moving in your" style="max-height: 10000px;">
  							I-LIVE는 전 지역 택배배송으로 배송됩니다.
              			</div>
              			<div class="date"><c:out value="${now}"/></div>
          	   		</div>`;
				    document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
				    const list2 = document.querySelectorAll(".you");
				    const len2 = list2.length - 1;
				    list2[len2].getElementsByClassName("your")[0].setAttribute("id", cnt);
				    cnt++;
				    scrollDown();
	            }
	            
	            document.getElementById("faq3").onclick = function(){
				    var template = `<div class="chat-item is-ktalk you" style="visibility: visible;">
      					<div class="bubble has-moving in your" style="max-height: 10000px;">
  							로그인 후 확인 가능합니다.
              			</div>
              			<div class="date"><c:out value="${now}"/></div>
          	   		</div>`;
				    document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);
				    const list2 = document.querySelectorAll(".you");
				    const len2 = list2.length - 1;
				    list2[len2].getElementsByClassName("your")[0].setAttribute("id", cnt);
				    cnt++;
				    scrollDown();
	            }
            }
        }
    </script>
</body>

</html>