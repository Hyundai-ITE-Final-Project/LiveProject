package com.livecommerce.project.controller;
/**
 * @author 박소은
 * @since 2023.01.16
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.16		박소은		최초생성
2023.01.29		박소은		스트리밍 키 
2023.01.30      김민석          회원등급 기능 추가
 * </pre>
 */

import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.livecommerce.project.service.MemberService;
import com.livecommerce.project.service.ProductService;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.MemberVO;
import com.livecommerce.project.vo.OrderVO;
import com.livecommerce.project.vo.PageDTO;
import com.livecommerce.project.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/manage/*")
@AllArgsConstructor
public class ManageController {

	private final ProductService service;
	private final MemberService memberService;

//	@GetMapping("/products")
//	public void products(Criteria cri, Model model) {
//		
//		log.info("products: " + cri);
//		model.addAttribute("products", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
//		
////		model.addAttribute("products", service.getProductList());
//	}

	// 전체 개수를 토대로 페이징 처리 + 상품 전체 목록 띄우기
	@GetMapping("/products")
	public void products(Criteria cri, Model model) {

		log.info("products: " + cri);
		int total = service.getTotal(cri);
		model.addAttribute("products", service.getProductList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}

	@GetMapping("/registerProduct")
	public void registerProduct() {

	}

	@PostMapping("/registerProduct")
	public String registerProduct(ProductVO product, RedirectAttributes rttr) {

		log.info("registerProduct: " + product);

		service.registerProduct(product);

		rttr.addFlashAttribute("result", product.getPid());

		return "redirect:/manage/products";
	}

	@GetMapping({ "/get", "/modify" })
	public void getProduct(@RequestParam("pid") Long pid, Model model) {

		log.info("/get or modify");
		model.addAttribute("product", service.getProduct(pid));
	}

	@PostMapping("/modify")
	public String modifyProduct(ProductVO product, RedirectAttributes rttr) {
		log.info("modify: " + product);

		if (service.modifyProduct(product)) {
			rttr.addFlashAttribute("result", "success");

		}

		return "redirect:/manage/products";
	}

	@PostMapping("/remove")
	public String remove(@RequestParam("pid") Long pid, RedirectAttributes rttr) {

		log.info("remove..." + pid);
		if (service.removeProduct(pid)) {
			rttr.addFlashAttribute("result", "success");

		}

		return "redirect:/manage/products";
	}

	@PostMapping("/uploadFormAction")
	public void uploadFormPost(MultipartFile[] uploadFile, Model model) {

		for (MultipartFile multipartFile : uploadFile) {

			log.info("-----------------------------");
			log.info("Upload File Name: " + multipartFile.getOriginalFilename());
			log.info("Upload File Size: " + multipartFile.getSize());
		}
	}

	@GetMapping("/setting")
	public ModelAndView adminSettingPage(@RequestParam("mid") String mid, Model model, HttpServletRequest request,
			Authentication authentication, Principal principal) throws Exception {
		ModelAndView mv = new ModelAndView();
		MemberVO member = memberService.getMemberInfo(mid);
		mv.addObject("seller", member);
		mv.addObject("streamkey", memberService.getStreamKey(mid));
		mv.setViewName("/manage/setting");
		return mv;
	}

	@RequestMapping("/setting/updateKey")
	public String updateStreamKey(@RequestParam("mid") String mid, Authentication authentication, Principal principal, MemberVO memberVO,
			RedirectAttributes redirectAttributes) {
		MemberVO member = memberService.getMemberInfo(mid);
		System.out.println("컨트롤러의 멤버: " + member);
		memberService.updateStreamKey(member);
		return "redirect:/manage/setting/?mid=" + member.getMid();
	}
	
	@GetMapping("/role")
	public String MemberListGET(Criteria cri, Model model) {
		List<MemberVO> list = memberService.getMemberListAll(cri);
		
		model.addAttribute("list", list);
		model.addAttribute("pageMaker", new PageDTO(cri, memberService.getMemberTotal(cri)));
		
		return "/manage/manage_management";
	}
	
	//권한변경(관리자로 업데이트)
	@PostMapping("/updateMemberRole")
	public String updateMemberRole(MemberVO mv) {
		String mid2 = mv.getMid();
		System.out.println(mid2);
		memberService.updateRole(mv.getMid());
		return "redirect:/manage/role";
	}

}
