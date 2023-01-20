package com.livecommerce.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.PathVariable;

import com.livecommerce.project.security.CustomMember;
import com.livecommerce.project.service.LiveService;
import com.livecommerce.project.vo.LiveVO;

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
 * 2023.01.20    신기원                	 스트리밍 상세 화면 보기
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
	public String livePage(@PathVariable("liveId") String liveId, Model model ) {
		LiveVO liveVO = LiveService.getLiveInfo(liveId);
		model.addAttribute("live",liveVO);
		model.addAttribute("liveUrl",liveUrl);
		model.addAttribute("nick", liveVO.getMId());
//		model.addAttribute("liveStatus",liveVO.getLiveStatus());
		return "/live/video";
	}
}
