package com.livecommerce.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.livecommerce.project.service.MemberService;
import com.livecommerce.project.vo.MemberVO;

import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
public class LoginController {

	@Autowired
	MemberService service;
	
	@GetMapping("/login")
	public void login(HttpSession session) {
		log.info("Welcome login! {}");
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
