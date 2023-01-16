package com.livecommerce.project.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.mapper.CartMapper;
import com.livecommerce.project.mapper.CartMapperTests;
import com.livecommerce.project.vo.CartVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class CartServiceTests {
	@Autowired
	private CartService cartService;
	
	//장바구니 등록테스트
	@Test
	public void addCartTest() {
		//given
			String member_mid = "admin";
			int product_pid = 22;
			int p_quantity = 5;
			
			CartVO vo = new CartVO(); 
			vo.setMember_mid(member_mid);
			vo.setProduct_pid(product_pid);
			vo.setP_quantity(p_quantity);
		
		//when
			int result = cartService.addCart(vo);
		
		//then
			System.out.println("** result : " + result);
	}
}
