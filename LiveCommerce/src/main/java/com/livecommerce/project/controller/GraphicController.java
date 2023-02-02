package com.livecommerce.project.controller;

import java.security.Principal;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.livecommerce.project.service.GraphicService;
import com.livecommerce.project.vo.GraphVO;

@Controller
public class GraphicController {
	
	@Autowired
	private GraphicService graphicService;
	
	
	
	//차트 ajax통신
	@RequestMapping("/chart")
	public @ResponseBody List<GraphVO> countOrder(GraphVO vo, Model model) {
		System.out.println(vo.getLive_id());
		System.out.println(vo.getMid());
		List<GraphVO> reaction = graphicService.positivenegative(vo.getLive_id(), vo.getMid());
		System.out.println(reaction);
		model.addAttribute("reaction", reaction);
		return reaction;
	}
	//chartjs로 이동
	@PostMapping("/manage/chart")
	public String chartMain(@RequestParam("live_id") String live_id, Model model) {
		model.addAttribute("live_id", live_id);
		return "/manage/chart";
	}
	
	
}
