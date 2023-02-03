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
	public List<OrderVO> getOrderList(String member_mid) {
		return mypageMapper.getOrderList(member_mid);
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

	/* 주문번호 가져오기 */
	@Override
	public List<String> getOid(String member_mid) {
		return mypageMapper.getOid(member_mid);
	}

	/* 주문현황페이지 */
	@Override
	public List<OrderVO> getOidorderList(String oid, String member_mid) {
		return mypageMapper.getOidorderList(oid, member_mid);
	}

	/* 주문취소시 적립된포인트회수 */
	@Override
	public int orderCancelReturnPoint(String oid, String mid) {
		return mypageMapper.orderCancelReturnPoint(oid, mid);
	}
	/* 주문상세페이지 */
	@Override
	public List<OrderVO> getOrderDetail(String oid, String mid) {
		return mypageMapper.getOrderDetail(oid, mid);
	}

}
