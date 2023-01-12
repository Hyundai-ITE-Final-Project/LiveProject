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

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.InquiryMapper;
import com.livecommerce.project.vo.InquiryVO;

import lombok.AllArgsConstructor;
import lombok.Setter;
import lombok.extern.log4j.Log4j;


@Log4j
@Service
@AllArgsConstructor
public class InquiryServiceImpl implements InquiryService{
	
	@Setter(onMethod_ = @Autowired)
	private InquiryMapper mapper;

	@Override
	public void register(InquiryVO inquiry) {
		
		log.info("register......" + inquiry);
		
		mapper.insertSelectKey(inquiry);
	}
	
	
	@Override
	public List<InquiryVO> getList() {
		
		log.info("getList..............");
		
		
		return mapper.getList();
	}
	
	

	@Override
	public InquiryVO get(Long inq_id) {
				
		log.info("get...." + inq_id);
		
		return mapper.read(inq_id);
	}
	
	

	@Override
	public boolean modify(InquiryVO inquiry) {
		
		log.info("modify......" + inquiry);
		
		return mapper.update(inquiry) == 1;
	}


	@Override
	public boolean remove(Long inq_id) {
		
		log.info("remove......" + inq_id);
		
		return mapper.delete(inq_id) == 1;
	}

	

}
