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
import java.util.Collection;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
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

	@GetMapping("/login")
	public void login(HttpSession session, Model model) {
		System.out.println("Session is " + session);
		log.info("Welcome login! {}");

		SNSLogin snsLogin = new SNSLogin(naverSns);
		model.addAttribute("naver_url", snsLogin.getNaverAuthURL());

	}
	
	

	@RequestMapping(value = "/auth/naver/callback", method = { RequestMethod.GET, RequestMethod.POST })
	public void snsLoginCallback(Model model, @RequestParam String code, HttpSession session, HttpServletRequest request, HttpServletResponse response,
			Authentication auth
			) throws Exception {

		SNSLogin snsLogin = new SNSLogin(naverSns);
		MemberVO memberVO = snsLogin.getUserProfile(code);
		System.out.println("memberVO >> " + memberVO);

		if (service.getMemberInfo(memberVO.getMid()) == null) {
			service.join(memberVO);
		} else {
			model.addAttribute("memberVO", memberVO.getMname() + "님, 반갑습니다.");
		}
		Collection<SimpleGrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority("ROLE_USER"));
		CustomMember customMember = new CustomMember(memberVO.getMid(), memberVO.getMpassword(), authorities);
		loginHandler.onAuthenticationSuccess(request, response, auth);

		// 1. code를 이용해서 access_token 받기
		// 2. access_token을 이용해서 사용자 profile 정보 가져오기
		// 3. DB에 해당 유저가 존재하는지 체크(naverId 컬럼 추가)
		// 4. 존재시 강제 로그인

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
