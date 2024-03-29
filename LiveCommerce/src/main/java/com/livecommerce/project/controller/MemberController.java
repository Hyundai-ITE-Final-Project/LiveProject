package com.livecommerce.project.controller;
import java.security.Principal;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
/**
 * @author 박소은
 * @since 2023.01.16
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.16		박소은		최초생성
 * </pre>
 */ 
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.view.RedirectView;

import com.livecommerce.project.service.MemberService;
import com.livecommerce.project.vo.MemberVO;

import lombok.extern.slf4j.Slf4j;

@Controller
@Slf4j
@RequestMapping("/member")
public class MemberController {
	
	@Autowired
	private MemberService memberservice;
	
	BCryptPasswordEncoder passwordEncoder = new BCryptPasswordEncoder();
	
	@GetMapping("/modify")
	public String changeInfoGet(@RequestParam("mid") String mid, Model model, HttpServletRequest request, Authentication authentication, Principal principal) {
    	model.addAttribute("userInfo", memberservice.getMemberInfo(mid));
    	String memid = principal.getName();
    	model.addAttribute("member", memid);
		log.info("로그인된 아이디 : " + memid);


		log.info("회원정보 수정");
		return "member/modify";

	}

	
	@PostMapping("/modify")
	public RedirectView changeInfoPost(MemberVO memberVO, Model model) throws Exception {
		RedirectView redirectView = new RedirectView();
		int res = memberservice.changeInfo(memberVO);
		redirectView.setUrl("http://localhost:8080/member/modify/?mid=" + memberVO.getMid() + "&result=" + res);
		return redirectView;
	}

}
