<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

</head>

<body id="smartchat" class="smartchat themeA scroll-no">
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
                                        <img src="https://ibot.hmall.com/images/20220816/ac4647ab7974497b88181679e4549715.png">
                                    </span>
                                </div>
                            </div>
                             <div id="intro-faq-grid" class="intro-faq is-basic" style="margin: 0px; display: block;">
                                <p>다른 고객님들이 자주 이용하는 메뉴입니다.</p>
                                <div class="inner">
                                    <ul>
                                        <li title="내주문 보기">
                                        	<a href="javascript:requestAnswer('주문 목록 조회', '내주문 보기', '24')">
	                                        	<span class="img">
	                                        		<img src="https://ibot.hmall.com/images/20220906/dcd6005359724e4581820ab3f254d30a.png" alt="">
	                                        	</span>
	                                        	<span class="txt">내주문 보기</span>
                                        	</a>
                                        </li>
                                        <li title="취소/반품/교환">
                                        	<a href="javascript:requestAnswer('취소/반품/교환 신청', '취소/반품/교환', '507')">
                                        		<span class="img">
                                        			<img src="https://ibot.hmall.com/images/20220906/fe7a7212ea1043c2bd0775b95f707a8f.png" alt="">
                                                </span>
                                                <span class="txt">취소/반품/교환</span>
                                            </a>
                                        </li>
                                        <li title="자주하는 질문">
                                        	<a href="javascript:requestAnswer('자주 묻는 질문', '자주하는 질문', '441')">
                                        		<span class="img">
                                        			<img src="https://ibot.hmall.com/images/20220906/fd4c7fac4dae48fc9c0a531e073f33ba.png" alt="">
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
                            <div class="inner"> 고객님, 안녕하세요.
                                무엇이 궁금하신가요?
                            </div>
                        </div>
                        <div class="date">오후 7:37</div>
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
    <script type="module">
        import { Configuration, OpenAIApi } from 'https://cdn.skypack.dev/openai';
		var cnt=1;
        /*전송 버튼을 누르면 내가 쓴 글자를 전송해주는 곳*/
        document.querySelector('#btn-send').addEventListener('click', function(){
			var txt = document.querySelector('#inp-chat').value;

            var template = `<div class="chat-item is-customer me">
                                    <div class="bubble has-moving in" style="max-height: 105px;">
                                        <div class="inner mine"></div>
                                	</div>
                             	<span class="date">오후 7:37</span>
                             </div>`
            document.querySelector('.chat-list').insertAdjacentHTML('beforeend', template);

			const list = document.querySelectorAll(".me");
			const len = list.length - 1;
			list[len].getElementsByClassName("mine")[0].setAttribute("id", cnt);
			document.getElementById(cnt).innerHTML = txt;		
			cnt++;
			console.log("cnt : " + cnt);
			console.log(txt);
			const configuration = new Configuration({
                apiKey: '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',
            });
			console.log(document.querySelector('#inp-chat').value);
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
                console.log("엔터가 쳐지는 이유는 뭘까...? : " + result.data.choices[0].text);
				const txt2 = result.data.choices[0].text;
				txt2.split("\n").join("");
				txt2.replace(/\r/g, "");
				txt2.replace(/\n/g, "");
				console.log("txt2 : " + txt2);

                var template = `<div class="chat-item is-ktalk you" style="visibility: visible;">
                                	<div class="bubble has-moving in your" style="max-height: 357px;"></div>
                                	<div class="date">오후 7:37</div>
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
//페이지 맨 하단으로 이동
  function scrollDown() {
      setTimeout(function () {
          $('.contents').animate({
              'scrollTop': $('.contents')[0].scrollHeight
          }, 300);
      }, 100);
  }
  </script>
</body>
</html>