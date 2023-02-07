package com.livecommerce.project.controller;
import java.security.Principal;
import java.util.List;

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
import com.livecommerce.project.service.MypageService;
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
	@Autowired
	private MypageService mypageService;
	
	//주문페이지 불러오기
	@GetMapping("/order/{mid}")
	public String orderPgaeGET(@PathVariable("mid") String mid, OrderPageVO opv, Model model) {
		
		model.addAttribute("list", orderService.getGoodsInfo(opv.getOrders())); 
		model.addAttribute("orderList", orderService.getGoodsInfo(opv.getOrders()));
		model.addAttribute("memberInfo", memberService.getMemberInfo(mid));
		model.addAttribute("couponList", couponService.getCouponList(mid));
		return "/order/order";
	}	
	
	//주문하기
	@PostMapping("/order")
	public String orderPagePost(OrderVO ov, CouponVO coupon, HttpServletRequest request, Principal principal, Model model) {
		
		System.out.println(ov);		
		//주문하기
		orderService.order(ov);
		
		
		System.out.println("가지고 있는 쿠폰 이름이 뭐임??" + coupon.getCname());
		//사용한 쿠폰이 있으면 쿠폰유무상태 업데이트


			if(coupon.getCname().equals("2000원쿠폰")) {
				couponService.modifyCoupon(coupon.getCname(), principal.getName());
//			//쿠폰을 사용했으니깐 oid값을 삽입
			couponService.UpdateCouponOid(principal.getName(), ov.getOid()
					, coupon.getCname());
			//주문상세
			List<OrderVO> orderDetail = mypageService.getOrderDetail(ov.getOid(), principal.getName());
			model.addAttribute("orderdetail", orderDetail);
			
			//주문상세_쿠폰
			CouponVO cvo = couponService.getCcode(principal.getName(), coupon.getCname());
			model.addAttribute("couponvo", cvo);
			
			 return "/order/order_complete";		
			}
			
			if(coupon.getCname().equals("1000원쿠폰")) {
				couponService.modifyCoupon(coupon.getCname(), principal.getName());
//			//쿠폰을 사용했으니깐 oid값을 삽입
			couponService.UpdateCouponOid(principal.getName(), ov.getOid()
					, coupon.getCname());
			//주문상세
			List<OrderVO> orderDetail = mypageService.getOrderDetail(ov.getOid(), principal.getName());
			model.addAttribute("orderdetail", orderDetail);
			
			//주문상세_쿠폰
			CouponVO cvo = couponService.getCcode(principal.getName(), coupon.getCname());
			model.addAttribute("couponvo", cvo);
			
			 return "/order/order_complete";		
			}
	
			
			else {
				List<OrderVO> orderDetail = mypageService.NoCouponOrderDetail(ov.getOid(), principal.getName());

				model.addAttribute("orderdetail", orderDetail);
				System.out.println("주문디테일 넘어오나?" + orderDetail);
				
				return "/order/order_complete";
			}

	}

}
