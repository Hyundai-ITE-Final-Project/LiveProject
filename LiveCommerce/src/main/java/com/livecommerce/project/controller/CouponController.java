package com.livecommerce.project.controller;
/**
 * @author 김민석
 * @since 2023.01.25
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.25       김민석                   쿠폰생성, 쿠폰발급유무체크, 쿠폰아키텍처생성 - 주문페이지, 결제 쿠폰적용 - 쿠폰적용시 쿠폰상태 변경
 * 2023.01.31       김민석                   라이브쿠폰UI, 이벤트쿠폰 발급긴으 추가, 이벤트쿠폰UI변경
 * 2023.02.07       김민석                   쿠폰이슈 해결
*/
import java.security.Principal;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.livecommerce.project.service.CouponService;
import com.livecommerce.project.vo.CouponListVO;
import com.livecommerce.project.vo.CouponVO;

@Controller
public class CouponController {
	
	@Autowired
	private CouponService couponService;
	
	//쿠폰페이지 이동
	@GetMapping("/coupon/couponpage")
	public String couponPageGet(Model model) {
		
		return "/coupon/coupon";
	}
	
	//이벤트쿠폰페이지 이동
		@GetMapping("/coupon/Eventcouponpage")
		public String EventcouponPageGet() {
			
			return "/coupon/event_coupon";
	}
	
	//쿠폰 발급
	@PostMapping("/coupon/add")
	@ResponseBody
	public String couponCreate(@RequestBody CouponVO cvo, HttpServletRequest request, Principal principal) throws Exception {

		cvo.setMember_mid(principal.getName());
		int result = couponService.addCoupon(cvo);
		if(result == 1) {
			CouponListVO couponList = new CouponListVO();
			couponList.setMember_mid(principal.getName());
			couponList.setCoupon_ccode(cvo.getCcode());
			couponService.addCouponList(couponList);
		}
		return result + "";
		//ccode가 db에 있으면 이미발급된 쿠폰입니다.
		
		//ccode가 db에 없으면 insert시켜주고 발급되었습니다.
	}
}
