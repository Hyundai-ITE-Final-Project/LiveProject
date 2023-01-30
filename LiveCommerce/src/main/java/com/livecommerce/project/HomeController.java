package com.livecommerce.project;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.livecommerce.project.service.LiveService;

import lombok.extern.log4j.Log4j;

/**
 * @author 신기원
 * @since 2023.01.19
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.17    신기원                	 스트리밍 연결
 * </pre>
 */
@Controller
public class HomeController {
	
	
	@Autowired
	private LiveService liveService;
	
	@Value("${video.url}")
	private String url;
	
	//메인 페이지로 스트리밍 영상 리스트 전달
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		model.addAttribute("url", url);
		model.addAttribute("lives", liveService.liveList());
		model.addAttribute("trailers", liveService.trailerList());
		return "home";
	}
	
}
