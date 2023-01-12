package com.livecommerce.project.vo;
/**
 * @author 박소은
 * @since 2023.01.12
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.12		박소은		최초생성
 * </pre>
 */ 
import java.sql.Date;

import lombok.Data;

@Data
public class InquiryVO {
	
	private long inq_id;
	private String inq_type;
	private Date inq_regdate;
	private String inq_content;
	private String inq_img;
	private String member_mid;
	private String inq_title;

}
