package com.livecommerce.project.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class ProductPostVO {
	//멤버아이디
	private String mid;
	//인덱스
	private int ps_index;
	//타이틀
	private String ps_title;
	//가격
	private int ps_price;
	//상태
	private String ps_post_status;
	//등록일
	@DateTimeFormat(pattern = "yyyy-mm-dd")
	private Date ps_date;
	//삭제여부
	private int ps_delete;
	
	// 상품목록
	private List<ProductPostAddVO> ProductPostAddVO;
	
	@Data
	public static class ProductPostAddVO{
		private int ps_index;
		private int pid;
		private String img1;
	}
}
