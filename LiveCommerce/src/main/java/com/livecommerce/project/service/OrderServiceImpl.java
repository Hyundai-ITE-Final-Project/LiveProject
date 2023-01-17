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
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.livecommerce.project.mapper.CartMapper;
import com.livecommerce.project.mapper.MemberMapper;
import com.livecommerce.project.mapper.OrderMapper;
import com.livecommerce.project.mapper.ProductMapper;
import com.livecommerce.project.vo.CartVO;
import com.livecommerce.project.vo.MemberVO;
import com.livecommerce.project.vo.OrderListVO;
import com.livecommerce.project.vo.OrderPageItemVO;
import com.livecommerce.project.vo.OrderVO;
import com.livecommerce.project.vo.ProductVO;

@Service
public class OrderServiceImpl implements OrderService{
	@Autowired
	private OrderMapper orderMapper;
	@Autowired
	private MemberMapper memberMapper;
	
	@Autowired
	private CartMapper cartMapper;
	
	@Autowired
	private ProductMapper productMapper;
	
	//본격적으로 주문페이지에 필요로 한 상품 정보를 만들어 내는 로직
	@Override
	public List<OrderPageItemVO> getGoodsInfo(List<OrderPageItemVO> orders) {
		List<OrderPageItemVO> result = new ArrayList<OrderPageItemVO>();		
		
		for(OrderPageItemVO ord : orders) {
			
			OrderPageItemVO goodsInfo = orderMapper.getGoodsInfo(ord.getPid());			

			goodsInfo.setPcount(ord.getPcount());	
			
			goodsInfo.initSaleTotal();			
			
			result.add(goodsInfo);			
		}		
		
		return result;
	}

	@Override
	@Transactional
	public void order(OrderVO ord) {

		/* 사용할 데이터가져오기 */
			/* 회원 정보 */
			MemberVO member = memberMapper.getMemberInfo(ord.getMember_mid());
			/* 주문 정보 */
			List<OrderListVO> ords = new ArrayList<>();
			for(OrderListVO oit : ord.getOrders()) {
				OrderListVO orderItem = orderMapper.getOrderInfo(oit.getPid());
				// 수량 셋팅
				orderItem.setOlquantity(oit.getOlquantity());
				// 기본정보 셋팅
				orderItem.initSaleTotal();
				//List객체 추가
				ords.add(orderItem);
				
			}
			/* OrderVO 셋팅 */
			ord.setOrders(ords);
			ord.getOrderPriceInfo();
		/*DB 주문,주문상품(,배송정보) 넣기*/
			
			/* oid만들기 및 OrderVO객체 oid에 저장 */
			Date date = new Date();
			SimpleDateFormat format = new SimpleDateFormat("_yyyyMMddmm");
			System.out.println(member.getMid());
			String orderId = member.getMid() + format.format(date);
			
			ord.setOid(orderId);
			
			/* db넣기 */
			orderMapper.enrollOrder(ord);		//주문테이블에 등록
			for(OrderListVO oit : ord.getOrders()) {   //주문리스트테이블에 등록
				oit.setOid(orderId);
				orderMapper.enrollOrderList(oit);			
			}

		/* 비용 포인트 변동 적용 */
			
//			// 비용 차감 & 변동 돈(money) Member객체 적용 
//			int calMoney = member.getMoney();
//			calMoney -= ord.getOrderFinalSalePrice();
//			member.setMoney(calMoney);
			
			/* 포인트 차감, 포인트 증가 & 변동 포인트(point) Member객체 적용 */
			int calPoint = member.getMpoint();
			calPoint = calPoint - ord.getUsePoint() + ord.getOrdersavepoint();	// 기존 포인트 - 사용 포인트 + 획득 포인트
			member.setMpoint(calPoint);
				
			/* 변동 돈, 포인트 DB 적용 */
			orderMapper.deductPoint(member);
			
		/* 재고 변동 적용 */
			for(OrderListVO oit : ord.getOrders()) {
				/* 변동 재고 값 구하기 */
				ProductVO product = productMapper.productGetDetail(oit.getPid());
				product.setPstock(product.getPstock() - oit.getOlquantity());
				/* 변동 값 DB 적용 */
				orderMapper.deductStock(product);
			}			
			
		/* 장바구니 제거 */
			for(OrderListVO oit : ord.getOrders()) {
				CartVO vo = new CartVO();
				vo.setMember_mid(ord.getMember_mid());
				vo.setProduct_pid(oit.getPid());
				
				cartMapper.deleteOrderCart(vo);
			}			

	}
}
