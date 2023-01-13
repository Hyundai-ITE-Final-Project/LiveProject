package com.livecommerce.project.mapper;

import java.util.List;

import com.livecommerce.project.vo.CartVO;

public interface CartMapper {
	/* 카트 추가 */
	public int addCart(CartVO cart);
	
	/* 카트 삭제 */
	public int deleteCart(int cartId);
	
	/* 카트 수량 수정 */
	public int modifyCount(CartVO cart);
	
	/* 카트 목록 */
	public List<CartVO> getCart(String memberId);	
	
	/* 카트 확인 */
	public CartVO checkCart(CartVO cart);
}
