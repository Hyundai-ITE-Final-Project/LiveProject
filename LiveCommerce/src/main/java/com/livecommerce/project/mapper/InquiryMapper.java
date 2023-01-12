package com.livecommerce.project.mapper;

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

import org.apache.ibatis.annotations.Select;

import com.livecommerce.project.vo.InquiryVO;

public interface InquiryMapper {
	
	//@Select("select * from inquiry where inq_id > 0")
	public List<InquiryVO> getList();
	
	public void insert(InquiryVO inquiry);
	
	public void insertSelectKey(InquiryVO inquiry);
	
	public InquiryVO read(Long inq_id);
	
	public int delete(Long inq_id);
	
	public int update(InquiryVO inquiry);

}
