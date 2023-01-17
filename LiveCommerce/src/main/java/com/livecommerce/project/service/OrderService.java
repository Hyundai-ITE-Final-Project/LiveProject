package com.livecommerce.project.service;

import java.util.*;
import com.livecommerce.project.vo.*;

public interface OrderService {
	
	/* 주문 페이지로 넘길정보 */
	public List<OrderPageItemVO> getGoodsInfo(List<OrderPageItemVO> orders);
	/* 주문 */
	public void order(OrderVO ordervo);
}
