package com.livecommerce.project.mapper;

import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.CartVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class CartMapperTests {
	@Autowired
	private CartMapper cartmapper;
	
	/* 장바구니 추가 */
	@Test
	public void addCart() throws Exception {
		//회원아이디
		String member_mid = "gd";
		//상품아이디
		int product_pid = 61;
		//상품수량
		int p_quantity = 2;
		
		CartVO cart = new CartVO();
		cart.setMember_mid(member_mid);
		cart.setProduct_pid(product_pid);
		cart.setP_quantity(p_quantity);
		
		int result = 0;
		result = cartmapper.addCart(cart);
		
		System.out.println("결과 : " + result);
	}	

	
	// 카트 삭제 

	@Test
	public void deleteCartTest() {
		int cart_id = 5;
		
		cartmapper.deleteCart(cart_id);

	}
	// 카트 수량 수정 

	@Test
	public void modifyCartTest() {
		int cart_id = 6;
		int p_quantity = 5;
		
		CartVO cart = new CartVO();
		cart.setCart_id(cart_id);
		cart.setP_quantity(p_quantity);
		
		cartmapper.modifyCount(cart);
	}

	
	// 카트 목록 

	@Test
	public void getCartTest() {
		String member_mid = "gd";
		
		
		List<CartVO> list = cartmapper.getCart(member_mid);
		for(CartVO cart : list) {
			System.out.println(cart);
			cart.initSaleTotal();
			System.out.println("init cart : " + cart);
		}
	}
			
	// 카트 확인 

	@Test
	public void checkCartTest() {
		
		String member_mid = "gd";
		int product_pid = 61;
		
		CartVO cart = new CartVO();
		cart.setMember_mid(member_mid);
		cart.setProduct_pid(product_pid);
		
		CartVO resutlCart = cartmapper.checkCart(cart);
		System.out.println("결과 : " + resutlCart);
	}
}
