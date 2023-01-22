package com.livecommerce.project.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestParam;

import com.livecommerce.project.security.CustomMember;
import com.livecommerce.project.service.LiveService;
import com.livecommerce.project.vo.LiveVO;
import com.livecommerce.project.vo.ProductVO;

import lombok.extern.log4j.Log4j;
/**
 * @author 신기원
 * @since 2023.01.19
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.19    신기원                	 최초 생성
 * 2023.01.20    신기원                	 스트리밍 상세 화면 보기, 라이브 등록 화면
 * 2023.01.20    신기원                	 스트리밍 상세 화면 보기, 라이브 등록 화면
 * </pre>
 */
@Controller
@Log4j
public class LiveController {
	
	@Autowired
	private LiveService LiveService;
	
	//스트리밍 되는 서버 url
	@Value("${video.url}")
	private String liveUrl;
	
	//라이브 스트리밍 되고 있는 영상의 정보를 가져온다. 
	@GetMapping("/live/{liveId}")
	public String livePage(Authentication  member, @PathVariable("liveId") String liveId, Model model ) {
		LiveVO liveVO = LiveService.getLiveInfo(liveId);
		
		
		if(member !=null) {
			model.addAttribute("nick", member.getName());
        }
		log.info(liveVO.getMId());
		model.addAttribute("host",liveVO.getMId());
		model.addAttribute("live",liveVO);
		model.addAttribute("liveUrl",liveUrl);
		
		
		
//		model.addAttribute("liveStatus",liveVO.getLiveStatus());
		return "/live/video";
	}
	
	@GetMapping("/manage/live/create")
	public String createLivePage(@AuthenticationPrincipal CustomMember member, String live) {
		
		return "";
		
	}
	
	@GetMapping("/live/item")
	public void getLiveProductList(HttpServletRequest request, @RequestParam("ps_index") int ps_index, Model model) {
		log.info("Ps_index : " + ps_index);
		List<ProductVO> productlist = LiveService.getLiveProductList(ps_index);
		for(ProductVO list : productlist) {
			log.info(list);
		}
		model.addAttribute("productlist", productlist);
	}
}
