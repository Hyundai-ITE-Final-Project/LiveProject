package com.livecommerce.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.simp.SimpMessageSendingOperations;
import org.springframework.stereotype.Controller;

import com.livecommerce.project.service.ChatService;
import com.livecommerce.project.service.LiveService;
import com.livecommerce.project.vo.ChatMessageVO;
import com.livecommerce.project.vo.LiveVO;

import lombok.extern.log4j.Log4j;
/**
 * @author 신기원
 * @since 2023.01.21
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.21    신기원                	 최초 생성
 * </pre>
 */
@Controller
@Log4j

public class ChatController {

	@Autowired
	private SimpMessageSendingOperations sendingOperations;
	
	@Autowired
	private LiveService liveService;
	
	@Autowired
	private ChatService chatService;
	
	/*
	 * @MessageMapping : WebSocket으로 들어오는 메세지를 받는다 Client에서는 prefix를 붙여 "/sub/chat"로
	 * 발행 요청하면 Controller가 해당 메세지를 받아 처리하는데 메세지가 발행되면 '/sub/chat/5-;/0[liveId]'로
	 * 메세지가 전송 된다
	 */
	@MessageMapping("/chat/message") //stompconfig에서  등록한 ApplicationDestinationPrefixes와 어노테이션 안의 경로가 합쳐진다.
    public void message(ChatMessageVO message) {
		chatService.saveChat(message);	//채팅 저장
        sendingOperations.convertAndSend("/sub/chat/room/"+message.getLiveId(), message);
    }
	
	//채팅방에 처음 들어왔을 때 실행
	 @MessageMapping(value = "/chat/enter")
	    public void enter(ChatMessageVO message) {
	        //뷰 수 변경
	        LiveVO liveVo = new LiveVO();
	        liveVo.setLiveId(message.getLiveId());
	        //liveChatvo.setLiveView(count);
	        //뷰 수 가져오기
	        liveService.setLiveView(liveVo);
	        int view = liveService.getLiveView(liveVo);
	        //뷰 수 전달
	        sendingOperations.convertAndSend("/sub/chat/count/" + message.getLiveId(),view);
	        //람다식을 이용해 list안에 map 데이터 찾기
	       //countListMap.stream().filter(x ->x.getLiveId().equals(message.getLiveId())).findAny();

	    }
    
}
