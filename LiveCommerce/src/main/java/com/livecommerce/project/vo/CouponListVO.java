package com.livecommerce.project.vo;
/**
 * @author 김민석
 * @since 2023.01.23
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.23    김민석                최초 생성
*/

import java.util.Date;

import lombok.Data;

@Data
public class CouponListVO {

	//쿠폰리스트 넘버
	private int clid;
	//멤버id
    private String member_mid;
    //쿠폰시작날짜
	private String coupon_ccode;
	//쿠폰등록날짜
	private Date my_cregdate;
}
