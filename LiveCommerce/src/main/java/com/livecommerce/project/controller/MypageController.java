package com.livecommerce.project.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.livecommerce.project.service.MypageService;
import com.livecommerce.project.service.OrderService;
import com.livecommerce.project.vo.OrderVO;

import lombok.extern.log4j.Log4j;


//

@Log4j
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
//		List<OrderVO> list = mypageService.getOrderList(principal.getName());
//		model.addAttribute("list", list);
		
		String member_mid = principal.getName();
		List<List<OrderVO>> list3 = new ArrayList<>();
		List<String> list = mypageService.getOid(member_mid);
		log.info("list 출력 " + list);
		model.addAttribute("listOid", list);
		for(int i=0; i<list.size(); i++) {
			String oid1 = list.get(i);
			log.info(oid1);
			List<OrderVO> list2 = mypageService.getOidorderList(oid1, member_mid);
			list3.add(list2);
			log.info(i + "번째 리스트 : " + list2);
			log.info(" 주문번호 : " + oid1);
		}
		log.info("list3 출력 " + list3);
		model.addAttribute("list3", list3);
		return "/mypage/mypage_orderlist";
	}
	//주문취소
	@PostMapping("/mypage/ordercancel")
	public String orderCancel(OrderVO ov, Principal principal) {
		System.out.println("테스트" + ov.getImp_uid());
		orderService.OrderCancel(ov.getImp_uid());
		mypageService.ordercancelState(ov.getOstate(), ov.getOid());
		mypageService.orderCancelReturnPoint(ov.getOid(), principal.getName());
		return "redirect:/mypage/orderList";
	}
	
	@PostMapping("/mypage/orderdetail")
	public String orderDetail(OrderVO ov, Principal principal, Model model) {
		System.out.println(ov.getOid());
		List<OrderVO> orderDetail = mypageService.getOrderDetail(ov.getOid(), principal.getName());
		model.addAttribute("orderdetail", orderDetail);
		for(int i=0; i<orderDetail.size(); i++) {
			System.out.println(orderDetail.get(i).getSavepoint());
		}
		return "/mypage/orderdetail";
	}
}
