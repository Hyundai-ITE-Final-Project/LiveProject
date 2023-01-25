package com.livecommerce.project.vo;

import lombok.Data;
/**
 * @author 신기원
 * @since 2023.01.17
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.17    신기원                최초 생성
*/
@Data
public class LiveVO {
	private String mId;
    private String liveId;
    private int psIndex;
    private String liveTitle;
    private String fileImg;
    private String liveStartDay;    
    private String liveStartTime;
    private String liveEndTime;
    private String liveView;
    private String liveStatus;
    private String streamKey;
    private String videoId;
    private String videoName;
    private VideoVO videoVO;
    private ProductPostVO ProductPostVO;
    
}
