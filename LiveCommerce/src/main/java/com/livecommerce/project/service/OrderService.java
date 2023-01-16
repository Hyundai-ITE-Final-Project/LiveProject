package com.livecommerce.project.service;

import java.util.*;
import com.livecommerce.project.vo.*;

public interface OrderService {
	
	/* 주문 정보 */
	public List<OrderPageItemVO> getGoodsInfo(List<OrderPageItemVO> orders);
}
