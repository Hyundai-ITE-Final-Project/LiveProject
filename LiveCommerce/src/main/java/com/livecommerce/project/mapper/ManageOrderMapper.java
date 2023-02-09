package com.livecommerce.project.mapper;
/**
 * @author 김민석
 * @since 2023.01.15
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.15       김민석                   최초 생성
 * 2023.01.22       김민석                   주문취소시 포인트회수
*/
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.OrderVO;

public interface ManageOrderMapper {
	/* 주문 상품 리스트 */
	public List<OrderVO> getOrderList(Criteria cri);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
	/* 주문 취소 후 상태변경 */
	public int ordercancelState(@Param("ostate") String ostate, @Param("oid") String oid);
	/* 주문취소시 포인트 회수 */
	public int orderCancelReturnPoint(@Param("oid") String oid, @Param("mid") String mid);
}
