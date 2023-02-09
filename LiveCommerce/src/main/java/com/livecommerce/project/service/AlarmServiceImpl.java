package com.livecommerce.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.livecommerce.project.mapper.AlarmMapper;
import com.livecommerce.project.vo.AlarmTelVO;
import com.livecommerce.project.vo.AlarmVO;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductPostAddVO;
import com.livecommerce.project.vo.ProductPostVO;
import com.livecommerce.project.vo.ProductVO;

import lombok.extern.log4j.Log4j;
/**
 * @author 김나형
 * @since 2023.02.02
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.02.02     김나형              최초 생성
 * </pre>
 */
@Service
@Log4j
public class AlarmServiceImpl implements AlarmService{

	@Autowired
	AlarmMapper alarmMapper;
	
	// 알람 추가
	@Override
	public void alarmAdd(AlarmVO alarm) throws Exception{
		alarmMapper.alarmAdd(alarm);
	}
	
	@Override
	public void updateAlarmStatus() {
		alarmMapper.updateAlarmStatus();
	}
	
	@Override
	public List<AlarmTelVO> liveAlarm() {
		return alarmMapper.liveAlarm();
	}
	
	@Override
	public String alarmTime(String liveid) {
		return alarmMapper.alarmTime(liveid);
	}
}
