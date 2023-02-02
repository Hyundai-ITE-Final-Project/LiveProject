package com.livecommerce.project.vo;

import lombok.Data;

@Data
public class AlarmVO {
	private String member_mid;
	private String live_id;
	private int alarm_status;
    private String alarm_time;
}
