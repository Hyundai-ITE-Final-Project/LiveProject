package com.livecommerce.project.service;
/**
 * @author 김민석
 * @since 2023.01.15
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.17       김민석                   최초 생성(장바구니)
*/
import java.util.List;

import com.livecommerce.project.vo.CartVO;

public interface CartService {
	/* 장바구니 추가 */
	public int addCart(CartVO cart);
	/* 장바구니 정보 리스트 */
	public List<CartVO> getCartList(String member_mid);
	/* 카트 수량 수정 */
	public int modifyCount(CartVO cart);
	/* 카트 삭제 */
	public int deleteCart(int cart_id);
}
