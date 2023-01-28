package com.livecommerce.project.service;

import java.util.List;

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
public interface ChatBotService {
	public List<OrderVO> getOrderLists(String member_mid);
}
