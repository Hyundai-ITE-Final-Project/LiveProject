package com.livecommerce.project.mapper;

import com.livecommerce.project.vo.OrderPageItemVO;

public interface OrderMapper {
	/* 주문 상품 정보 */	
	public OrderPageItemVO getGoodsInfo(int pid);
}
