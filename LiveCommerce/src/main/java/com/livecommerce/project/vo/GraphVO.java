package com.livecommerce.project.vo;

import lombok.Data;

@Data
public class GraphVO {
	
	private int predict_result;
	private int predict_count;
	private String positive;
	private String live_id;
	private String mid;
}
