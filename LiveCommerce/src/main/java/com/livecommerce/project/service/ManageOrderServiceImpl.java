package com.livecommerce.project.service;
/**
 * @author 김민석
 * @since 2023.01.22
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.22       김민석                   주문관리자페이지 생성 주문관리
 * 2023.01.30       김민석                   회원등급 기능 추가
*/
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
	@Override
	public int orderCancelReturnPoint(String oid, String mid) {
		return manageOrdermapper.orderCancelReturnPoint(oid, mid);
	}
}
