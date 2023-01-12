package com.livecommerce.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.livecommerce.project.service.InquiryService;
import com.livecommerce.project.vo.InquiryVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
/**
 * @author 박소은
 * @since 2023.01.12
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.12		박소은		최초생성
 * </pre>
 */ 

@Controller
@Log4j
@RequestMapping("/inquiry/*")
@AllArgsConstructor
public class InquiryController {
	
	private InquiryService service;
	
	@GetMapping("/list")
	public void list(Model model) {
		
		log.info("list");
		
		model.addAttribute("list", service.getList());
	}
	
	
	@PostMapping("/register")
	public String register(InquiryVO inquiry, RedirectAttributes rttr) {
		
		log.info("register: " + inquiry);
		
		service.register(inquiry);
		
		rttr.addFlashAttribute("result", inquiry.getInq_id());
		
		return "redirect:/inquiry/list";
	}
	
	
	
	@PostMapping("/modify")
	public String modify(InquiryVO inquiry, RedirectAttributes rttr) {
		
		log.info("modify: " + inquiry);
		
		if (service.modify(inquiry)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/inquiry/list";
	}
	
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("inq_id") Long inq_id, RedirectAttributes rttr ) {
		
		log.info("remove...." + inq_id);
		if (service.remove(inq_id)) {
			rttr.addFlashAttribute("result", "success");
			
		}
		
		return "redirect:/inquiry/list";
		
	}
	
	
	
	@GetMapping("/register")
	public void register() {
		
	}
	
	
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("inq_id") Long inq_id, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("inquiry", service.get(inq_id));
	}
	
	

}
