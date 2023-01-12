package com.livecommerce.project.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class LoginController {

	@GetMapping("/login")
	public void login(HttpSession session) {
		log.info("Welcome login! {}");
	}
}
