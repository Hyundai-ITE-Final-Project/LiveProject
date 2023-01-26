package com.livecommerce.project.controller;

import java.text.ParseException;
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
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.livecommerce.project.security.CustomMember;
import com.livecommerce.project.service.LiveService;
import com.livecommerce.project.service.ProductPostService;
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
 * 2023.01.24    신기원                	 본인 라이브 목록 조회, video(모든 영상) 조회
 * 2023.01.25    신기원                	 영상 다시보기, 라이브 영상 저장하기
 * 
 * </pre>
 */
@Controller
@Log4j
public class LiveController {
	
	@Autowired
	private LiveService LiveService;
	
	@Autowired
	private ProductPostService postService;
	
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
	
	//녹화된 영상의 정보를 가져온다. 
		@GetMapping("/replay/{liveId}")
		public String videoPage(Authentication  member, @PathVariable("liveId") String liveId, Model model ) {
			LiveVO liveVO = LiveService.getReplayInfo(liveId);
			
			if(member !=null) {
				model.addAttribute("nick", member.getName());
	        }
			log.info(liveVO.getMId());
			model.addAttribute("host",liveVO.getMId());
			model.addAttribute("replay",liveVO);
			
			model.addAttribute("url",liveUrl);
			
			return "/live/replay";
		}
		
	@GetMapping("/manage/live")
	public String LiveList(Authentication member, Model model) {
		model.addAttribute("liveList", LiveService.myLiveList(member.getName()));
		return "/manage/liveList";
		
	}
	
	@GetMapping("/manage/live/create")
	public String createLivePage(Authentication member, String live, Model model) {
		if(live != null) {
			LiveVO liveVO = new LiveVO();
			liveVO.setMId(member.getName());
			liveVO.setLiveId(live);
			model.addAttribute("live", LiveService.getLiveInfo(live));
		}
		model.addAttribute("pdPostList",postService.getLivePostList(member.getName()));
		return "manage/live_create";
		
	}
	
	//라이브 등록 후 목록 페이지로 이동
	@PostMapping("/manage/live/create_process")
	public String createLive(Authentication member, LiveVO liveVO) throws ParseException {
		liveVO.setMId(member.getName());
		liveVO.setLiveStartTime(liveVO.getLiveStartDay() + " " + liveVO.getLiveStartTime());
		liveVO.setLiveEndTime(liveVO.getLiveStartDay() + " " + liveVO.getLiveEndTime());
		LiveService.createLive(liveVO);
		return "redirect:/manage/live";
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
	
	@GetMapping("/live/video")
	public String VideoList(Model model) {
		model.addAttribute("lives", LiveService.allVideoList());
		model.addAttribute("liveUrl",liveUrl);
		return "/live/videoList";
	}
	
	//라이브가 종료되고 저장
	@GetMapping("/live/finish")
	@ResponseBody
	public String liveFinish(@RequestParam("liveId") String liveId) {
		return LiveService.saveLiveVideo(liveId);
	}
}
