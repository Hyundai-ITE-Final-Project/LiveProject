package com.livecommerce.project.service;
/**
 * @author 김민석
 * @since 2023.01.15
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.20       김민석                   마이페이지 최초생성
 * 
*/
import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.OrderVO;

public interface MypageService {
	/* 주문 상품 리스트 */
	public List<OrderVO> getOrderList(String member_mid);
	
	/* 주문 총 갯수 */
	public int getOrderTotal(Criteria cri);
	/* 주문 취소 후 상태변경 */
	public int ordercancelState(String ostate, String oid);
	/*-- 멤버아이디별 중복처리한 oid값들 */
	public List<String> getOid(String member_mid);
	//전체주문목록
	public List<OrderVO> getOidorderList(@Param("oid") String oid, @Param("member_mid") String member_mid);

	/* 주문취소시 포인트회수 */
	public int orderCancelReturnPoint(@Param("oid") String oid, @Param("mid") String mid);
	
	/* 주문상세페이지 */
	public List<OrderVO> getOrderDetail(@Param("oid") String oid, @Param("mid") String mid);
	
	/* 쿠폰사용하지않는_주문상세페이지 */
	public List<OrderVO> NoCouponOrderDetail(@Param("oid") String oid, @Param("mid") String mid);
}
