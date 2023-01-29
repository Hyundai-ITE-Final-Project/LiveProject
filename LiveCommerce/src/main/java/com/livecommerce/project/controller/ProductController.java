package com.livecommerce.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.livecommerce.project.service.ProductService;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.PageDTO;
import com.livecommerce.project.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
/**
 * @author 김나형
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.11		김나형		최초생성
 * </pre>
 */ 
@Log4j
@Controller
@RequestMapping("/product/*")
@AllArgsConstructor

public class ProductController {
    @Autowired
	private ProductService service;
    
    // pid 값으로 상품 정보를 받아옴 - 상품 상세페이지 구현
    @GetMapping("/productDetail")
    public String productGetDetail(@RequestParam("pid") int pid, Criteria cri, Model model, HttpServletRequest request) {
    	log.info("productDetail 들어옴 : " + pid);
    	model.addAttribute("cri", cri);
    	model.addAttribute("productInfo", service.productGetDetail(pid));
    	return "product/productdetail";
    }
    
    //카테고리별 상품리스트
    @GetMapping("/listCategory")
    public String listCategory(Criteria cri, Model model, HttpServletRequest request, @RequestParam("lcategory") String lcategory, @RequestParam("scategory") String scategory) {
    	// 상품 리스트 상단 카테고리 정보 보여주기 위해 저장
    	log.info("카테고리 : " + lcategory + " " + scategory);
    	//카테고리 별 상품리스트를 model에 저장
    	List<ProductVO> list = service.getCategoryList(cri, lcategory, scategory);
    	model.addAttribute("list", list);
    	int total = service.getCategoryTotal(lcategory, scategory);
    	model.addAttribute("pageMaker", new PageDTO(cri, total));
    	model.addAttribute("lc", lcategory);
    	model.addAttribute("sc", scategory);
    	return "product/productlist";
    }
    
    //등록날짜순으로 조회한 상품리스트
    @GetMapping("/listDate")
    public String listDate(Criteria cri, Model model) {
    	//카테고리 별 상품리스트를 model에 저장
    	List<ProductVO> list = service.getListWithDate(cri);
    	model.addAttribute("list", list);
    	int total = service.getTotal(cri);
    	model.addAttribute("pageMaker", new PageDTO(cri, total));
    	return "product/productlist2";
    }
}