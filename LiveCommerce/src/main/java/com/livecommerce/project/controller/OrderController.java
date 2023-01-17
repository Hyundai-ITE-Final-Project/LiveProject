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
import com.livecommerce.project.vo.OrderVO;



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
	
	@PostMapping("/order")
	public void orderPagePost(OrderVO ov, HttpServletRequest request) {
		
		System.out.println(ov);		
		
		orderService.order(ov);
		
		MemberVO member = new MemberVO();
		member.setMid(ov.getMember_mid());
		
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
		
	}	
	
}
