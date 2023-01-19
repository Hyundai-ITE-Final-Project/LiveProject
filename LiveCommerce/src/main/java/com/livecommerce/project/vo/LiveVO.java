package com.livecommerce.project.vo;

import lombok.Data;

@Data
public class LiveVO {
	private String mId;
    private String liveId;
    private String psIndex;
    private String liveTitle;
    private String fileImg;
    private String liveStartDay;    
    private String liveStartTime;
    private String liveEndTime;
    private String liveView;
    private String liveStatus;
    private String streamKey;
    private VideoVO videoVO;
    private ProductPostVO ProductPostVO;
}
