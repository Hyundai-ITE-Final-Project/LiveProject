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
import java.util.*;
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
    private String img1; // 상품 이미지 
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
    	this.saleprice = price;
		this.totalprice = this.saleprice*this.pcount;
		this.totalpoint = (int)(Math.floor(this.totalprice*0.01));
	}
}
