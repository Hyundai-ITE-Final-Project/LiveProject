package com.livecommerce.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.OrderVO;

public interface MypageMapper {
	/* 주문 상품 리스트 */
	public List<OrderVO> getOrderList(@Param("member_mid") String member_mid);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
	/* 주문 취소 후 상태변경 */
	public int ordercancelState(@Param("ostate") String ostate, @Param("oid") String oid);
}