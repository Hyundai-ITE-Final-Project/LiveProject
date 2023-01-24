package com.livecommerce.project.service;
/**
 * @author 김민석
 * @since 2023.01.23
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.23    김민석                최초 생성
*/
import java.util.List;
/**
 * @author 김민석
 * @since 2023.01.24
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.24    김민석                최초 생성
*/
import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.CouponListVO;
import com.livecommerce.project.vo.CouponVO;

public interface CouponService {
	/* 쿠폰 추가 */
	public int addCoupon(CouponVO coupon) throws Exception;
	/* 쿠폰리스트 추가 */
	public int addCouponList(CouponListVO couponList) throws Exception;
	/* 쿠폰 정보 리스트 */
	public List<CouponVO> getCouponList(String member_mid);
	/* 쿠폰사용유무 */
	public int modifyCoupon(String cname); 

}
