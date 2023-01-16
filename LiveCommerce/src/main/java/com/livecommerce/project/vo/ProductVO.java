package com.livecommerce.project.vo;
/**
 * @author 김나형
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 230116		박소은		테이블 변경 (재고, 상태, regdate)
*/

import java.util.Date;

import lombok.Data;

@Data
public class ProductVO {
	//상품아이디
	private long pid;
	//상품이름
	private String pname;
	//상품가격
	private int price;
	//상품상세
	private String detail;
	//상품원산지
	private String origin;
	//상품포장
	private String packing;
	//상품이미지
	private String img1;
	private String img2;
	private String img3;
	//상품카테고리
	private String lcategory;
	private String scategory;
	
	// 박소은 작성
	// 상품재고량
	private int pstock;
	
	// 상품 상태
	private int pstatus;
	
	// 상품 등록일
	private Date pregdate;
	
	
}
