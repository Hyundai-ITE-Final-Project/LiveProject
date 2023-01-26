package com.livecommerce.project.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.http.MediaType;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.livecommerce.project.service.MypageService;
import com.livecommerce.project.service.ProductService;
import com.livecommerce.project.vo.OrderVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
/**
 * @author 김나형
 * @since 2023.01.22
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.22		김나형		최초생성
 * </pre>
 */ 
@Log4j
@Controller
@RequestMapping("/chatbot")
@AllArgsConstructor

public class ChatBotController {
	@Autowired
	MypageService mypageService;

	// 챗봇 팝업창 띄어주기
	@GetMapping("/chat")
	public void chatPopGET() throws Exception{
		log.info("pop-up!!");
	}
	
	@ResponseBody
	@GetMapping(value = "/chat2",
			produces = {MediaType.APPLICATION_JSON_UTF8_VALUE})
	public List<OrderVO> chatOrderListPost(Principal principal) throws Exception{
		String memid = principal.getName();
		log.info("이렇게도 가능하니??? : " + memid);
		log.info(mypageService.getOrderList(memid));
		return mypageService.getOrderList(memid);
	}
	
	
}
