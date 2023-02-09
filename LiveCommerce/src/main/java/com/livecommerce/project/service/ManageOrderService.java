package com.livecommerce.project.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.OrderVO;

public interface ManageOrderService {
	/* 주문 상품 리스트 */
	public List<OrderVO> getOrderList(Criteria cri);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
	/* 주문 취소 후 상태변경 */
	public int ordercancelState(String ostate, String oid);
	/* 주문취소시 포인트회수 */
	public int orderCancelReturnPoint(@Param("oid") String oid, @Param("mid") String mid);
}
