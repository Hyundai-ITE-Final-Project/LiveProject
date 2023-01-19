package com.livecommerce.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.MypageMapper;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.OrderVO;

@Service
public class MypageServiceImpl implements MypageService{
	@Autowired
	private MypageMapper mypageMapper;
	
	/* 주문 상품 리스트 */
	@Override
	public List<OrderVO> getOrderList(Criteria cri) {
		return mypageMapper.getOrderList(cri);
	}
	
	/* 주문 총 갯수 */
	@Override
	public int getOrderTotal(Criteria cri) {
		return mypageMapper.getOrderTotal(cri);
	}
	
	/* 주문 취소 후 상태변경 */
	@Override
	public int ordercancelState(String ostate, String oid) {
		return mypageMapper.ordercancelState(ostate, oid);
	}

}
