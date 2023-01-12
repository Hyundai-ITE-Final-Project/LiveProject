package com.livecommerce.project.service;
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
import java.util.List;

import com.livecommerce.project.vo.InquiryVO;

public interface InquiryService {
	
	public void register(InquiryVO inquiry);
	
	public InquiryVO get(Long inq_id);
	
	public boolean modify(InquiryVO inquiry);
	
	public boolean remove(Long inq_id);
	
	public List<InquiryVO> getList();

}
