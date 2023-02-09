package com.livecommerce.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;

import com.livecommerce.project.service.LiveService;

/**
 * @author 신기원
 * @since 2023.01.26
 * @version 1.0
 * 
 * <pre>
 * 수정일              수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.26     신기원              1초마다 라이브 상태 변경
 * </pre>
 */
@Controller
public class CronController {
	
	@Autowired
	private LiveService liveService;
	
	//1초마다 조건에 따른 라이브 상태 변경
	@Scheduled(fixedDelay = 1000)
	public void liveStatus() {
		liveService.updateLiveStatus();
		
	}
}
