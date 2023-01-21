package com.livecommerce.project.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.ChatMessageVO;

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
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class ChatServiceTest {

	@Autowired
	private ChatService chatService;
	@Test
	public void testSaveChat() {
		ChatMessageVO chat = new ChatMessageVO();
		chat.setCtext("테스트 성공");
		chat.setChatMid("gd");
		chat.setLiveId("1");
		chatService.saveChat(chat);
	}

}
