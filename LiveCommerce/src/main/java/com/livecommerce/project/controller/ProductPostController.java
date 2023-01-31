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
/**
 * @author 김나형
 * @since 2023.01.16
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.16		김나형		최초생성
 * </pre>
 */ 
@Log4j
@Controller
@RequestMapping("/manage/*")
@AllArgsConstructor

public class ProductPostController {

	@Autowired
	private ProductPostService postService;
	
	// 자신이 등록한 post 조회
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
	// post 등록
	@PostMapping("/productpostadd")
	public String PostAddPOST(HttpServletRequest request, Model model, Principal prin, ProductPostVO post, RedirectAttributes rttr) throws Exception{
		log.info(post.getPs_title());
		log.info(post.getRecipe());
		postService.postproductAdd(post);
		String memid = prin.getName();
		model.addAttribute("member", memid);
		rttr.addFlashAttribute("enroll_result", post);
		return "redirect:/manage/productpost";
	}
	// post 수정페이지로 이동
	@GetMapping("/postmodify")
	public void PostModifyGet(int ps_index, Model model, Principal prin) throws Exception{
		String memid = prin.getName();
		model.addAttribute("member", memid);
		model.addAttribute("ps_index", ps_index);
		model.addAttribute("pd", postService.getpdlist());
		model.addAttribute("post", postService.getPostDetail(ps_index));
		List<ProductPostAddVO> prolist = postService.getPostProductDetail(ps_index);
		model.addAttribute("post2", prolist);
	}
	// post 수정
	@PostMapping("/postmodify")
	public String PostModify(ProductPostVO post) throws Exception{
		log.info("ps_index : " + post.getPs_index());
		postService.postproductDelete(post.getPs_index());
		postService.postModify(post);
		return "redirect:/manage/productpost";
	}
	// post 삭제
	@ResponseBody
	@PostMapping("/delete")
	public String deletePost(HttpServletRequest request, @RequestParam(value="chbox[]") List<String> chArr) throws Exception{
		List<Integer> pindexList = new ArrayList<>();
		for(String s : chArr) {
			pindexList.add(Integer.parseInt(s));
			log.info(Integer.parseInt(s));
		}
		postService.postDelete(pindexList);
		return "redirect:/manage/productpost";
	}
}
