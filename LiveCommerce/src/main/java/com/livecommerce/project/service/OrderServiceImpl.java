package com.livecommerce.project.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.OrderMapper;
import com.livecommerce.project.vo.OrderPageItemVO;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper orderMapper;
	
	//본격적으로 주문페이지에 필요로 한 상품 정보를 만들어 내는 로직
	@Override
	public List<OrderPageItemVO> getGoodsInfo(List<OrderPageItemVO> orders) {
		List<OrderPageItemVO> result = new ArrayList<OrderPageItemVO>();		
		
		for(OrderPageItemVO ord : orders) {
			
			OrderPageItemVO goodsInfo = orderMapper.getGoodsInfo(ord.getPid());			

			goodsInfo.setPcount(ord.getPcount());	
			
			goodsInfo.initSaleTotal();			
			
			result.add(goodsInfo);			
		}		
		
		return result;
	}
}
