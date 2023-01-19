package com.livecommerce.project.controller;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.livecommerce.project.service.ProductPostService;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.PageDTO;
import com.livecommerce.project.vo.ProductPostAddVO;
import com.livecommerce.project.vo.ProductPostVO;

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
	
	// 입력페이지로 이동
	@GetMapping("/productpostadd")
	public void PostAddGET(Model model, Principal prin) throws Exception{
		String memid = prin.getName();
		model.addAttribute("member", memid);
		model.addAttribute("pd", postService.getpdlist());
		log.info(memid);
	}
	
	@PostMapping("/productpostadd")
	public String PostAddPOST(HttpServletRequest request, Model model, Principal prin, ProductPostVO post, RedirectAttributes rttr) throws Exception{
		//log.info(post.getProductlist());
		//log.info(post.getMid());
		postService.postproductAdd(post);
		String memid = prin.getName();
		model.addAttribute("member", memid);
		rttr.addFlashAttribute("enroll_result", post);
		//postService.postproductAdd(addpost);
		return "redirect:/manage/productpost";
	}
	
	@ResponseBody
	@PostMapping("/delete")
	public String deletePost(HttpServletRequest request, @RequestParam(value="chbox[]") List<String> chArr) throws Exception{
		List<Integer> pindexList = new ArrayList<>();
		for(String s : chArr) {
			pindexList.add(Integer.parseInt(s));
		}
		postService.postDelete(pindexList);
		return "redirect:/manage/productpost";
	}
}
