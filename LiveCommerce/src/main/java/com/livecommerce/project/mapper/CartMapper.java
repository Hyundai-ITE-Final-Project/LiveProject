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
import java.util.List;

import com.livecommerce.project.vo.CartVO;

public interface CartMapper {
	/* 카트 추가 */
	public int addCart(CartVO cart) throws Exception;
	
	/* 카트 삭제 */
	public int deleteCart(int cart_id);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartVO cart);
	
	/* 카트 목록 */
	public List<CartVO> getCart(String member_mid);	
	
	/* 카트 확인 */
	public CartVO checkCart(CartVO cart);
	
	/* 카트 제거(주문) */
	public int deleteOrderCart(CartVO cart);
}
