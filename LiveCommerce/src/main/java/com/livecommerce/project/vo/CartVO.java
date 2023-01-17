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
import lombok.Data;

@Data
public class CartVO {
		//장바구니아이디
		private int cart_id;
		//멤버아이디
	    private String member_mid;
	    //상품아이디
	    private int product_pid;
	    
	    //상품수량
	    private int p_quantity;

	    
	    //cart 테이블과 조인을 하여 이 3개의 변수의 값을 장바구니 페이지에 뿌려주기 위해 추가
	    //상품이름
	    private String pname;
	    //상품가격
	    private int price;
	    //상품이미지
	    private String img1;
	    
	    
	    //장바구니에서 주문페이지로 넘겨줄 값들
	    //상품판매가격
	    private int saleprice;
	    //총 상품가격
	    private int totalprice;
	    //총 포인트
	    private int totalpoint;
	    
	    public void initSaleTotal() {
			this.saleprice = price;
			this.totalprice = this.saleprice*this.p_quantity;
			this.totalpoint = (int)(Math.floor(this.totalprice *0.01)); 
		}
}
