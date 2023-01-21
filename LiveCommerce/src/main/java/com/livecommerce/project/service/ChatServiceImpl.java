package com.livecommerce.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.livecommerce.project.mapper.ChatMapper;
import com.livecommerce.project.vo.ChatMessageVO;
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
@Service
public class ChatServiceImpl implements ChatService{

	@Autowired
	private ChatMapper chatMapper; 
	
	@Transactional
	@Override
	public void saveChat(ChatMessageVO chat) {
		chatMapper.saveChat(chat);
	}
	
}
