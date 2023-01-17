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
public class OrderListVO {
	/* orderlist 기본키 */
    private int olid;
	/* 주문 번호 */
	private String oid;
	
	/* 상품 번호 */
    private int pid;
    
	/* 주문 수량 */
    private int olquantity;
 
	/* 상품 한 개 가격 */
    private int olprice;
    
	/* 상품 한개 구매 시 획득 포인트 */
    private int savepoint;
    
    
	/* DB테이블 존재 하지 않는 데이터 */
	/* 할인 적용된 가격 */
    private int saleprice;
    
	/* 총 가격(할인 적용된 가격 * 주문 수량) */
    private int totalprice;
    
	/* 총 획득 포인트(상품 한개 구매 시 획득 포인트 * 수량) */
    private int totalsavepoint;
    
    public void initSaleTotal() {
		this.saleprice = olprice;
		this.totalprice = this.saleprice * this.olquantity;
		this.savepoint = (int)(Math.floor(this.saleprice*0.01));
		this.totalsavepoint =this.savepoint * this.olquantity;
	}
}
