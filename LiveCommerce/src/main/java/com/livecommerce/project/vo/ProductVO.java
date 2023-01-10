package com.livecommerce.project.vo;

import lombok.Data;

@Data
public class ProductVO {
	//상품아이디
	private int pid;
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
}
