package com.livecommerce.project.vo;

import lombok.Data;
/**
 * @author 신기원
 * @since 2023.01.21
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.21    신기원                	 최초 생성
 * </pre>
 */
@Data
public class ChatMessageVO {

	private String cId;
	private String ctext;
	private String cDateTime;
	private String chatMid;
	private String liveId;
}
