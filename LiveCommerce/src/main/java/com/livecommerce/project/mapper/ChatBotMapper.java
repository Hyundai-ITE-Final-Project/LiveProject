package com.livecommerce.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

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
public interface ChatBotMapper {
	// 사용자별 주문리스트
	public List<OrderVO> getOrderLists(@Param("member_mid") String member_mid);
}
