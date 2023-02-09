package com.livecommerce.project.service;

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
public interface ChatService {

	//채팅 내역 저장
	public void saveChat(ChatMessageVO message);

}
