package com.livecommerce.project;

import java.util.List;
import java.util.Locale;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.livecommerce.project.service.LiveService;
import com.livecommerce.project.service.MemberService;
import com.livecommerce.project.service.ProductService;
import com.livecommerce.project.vo.ProductVO;

/**
 * @author 신기원
 * @since 2023.01.19
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.17    신기원                	 스트리밍 연결
 * 2023.02.03  김나형			상품 랜덤으로 추천
 * </pre>
 */
@Controller
public class HomeController {
	
	
	@Autowired
	private LiveService liveService;
	
	@Autowired
	private ProductService productService;
	
	@Autowired
	private MemberService memberService;
	
	@Value("${video.url}")
	private String url;
	
	//메인 페이지로 스트리밍 영상 리스트 전달
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model, Authentication member) {
		
		model.addAttribute("url", url);
		model.addAttribute("lives", liveService.liveList());
		model.addAttribute("trailers", liveService.trailerList());
		
		if(member !=null) {
			model.addAttribute("name", memberService.getMemberInfo(member.getName()).getMname());
        }
//		
		
		List<ProductVO> list = productService.getProductRandom();
		model.addAttribute("productRand", list);
		
		List<ProductVO> list2 = productService.getProductStock();
		model.addAttribute("productStock",list2);
		return "home";
	}
	
}
