package com.livecommerce.project.mapper;

/**
 * @author 박소은
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.11		박소은		최초생성
 */

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;

import com.livecommerce.project.vo.InquiryVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
@WebAppConfiguration
public class InquiryMapperTests {
	
	@Setter(onMethod_ = @Autowired)
	private InquiryMapper mapper;
	
	@Test
	public void testGetList() {
		mapper.getList().forEach(inquiry -> log.info(inquiry));
	}
	
	@Test
	public void testInsert() {
		
		InquiryVO inquiry = new InquiryVO();
		inquiry.setInq_type("배송문의");
		inquiry.setInq_title("새로 작성하는 글");
		inquiry.setInq_content("새로 작성하는 내용");
		inquiry.setMember_mid("gd");
		
		mapper.insert(inquiry);
		
		log.info(inquiry);
		
	}
	
	@Test(timeout = 10000)
	public void testInsertSelectKey() {
		
		InquiryVO inquiry = new InquiryVO();
		inquiry.setInq_type("배송문의");
		inquiry.setInq_title("새로 작성하는 글");
		inquiry.setInq_content("새로 작성하는 내용");
		inquiry.setMember_mid("gd");
		
		mapper.insertSelectKey(inquiry);
		
		log.info(inquiry);
	}
	
	@Test
	public void testRead() {
		
		InquiryVO inquiry = mapper.read(10L);
		
		log.info(inquiry);
	}
	
	@Test
	public void testDelete() {
		
		log.info("DELETE COUNT: " + mapper.delete(10L));
	}
	
	@Test
	public void testUpdate() {
		
		InquiryVO inquiry = new InquiryVO();
		inquiry.setInq_id(19L);
		inquiry.setInq_type("기타문의");
		inquiry.setInq_title("수정된 제목");
		inquiry.setInq_content("수정된 내용");
		inquiry.setMember_mid("gd");
		
		int count = mapper.update(inquiry);
		log.info("UPDATE COUNT: " + count);
	}

}
