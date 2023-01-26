package com.livecommerce.project.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.livecommerce.project.service.MypageService;
import com.livecommerce.project.service.OrderService;
import com.livecommerce.project.vo.OrderVO;


//

@Controller
public class MypageController {
	@Autowired
	MypageService mypageService;
	@Autowired
	OrderService orderService;
	
	
	@GetMapping("/mypage/main")
	public String mypage() {
		return "/mypage/main";
	}
	
	//구현부에는 주문 페이지에서 출력시켜야 할 주문 정보와 페이지 번호 버튼을 만드는데 
	//필요로 한 페이지 정보를 뷰로 전달하는 코드를 작성합니다.
	/* 주문 현황 페이지 */
	@GetMapping("/mypage/orderList")
	public String orderListGET(Principal principal, Model model) {
		List<OrderVO> list = mypageService.getOrderList(principal.getName());
		model.addAttribute("list", list);

		return "/mypage/mypage_orderlist";
	}
	//주문취소
	@PostMapping("/mypage/ordercancel")
	public String orderCancel(OrderVO ov) {
		System.out.println("테스트" + ov.getImp_uid());
		orderService.OrderCancel(ov.getImp_uid());
		mypageService.ordercancelState(ov.getOstate(), ov.getOid());
		return "redirect:/mypage/orderList";
	}
}
