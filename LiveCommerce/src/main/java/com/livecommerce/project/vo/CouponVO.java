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

/**
 * @author 김민석
 * @since 2023.01.23
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.23    김민석                최초 생성
*/
import lombok.Data;

@Data
public class CouponVO {
	//쿠폰코드
	private String ccode;
	//쿠폰이름
    private String cname;
    //쿠폰가격
    private int cprice;
    //쿠폰시작날짜
	private Date cstartdate;
	//쿠폰끝나는날짜
	private Date cenddate;
}
