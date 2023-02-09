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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.livecommerce.project.service.CartService;
import com.livecommerce.project.vo.CartListVO;
import com.livecommerce.project.vo.CartVO;
/**
 * @author 김민석
 * @since 2023.01.17
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------      --------    ---------------------------
 * 2023.01.17          김민석               장바구니 컨트롤러 최초생성
 * 2023.01.29          김민석               장바구니,구매하기 버튼연결 CartListVO추가, cart.jsp 버그수정
 * 2023.02.06          김민석               cart배송지 제거 네이버로그_장바구니 이슈해결
 * </pre>
 */
@Controller
public class CartController {

	@Autowired
	private CartService cartService;
	
	@PostMapping("/cart/add")
	@ResponseBody
	public String addCartPost(CartVO cart, HttpServletRequest request, Principal prin) {
		//화면을 반환하는 것이 아니라 데이터를 바로 반환하기 때문에 @ResponseBody를 추가
		//ResponseBody를 사용할 것이라서 반환타입 String\
		
		// 카트 등록
		CartVO a = cart;
		a.setMember_mid(prin.getName());
		int result = cartService.addCart(a);
				
		return result + "";	//addCart 반환타입이 int여서 빈 문자열을 더함
	}
	//장바구니 추가
	@GetMapping("cart/add2")
	public String addCartList(CartListVO clv, Principal prin) {
		List<CartVO> list = clv.getCarts();
		for(CartVO cart : list) cartService.addCart(cart);
		
		return "redirect:/cart/" + prin.getName();
	}
	
	//장바구니 페이지 이동 
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
