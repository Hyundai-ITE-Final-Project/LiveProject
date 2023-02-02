package com.livecommerce.project.vo;

import lombok.Data;
/**
 * @author 김나형
 * @since 2023.02.02
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.02.02	김나형		최초 생성
*/
@Data
public class AlarmVO {
	private String member_mid;
	private String live_id;
	private int alarm_status;
    private String alarm_time;
}
