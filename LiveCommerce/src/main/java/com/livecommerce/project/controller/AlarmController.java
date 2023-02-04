package com.livecommerce.project.controller;

import java.security.Principal;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import net.nurigo.java_sdk.api.Message;
import com.livecommerce.project.service.AlarmService;
import com.livecommerce.project.vo.AlarmTelVO;
import com.livecommerce.project.vo.AlarmVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

/**
 * @author 김나형
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.02.02		김나형		최초생성
 * </pre>
 */ 
@Log4j
@Controller
@RequestMapping("/alarm/*")
@AllArgsConstructor
public class AlarmController {
	@Autowired
	private AlarmService alarmService;
	
	@ResponseBody
	@PostMapping("/live")
	public String liveAlarm(HttpServletRequest request, @RequestParam(value = "chbox[]") List<String> chArr, Principal prin) throws Exception {
		log.info("들어옴");
		AlarmVO alarm = new AlarmVO();
		String memid = prin.getName();
		String liveid = null;
		for(String s:chArr) {
			liveid = s;
		}
		String alarm_time = alarmService.alarmTime(liveid);
		alarm.setAlarm_time(alarm_time);
		alarm.setLive_id(liveid);
		alarm.setMember_mid(memid);
		log.info("alarm : " + alarm);
		alarmService.alarmAdd(alarm);
		// 해당 id와 live_id가 쌍으로 존재할 때 이미 신청을 했다고 해줘야함
		return "redirect:/";
	}
	
	@Scheduled(fixedDelay = 60000)
	public void AlarmStatus() {
		alarmService.updateAlarmStatus();
		List<AlarmTelVO> alarm = alarmService.liveAlarm();
		if(alarm.size() > 0) {
			String api_key = "NCSK8CRZVEXWXQXM";
			String api_secret = "DDZMV6ZNKHFT8T8QTPPCUTQABBEUCQCM";
			Message coolsms = new Message(api_key, api_secret);
			String sendtext = "라이브 방송이 시작되었어요!";
			for(int i=0; i<alarm.size(); i++) {
				HashMap<String, String> set = new HashMap<String, String>();
				String mphone = alarm.get(i).getMtel();
				mphone = mphone.replaceAll("-", "");
				set.put("to", mphone);
				set.put("from", "01020764906");
				set.put("text", sendtext);
				set.put("type", "sms");
		        set.put("app_version", "test app 1.2");
		        System.out.println(set);
		        try {
		        	JSONObject result = coolsms.send(set);
		        	System.out.println(result.toString());
		        }catch(CoolsmsException e) {
		        	System.out.println(e.getMessage());
		        	System.out.println(e.getCode());
		        }
			}
		}
	}
	
}
