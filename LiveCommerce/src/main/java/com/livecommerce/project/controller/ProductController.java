package com.livecommerce.project.controller;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.livecommerce.project.service.ProductService;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.PageDTO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Controller
@RequestMapping("/product")
@AllArgsConstructor

public class ProductController {
    @Autowired
	private ProductService service;
    //전체상품리스트
    @GetMapping("/list")
    public String list(Criteria cri, Model model) {
    	log.info("list controller 들어옴");
    	log.info("list" + cri);
    	model.addAttribute("list", service.getList(cri));
    	
    	int total = service.getTotal(cri);
    	model.addAttribute("pageMaker", new PageDTO(cri, total));
        return "product/productlist";
    }
    
    // pid 값으로 상품 정보를 받아옴 - 상품 상세페이지 구현
    @GetMapping("/productDetail")
    public String productGetDetail(@RequestParam("pid") int pid, Criteria cri, Model model, HttpServletRequest request) {
    	log.info("productDetail 들어옴 : " + pid);
    	model.addAttribute("cri", cri);
    	model.addAttribute("productInfo", service.productGetDetail(pid));
    	return "product/productdetail";
    }
}
