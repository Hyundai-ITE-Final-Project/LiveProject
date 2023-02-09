package com.livecommerce.project.controller;
/**
 * @author 신기원
 * @since 2023.01.12
 * @version 1.0
 * 
 * <pre>

 * 수정일              	수정자                   수정내용
2023.01.12		신기원		최초생성
2023.01.28		박소은		소셜로그인 관련 컨트롤러 생성
 * </pre>
 */ 

import java.util.ArrayList;
import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContext;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.context.HttpSessionSecurityContextRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.livecommerce.project.auth.SNSLogin;
import com.livecommerce.project.auth.SnsValue;
import com.livecommerce.project.security.CustomLoginSuccessHandler;
import com.livecommerce.project.security.CustomMember;
import com.livecommerce.project.security.CustomUserDetailsService;
import com.livecommerce.project.service.MemberService;
import com.livecommerce.project.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LoginController {

	@Inject
	private SnsValue naverSns;

	@Autowired
	MemberService service;
	@Autowired
	CustomLoginSuccessHandler loginHandler;

	@Resource(name = "customUserDetailsService")
	protected CustomUserDetailsService userDetailsService;

	@GetMapping("/login")
	public void login(HttpSession session, Model model) {
		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());

	}
//	작성자: 박소은
	@RequestMapping(value = "/auth/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public String snsLoginCallback(Model model, @RequestParam String code,
			HttpServletRequest request) throws Exception {

		SNSLogin snsLogin = new SNSLogin(naverSns);
		MemberVO memberVO = snsLogin.getUserProfile(code);
		System.out.println("memberVO >> " + memberVO);

		if (service.getMemberInfo(memberVO.getMid()) == null) {
			service.join(memberVO);
		}
		List<GrantedAuthority> list = new ArrayList<>();
		list.add(new SimpleGrantedAuthority("ROLE_USER"));

		
		SecurityContext sc = SecurityContextHolder.getContext();
		CustomMember member = new CustomMember(memberVO.getMid(), memberVO.getMpassword(), list);
		sc.setAuthentication(new UsernamePasswordAuthenticationToken(member, null, list));
		HttpSession session = request.getSession(true);	
	
		session.setAttribute(HttpSessionSecurityContextRepository.SPRING_SECURITY_CONTEXT_KEY, sc);
		
		return "redirect:/";

	}

	@GetMapping("/signup")
	public String signup() {
		return "login/sign_up";
	}

	@PostMapping("/signup/complete")
	public String signUp(MemberVO memberVO, Model model) {
		log.info(memberVO);
		service.join(memberVO);
		return "login";
	}

//	 @PostMapping("/signup/complete")
//    @ResponseBody
//    public CommonApiResponseVo<String> proSignUp(UserVo user) {  
//        CommonApiResponseVo<String> response = new CommonApiResponseVo<>();
//        int result = loginService.insertUser(user);
//        if(result != 0) {
//            response.setResult(true);
//            response.setMessage(messageSource.getMessage("message.signUp"));
//        }else {
//            response.setResult(false);
//            response.setMessage(messageSource.getMessage("message.error"));
//        }
//        return response;
//    }
}
