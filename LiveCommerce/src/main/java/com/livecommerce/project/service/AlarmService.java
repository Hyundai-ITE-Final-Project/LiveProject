package com.livecommerce.project.service;

import java.util.List;

import com.livecommerce.project.vo.AlarmTelVO;
import com.livecommerce.project.vo.AlarmVO;
/**
 * @author 김나형
 * @since 2023.02.02
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.02.02		김나형		최초생성
 * </pre>
 */ 
public interface AlarmService {
	// 알람 등록
	public void alarmAdd(AlarmVO alarm) throws Exception;
	// 알람 상태 업데이트
	public void updateAlarmStatus();
	// 알람 보내줄 사람들 전화번호
	public List<AlarmTelVO> liveAlarm();
	// 알람 보내줄 시간
	public String alarmTime(String liveid);

}
