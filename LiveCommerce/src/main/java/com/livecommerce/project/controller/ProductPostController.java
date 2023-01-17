package com.livecommerce.project.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.livecommerce.project.service.MemberService;
import com.livecommerce.project.service.ProductPostService;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/manage/*")
@AllArgsConstructor

public class ProductPostController {

	@Autowired
	private ProductPostService postService;

	@GetMapping("/productpost")
	public void PostMainGET(Criteria cri, HttpServletRequest request, Model model, Principal prin) throws Exception {
		// principal를 통해 id 가져오기
		String memid = prin.getName();
		log.info("로그인된 아이디 : " + memid);
		model.addAttribute("member", memid);

		List list = postService.getProductPost(cri, memid);
		model.addAttribute("list", list);

		// 페이징을 위한 전체 데이터 수 조회
		int total = postService.postGetTotal(memid);
		model.addAttribute("pageMaker", new PageDTO(cri, total));
		log.info("total : " + total);
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public String deletePost(HttpServletRequest request, @RequestParam(value="chbox[]") List<String> chArr) throws Exception{
		List<Integer> pindexList = new ArrayList<>();
		for(String s : chArr) {
			pindexList.add(Integer.parseInt(s));
		}
		postService.postDelete(pindexList);
		return "manage/productpost";
	}
}
