package com.livecommerce.project.config;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.scheduling.annotation.EnableScheduling;

import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

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
@Configuration
@EnableScheduling
@EnableWebSocketMessageBroker	//웹소캣 서버 설정
//메세지 브로거에 대한 설정을 해주는 config
public class StompWebSocketConfig  implements WebSocketMessageBrokerConfigurer{
    
    @Value("${chat.url}")
    private String chatUrl;
     
    //client에서 websocket연결할 때 사용할 API 경로를 설정해주는 메서드
    @Override
    public void registerStompEndpoints(StompEndpointRegistry registry) {
        
		/* 클라이언트 연결 후 해당 엔드포인트로 웹소켓 통신 가능 여부를 확인한 후, 응답이 websocket:true 이면 웹소켓이 연결된다. 
		 * WebSocket과 SockJs는 기본적으로 동일한 Origin 요청만을 수락한다 
		 * -> 와일드카드("*")를 사용하여 모든 요청을 수락할 수도 있지만 보안상의 이유로 권장되지 않는다*/
        registry.addEndpoint("/stomp/chat")  // 새로운 커넥션 생성시 사용됨 ex)new SockJS("/stomp/chat"); 
                .setAllowedOrigins(chatUrl) // protocl, host, port 3개가 모두 동일 해야 동일한 origin이고 
                .withSockJS();              // SockJS를 추가해 모든 브라우저에서 사용할 수 있게 한다
    }
    /*어플리케이션 내부에서 사용할 path를 지정할 수 있음*/
    @Override
    public void configureMessageBroker(MessageBrokerRegistry registry) {
        registry.setApplicationDestinationPrefixes("/pub"); //메시지 보낼 때 관련 경로 설정
        registry.enableSimpleBroker("/sub");                //메세지 받을 때 관련 경로
    }
}