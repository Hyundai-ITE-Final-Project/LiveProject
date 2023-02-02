package com.livecommerce.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.AlarmTelVO;
import com.livecommerce.project.vo.AlarmVO;
/**
 * @author 김나형
 * @since 2023.02.02
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.02.02		김나형		최초생성
 * </pre>
 */ 
public interface AlarmMapper {
	public void alarmAdd(AlarmVO alarm) throws Exception;
	public int updateAlarmStatus();
	public List<AlarmTelVO> liveAlarm();
	public String alarmTime(@Param("liveid") String liveid);
}
