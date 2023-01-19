package com.livecommerce.project.controller;
/**
 * @author 박소은
 * @since 2023.01.16
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.16		박소은		최초생성
 * </pre>
 */ 

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.livecommerce.project.service.ProductService;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.PageDTO;
import com.livecommerce.project.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/manage/*")
@AllArgsConstructor
public class ManageController {
	
	private ProductService service;
	
	@Resource(name="uploadPath")
	private String uploadPath;
	
//	@GetMapping("/products")
//	public void products(Criteria cri, Model model) {
//		
//		log.info("products: " + cri);
//		model.addAttribute("products", service.getList(cri));
//		model.addAttribute("pageMaker", new PageDTO(cri, 123));
//		
////		model.addAttribute("products", service.getProductList());
//	}
	
	@GetMapping("/products")
	public void products(Criteria cri, Model model) {
		
		log.info("products: " + cri);
		model.addAttribute("products", service.getProductList(cri));
		model.addAttribute("pageMaker", new PageDTO(cri, 10000));
	}
	
	@GetMapping("/registerProduct")
	public void registerProduct() {
		
	}
	
	
	@PostMapping("/registerProduct")
	public String registerProduct(ProductVO product, RedirectAttributes rttr)  {
		
		
		log.info("registerProduct: " + product);
		
		service.registerProduct(product);
		
		rttr.addFlashAttribute("result", product.getPid());
		
		return "redirect:/manage/products";
	}
	
	
	@GetMapping({"/get", "/modify"})
	public void getProduct(@RequestParam("pid") Long pid, Model model) {
		
		log.info("/get or modify");
		model.addAttribute("product", service.getProduct(pid));
	}
	
	
	
	
	@PostMapping("/modify")
	public String modifyProduct(ProductVO product, RedirectAttributes rttr) {
		log.info("modify: " + product);
		
		if(service.modifyProduct(product)) {
			rttr.addFlashAttribute("result", "success");
			
		}
		
		return "redirect:/manage/products";
	}
	
	
	@PostMapping("/remove")
	public String remove(@RequestParam("pid") Long pid, RedirectAttributes rttr) {
		
		log.info("remove..." + pid);
		if (service.removeProduct(pid)) {
			rttr.addFlashAttribute("result", "success");
			
		}
		
		return "redirect:/manage/products";
	}
	
	
	
	

}
