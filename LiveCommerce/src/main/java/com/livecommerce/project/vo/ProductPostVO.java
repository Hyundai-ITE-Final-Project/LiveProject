package com.livecommerce.project.vo;

import java.util.Date;
import java.util.List;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;
/**
 * @author 김나형
 * @since 2023.01.16
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.16		김나형		최초생성
 * </pre>
 */ 
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
	//레시피
	private String recipe;
	//상품리스트
	private List<Integer> productlist;
}
