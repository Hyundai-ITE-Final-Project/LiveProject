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
import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.InquiryVO;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class InquiryServiceTests {
	
	 @Setter(onMethod_ = {@Autowired})
	 private InquiryService service;
	 
	 @Test
	 public void testExist() {
		 
		 log.info(service);
		 assertNotNull(service);
	 }
	 
	 @Test
	 public void testRegister() {
		 InquiryVO inquiry = new InquiryVO();
		 inquiry.setInq_type("문의유형");
		 inquiry.setInq_title("새로 작성하는 제목");
		 inquiry.setInq_content("새로 작성하는 내용");
		 inquiry.setMember_mid("gd");
		 
		 service.register(inquiry);
		 
		 log.info("생성된 게시물의 번호: " + inquiry.getInq_id());
	 }
	 
	 
	 @Test
	 public void testGetList() {
		 
		 service.getList().forEach(inquiry -> log.info(inquiry));
	 }
	 
	 
	 @Test
	 public void testGet() {
		 
		 log.info(service.get(19L));
	 }
	 
	 
	 @Test
	 public void testDelete() {
		 
		 log.info("REMOVE RESULT: "  + service.remove(19L));
	 }
	 
	 
	 @Test
	 public void testUpdate() {
		 
		 InquiryVO inquiry = service.get(37L);
		 
		 if (inquiry == null) {
			 return;
		 }
		 
		 inquiry.setInq_title("제목 수정합니다. ");
		 log.info("MODIFY RESULT: " + service.modify(inquiry));
	 }

}
