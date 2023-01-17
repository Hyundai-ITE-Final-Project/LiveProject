package com.livecommerce.project.vo;

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
	
	/* 판매가(모든 상품 비용) */
	private int ordersaleprice;
	
	/* 적립 포인트 */
	private int ordersavepoint;
	
	/* 최종 판매 비용 */
	private int orderfinalsaleprice;
	
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
