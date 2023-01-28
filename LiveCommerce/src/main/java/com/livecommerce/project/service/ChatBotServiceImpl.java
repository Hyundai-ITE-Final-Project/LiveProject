package com.livecommerce.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.ChatBotMapper;
import com.livecommerce.project.vo.OrderVO;
/**
 * @author 김나형
 * @since 2023.01.28
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.28		김나형		최초생성
 * </pre>
 */ 
@Service
public class ChatBotServiceImpl implements ChatBotService {
	@Autowired
	private ChatBotMapper chatbotMapper;
	/* 주문 상품 리스트 */
	@Override
	public List<OrderVO> getOrderLists(String member_mid) {
		return chatbotMapper.getOrderLists(member_mid);
	}
}
