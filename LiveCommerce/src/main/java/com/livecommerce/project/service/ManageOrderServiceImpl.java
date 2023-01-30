package com.livecommerce.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.ManageOrderMapper;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.OrderVO;

@Service
public class ManageOrderServiceImpl implements ManageOrderService{
	@Autowired
	private ManageOrderMapper manageOrdermapper;
	/* 주문 상품 리스트 */
	@Override
	public List<OrderVO> getOrderList(Criteria cri) {
		return manageOrdermapper.getOrderList(cri);
	}
	
	/* 주문 총 갯수 */
	@Override
	public int getOrderTotal(Criteria cri) {
		return manageOrdermapper.getOrderTotal(cri);
	}

	@Override
	public int ordercancelState(String ostate, String oid) {
		return manageOrdermapper.ordercancelState(ostate, oid);
	}
}
