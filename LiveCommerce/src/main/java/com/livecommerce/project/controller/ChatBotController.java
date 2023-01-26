package com.livecommerce.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.livecommerce.project.service.ProductService;

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
	
	// 챗봇 팝업창 띄어주기
	@GetMapping("/chat")
	public void chatPopGET() throws Exception{
		log.info("pop-up!!");
	}
}
