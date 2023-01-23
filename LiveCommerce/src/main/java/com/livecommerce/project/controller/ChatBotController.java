package com.livecommerce.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.livecommerce.project.service.ProductService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/chatbot")
@AllArgsConstructor

public class ChatBotController {
	@Autowired
	
	@GetMapping("/chat")
	public void chatPopGET() throws Exception{
		log.info("pop-up!!");
	}
}
