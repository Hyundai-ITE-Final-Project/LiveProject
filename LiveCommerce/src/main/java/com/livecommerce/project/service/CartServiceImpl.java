package com.livecommerce.project.service;
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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.CartMapper;
import com.livecommerce.project.vo.CartVO;

@Service
public class CartServiceImpl implements CartService{

	@Autowired
	private CartMapper cartMapper;
	@Override
	public int addCart(CartVO cart) {
		CartVO checkCart = cartMapper.checkCart(cart);
		//뷰는 숫자를 반환받도록 한다. (0 : 등록 실패 / 1 : 등록 성공 / 2 : 등록된 데이터 존재 / 5 : 로그인 필요)
		// 장바구니 데이터 체크
		if(checkCart != null) {
			return 2;
		}
		// 장바구니 등록 & 에러 시 0반환
		try {
			return cartMapper.addCart(cart);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			return 0;
		}
	}
	@Override
	public List<CartVO> getCartList(String member_mid) {
		List<CartVO> cart = cartMapper.getCart(member_mid);
		
		for(CartVO vo : cart) {
			//vo객체마다 상품판매가격, 총 상품가격, 총 포인트 값 할당
			vo.initSaleTotal();
		}
		
		return cart;
	}
	@Override
	public int modifyCount(CartVO cart) {
		return cartMapper.modifyCount(cart);
	}
	@Override
	public int deleteCart(int cart_id) {
		return cartMapper.deleteCart(cart_id);
	}

}
