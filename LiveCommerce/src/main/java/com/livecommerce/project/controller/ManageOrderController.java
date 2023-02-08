package com.livecommerce.project.controller;
/**
 * @author 김민석
 * @since 2023.01.27
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.27    김민석              관리자 판매내역관리
 * </pre>
 */
import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;

import com.livecommerce.project.service.ManageOrderService;
import com.livecommerce.project.service.OrderService;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.OrderVO;
import com.livecommerce.project.vo.PageDTO;

@Controller
public class ManageOrderController {
	@Autowired
	ManageOrderService ManageOrderService;
	@Autowired
	OrderService orderService;
	
	/* 주문 현황 페이지 */
	@GetMapping("/manage/orderList")
	public String orderListGET(Criteria cri, Model model) {
		List<OrderVO> list = ManageOrderService.getOrderList(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, ManageOrderService.getOrderTotal(cri)));
		
		return "/manage/manage_order";
	}
	
	//주문취소
	@PostMapping("/manage/ordercancel")
	public String orderCancel(OrderVO ov, Principal principal) {
		System.out.println("테스트" + ov.getImp_uid());
		orderService.OrderCancel(ov.getImp_uid());
		ManageOrderService.ordercancelState(ov.getOstate(), ov.getOid());
		ManageOrderService.orderCancelReturnPoint(ov.getOid(), principal.getName());
		return "redirect:/manage/orderList";
	}

}
