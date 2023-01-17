package com.livecommerce.project.mapper;
/**
 * @author 김민석
 * @since 2023.01.15
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.15    김민석                최초 생성
*/
import com.livecommerce.project.vo.CartVO;
import com.livecommerce.project.vo.MemberVO;
import com.livecommerce.project.vo.OrderListVO;
import com.livecommerce.project.vo.OrderPageItemVO;
import com.livecommerce.project.vo.OrderVO;
import com.livecommerce.project.vo.ProductVO;

public interface OrderMapper {
	/* 주문 상품 정보 */	
	public OrderPageItemVO getGoodsInfo(int pid);
	/* 주문 상품 정보(주문 처리) */	//상품의 아이디, 가격,  가져와 주는 메서드
	public OrderListVO getOrderInfo(int pid);
	
	/* 주문 테이블 등록 */	//주문테이블에 데이터 등록
	public int enrollOrder(OrderVO ordervo);
	
	/* 주문 리스트 테이블 등록 */	//주문리스트테이블에 데이터 등록
	public int enrollOrderList(OrderListVO orderlistvo);
	/* 주문하고 포인트 차감 */
	public int deductPoint(MemberVO member);
	/* 주문 재고 차감 */
	public int deductStock(ProductVO product);
}
