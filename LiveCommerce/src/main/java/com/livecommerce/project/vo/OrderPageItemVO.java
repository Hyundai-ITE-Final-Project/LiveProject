package com.livecommerce.project.vo;

import java.time.LocalDate;

import lombok.Data;

@Data
//상세상품데이터를 담을 클래스
public class OrderPageItemVO {
	/* 뷰로부터 전달받을 값(상세상품에서 가져올 것) */
    private int pid;
    private int pcount;
    
    /* 상품DB로부터 꺼내올 값 */
    private String pname;
    private int price;
    
    //할인률
    //private double pdiscount = 0.01;
    
    /* 만들어 낼 값(주문페이지로 보내는 데이터) */
    //상품가격
    private int saleprice;
    //총가격
    private int totalprice;
    //총포인트
    private int totalpoint;
    
    public void initSaleTotal() {
		this.totalprice = this.saleprice*this.pcount;
		this.totalpoint = (int)(Math.floor(this.totalprice*0.01));
	}
    
//    @Override
//	public String toString() {
//		return "OrderPageItemDTO [pid=" + pid + ", pcount=" + pcount + ", pname=" + pname
//				+ ", price=" + price + ", saleprice=" + saleprice
//				+ ", totalprice=" + totalprice + ", totalpoint=" + totalpoint + "]";
//	}
}
