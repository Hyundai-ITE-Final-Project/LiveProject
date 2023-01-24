package com.livecommerce.project.service;
import java.util.List;

/**
 * @author 김민석
 * @since 2023.01.23
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.23    김민석                최초 생성
*/
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.CouponMapper;
import com.livecommerce.project.vo.CouponListVO;
import com.livecommerce.project.vo.CouponVO;
/**
 * @author 김민석
 * @since 2023.01.24
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.24    김민석                최초 생성
*/
@Service
public class CouponServiceImpl implements CouponService{
	@Autowired
	private CouponMapper couponMapper;

	@Override
	public int addCoupon(CouponVO coupon) throws Exception {
		CouponVO checkCoupon = couponMapper.checkCoupon(coupon);
		//뷰는 숫자를 반환받도록 한다. (0 : 등록 실패 / 1 : 등록 성공 / 2 : 등록된 데이터 존재 )
		// 쿠폰 데이터 체크
		if(checkCoupon != null) {
			return 2;
		}
		
		// 쿠폰 등록 & 에러 시 0반환
		try {
			return couponMapper.addCoupon(coupon);
		} catch (Exception e) {
			return 0;
		}
		
	}
	//쿠폰리스트 추가
	@Override
	public int addCouponList(CouponListVO couponList) throws Exception {
		return couponMapper.addCouponList(couponList);
	}
	//쿠폰목록 가져오기
	@Override
	public List<CouponVO> getCouponList(String member_mid) {
		return couponMapper.getCouponList(member_mid);
	}
	//쿠폰사용유무 cstate변경
	@Override
	public int modifyCoupon(String cname) {
		return couponMapper.modifyCoupon(cname);
	}

	
	
	
}
