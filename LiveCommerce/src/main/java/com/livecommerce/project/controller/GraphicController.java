package com.livecommerce.project.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.livecommerce.project.service.GraphicService;
import com.livecommerce.project.vo.GraphVO;

@Controller
public class GraphicController {
	
	@Autowired
	private GraphicService graphicService;
	
	
	
	//차트 ajax통신
	@RequestMapping("/chartorder")
	public @ResponseBody List<GraphVO> countOrder(GraphVO vo, Model model) {
		System.out.println(vo);
		List<GraphVO> ordercount = graphicService.countOrder();
		model.addAttribute("ordercount", ordercount);
		return ordercount;
	}
	//chartjs로 이동
	@GetMapping("/manage/chart")
	public String chartMain() {
		return "/manage/chart";
	}
}
