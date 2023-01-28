package com.livecommerce.project.vo;
/**
 * @author 김민석
 * @since 2023.01.15
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.15    김민석                최초 생성
*/
import java.util.Date;
import java.util.List;

import lombok.Data;

@Data
public class OrderVO {
	/* 주문 번호 */
	private String oid;
	
	/* 배송 받는이 */
	private String orderer;
	
	/* 주문 회원 아이디 */
	private String member_mid;
	
	/* 우편번호 */
	private String ozipcode;
	
	/* 회원 주소 */
	private String oaddress1;
	
	/* 회원 상세주소 */
	private String oaddress2;
	
	/* 주문 상태 */
	private String ostate;
	
	/* 주문 상품 */
	private List<OrderListVO> orders;	
	
	/* 사용 포인트 */
	private int usePoint;
	
	/* 주문 날짜 */
	private Date odate;
	
	/* DB테이블 존재 하지 않는 데이터 */
	/*oid 상품갯수*/
	private int count;
	/* 판매가(모든 상품 비용) */
	private int ordersaleprice;
	
	/* 적립 포인트 */
	private int ordersavepoint;
	
	/* 최종 판매 비용 */
	private int orderfinalsaleprice;
	
	// 주문한 imp_uid 
	private String imp_uid;
	
	// 주문한 상품 첫번째 이미지 
	private String img1;
	
	// 주문한 상품 이름 
	private String pname;
	
	// 주문한 상품 가격 
	private int olprice;
	
	// 주문한 상품 수량
	private int olquantity;
	
	
	public void getOrderPriceInfo() {
		/* 상품 비용 & 적립포인트 */
			for(OrderListVO order : orders) {
				ordersaleprice += order.getTotalprice();
				ordersavepoint += order.getTotalsavepoint();
			}
		/* 최종 비용(상품 비용 + 배송비 - 사용 포인트) */
			this.orderfinalsaleprice = ordersaleprice - usePoint;
	}
}
