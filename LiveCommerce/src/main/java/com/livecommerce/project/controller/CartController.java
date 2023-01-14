package com.livecommerce.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.livecommerce.project.service.CartService;
import com.livecommerce.project.vo.CartVO;

@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCartPost(CartVO cart, HttpServletRequest request) {
		//화면을 반환하는 것이 아니라 데이터를 바로 반환하기 때문에 @ResponseBody를 추가
		//ResponseBody를 사용할 것이라서 반환타입 String\
		
//		// 로그인 체크
//		HttpSession session = request.getSession();
//		MemberVO mvo = (MemberVO)session.getAttribute("member");
//		if(mvo == null) {
//			return "5";
//		}
		// 카트 등록
		
		int result = cartService.addCart(cart);
				
		return result + "";	//addCart 반환타입이 int여서 빈 문자열을 더함
	}
	
	//장바구니 리스트 
	@GetMapping("/cart/{member_mid}")
	public String cartPageGET(@PathVariable("member_mid") String member_mid, Model model) {
		
		model.addAttribute("cartInfo", cartService.getCartList(member_mid));
		
		return "/cart";
	}
	
	// 장바구니 수량 수정 
	@PostMapping("/cart/update")
	public String updateCartPOST(CartVO cart) {
		
		cartService.modifyCount(cart);
		
		return "redirect:/cart/" + cart.getMember_mid();
		
	}
	
	//장바구니 삭제
	@PostMapping("cart/delete")
	public String deleteCartPOST(CartVO cart) {
		cartService.deleteCart(cart.getCart_id());
		
		return "redirect:/cart/" + cart.getMember_mid();
	}
	
}
