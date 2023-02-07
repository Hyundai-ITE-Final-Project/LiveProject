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
	public int modifyCoupon(String cname, String member_mid); 
	/* 선택한 쿠폰코드 가져오기 */
	public CouponVO getCcode(@Param("member_mid") String member_mid, 
			@Param("cname") String cname);
	//쿠폰사용시 주문번호 삽입
	public int UpdateCouponOid(String member_mid, String oid
			, String cname);
}
