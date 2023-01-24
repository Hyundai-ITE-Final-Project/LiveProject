package com.livecommerce.project.controller;
/**
 * @author 김민석
 * @since 2023.01.15
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.15    김민석                최초 생성
*/
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.json.JSONArray;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.livecommerce.project.service.CouponService;
import com.livecommerce.project.service.MemberService;
import com.livecommerce.project.service.OrderService;
import com.livecommerce.project.vo.CouponVO;
import com.livecommerce.project.vo.MemberVO;
import com.livecommerce.project.vo.OrderPageVO;
import com.livecommerce.project.vo.OrderVO;



@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;
	@Autowired
	private CouponService couponService;
	
	//주문페이지 불러오기
	@GetMapping("/order/{mid}")
	public String orderPgaeGET(@PathVariable("mid") String mid, OrderPageVO opv, Model model) {
		
		model.addAttribute("list", orderService.getGoodsInfo(opv.getOrders())); 
		model.addAttribute("orderList", orderService.getGoodsInfo(opv.getOrders()));
		model.addAttribute("memberInfo", memberService.getMemberInfo(mid));
		model.addAttribute("couponList", couponService.getCouponList(mid));
		return "/order";
	}	
	
	//주문하기
	@PostMapping("/order")
	public String orderPagePost(OrderVO ov, CouponVO coupon, HttpServletRequest request) {
		
		System.out.println(ov);		
		//주문하기
		orderService.order(ov);
		System.out.println(coupon.getCname());
		//사용한 쿠폰이 있으면 쿠폰유무상태 업데이트
		if(coupon.getCname() != null) couponService.modifyCoupon(coupon.getCname());
		
		MemberVO member = new MemberVO();
		member.setMid(ov.getMember_mid());
		
	    return "redirect:/home";
		
	}
	
	
	
}
