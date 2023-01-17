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
import java.util.ArrayList;
import java.util.List;

/* 
 * 작성자 : 김민석
 * 작성일 : 2023.01.16.월
 * OrderMapperTests : OrderMapper.xml test 자바소스
 */

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.CartVO;
import com.livecommerce.project.vo.MemberVO;
import com.livecommerce.project.vo.OrderListVO;
import com.livecommerce.project.vo.OrderVO;
import com.livecommerce.project.vo.ProductVO;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
public class OrderMapperTests {

	@Autowired
	private OrderMapper mapper;			
	@Autowired
	private CartMapper cartMapper;			
	
	// 상품 정보(주문 처리) 
	@Test
	public void getOrderInfoTest() {
		
		 OrderListVO orderInfo = mapper.getOrderInfo(61);
		 System.out.println("result : " + orderInfo);
	}
	
	// vam_order 테이블 등록 
	@Test
	public void enrollOrderTest() {
		
		OrderVO ord = new OrderVO();
		List<OrderListVO> orders = new ArrayList<OrderListVO>();
		
		OrderListVO order1 = new OrderListVO();
		
		order1.setPid(61);
		order1.setOlquantity(5);
		order1.setOlprice(70000);
		order1.initSaleTotal();
		
		
		
		ord.setOrders(orders);
		
		ord.setOid("2021_test1");
		ord.setOrderer("test");
		ord.setMember_mid("gd");
		ord.setOzipcode("test");
		ord.setOaddress1("test1");
		ord.setOaddress2("test2");
		ord.setOstate("배송중비");
		ord.getOrderPriceInfo();
		ord.setUsePoint(1000);
		
		mapper.enrollOrder(ord);		
		
	}
	
	// vam_itemorder 테이블 등록 
	@Test
	public void enrollOrderItemTest() {
		
		OrderListVO oid = new OrderListVO();
		
		oid.setOid("2021_test1");
		oid.setPid(61);
		oid.setOlquantity(1);
		oid.setOlprice(70000);
				
		oid.initSaleTotal();
		
		mapper.enrollOrderList(oid);
		
	}	
	
	// 회원 돈, 포인트 정보 변경 
	@Test
	public void deductPointTest() {
		
		MemberVO member = new MemberVO();
		
		member.setMid("gd");
		member.setMpoint(1000);
		
		mapper.deductPoint(member);
	}
	
	// 상품 재고 변경 
	@Test
	public void deductStockTest() {
		ProductVO product = new ProductVO();
		
		product.setPid(61);
		product.setPstock(77);
		
		mapper.deductStock(product);
	}
	
	// 장바구니 제거(주문 처리) 
	@Test
	public void deleteOrderCart() {
		String member_mid = "gd";
		int product_pid = 4;
		
		CartVO vo = new CartVO();
		vo.setMember_mid(member_mid);
		vo.setProduct_pid(product_pid);
		
		cartMapper.deleteOrderCart(vo);
		
	}
}
