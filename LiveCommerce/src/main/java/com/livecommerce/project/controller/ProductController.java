package com.livecommerce.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

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
    
    //전체상품리스트
    @GetMapping("/detail")
    public String detail() {
    	
    	return "product/goodDetail";
    }
}
