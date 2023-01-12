package com.livecommerce.project.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;

import com.livecommerce.project.service.MemberService;
import com.livecommerce.project.service.OrderService;
import com.livecommerce.project.vo.MemberVO;
import com.livecommerce.project.vo.OrderPageVO;



@Controller
public class OrderController {
	
	@Autowired
	private OrderService orderService;
	@Autowired
	private MemberService memberService;

	@GetMapping("/order/{mid}")
	public String orderPgaeGET(@PathVariable("mid") String mid, OrderPageVO opv, Model model) {
		
		model.addAttribute("orderList", orderService.getGoodsInfo(opv.getOrders()));
		model.addAttribute("memberInfo", memberService.getMemberInfo(mid));
		
		return "/order";
	}	
	
//	@PostMapping("/order")
//	public String orderPagePost(OrderVO ov, HttpServletRequest request) {
//		
//		System.out.println(ov);		
//		
//		orderService.order(ov);
//		
//		MemberVO member = new MemberVO();
//		member.setMemberId(ov.getMemberId());
//		
//		HttpSession session = request.getSession();
//		
//		try {
//			MemberVO memberLogin = memberService.memberLogin(member);
//			memberLogin.setMemberPw("");
//			session.setAttribute("member", memberLogin);
//			
//		} catch (Exception e) {
//			
//			e.printStackTrace();
//		}
//		
//		return "redirect:/main";
//	}	
	
}
