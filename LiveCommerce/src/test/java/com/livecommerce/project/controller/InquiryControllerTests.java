package com.livecommerce.project.controller;
/**
 * @author 박소은
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.11		박소은		최초생성
 * </pre>
 */ 
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.web.WebAppConfiguration;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.request.MockMvcRequestBuilders;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;
import org.springframework.web.context.WebApplicationContext;

import lombok.Setter;
import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml"})
@Log4j
public class InquiryControllerTests {
	
	@Setter(onMethod_ = {@Autowired})
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	
	@Test
	public void testList() throws Exception {
		
		log.info(
			mockMvc.perform(MockMvcRequestBuilders.get("/inquiry/list"))
			.andReturn()
			.getModelAndView()
			.getModelMap());
				
	
	}
	
	
	@Test
	public void testRegister() throws Exception{
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/inquiry/register")
				.param("inq_type", "문의유형")
				.param("inq_title", "테스트 새 글 제목")
				.param("inq_content", "테스트 새 글 내용")
				.param("member_mid", "gd")
				
			).andReturn().getModelAndView().getViewName();
		
			log.info(resultPage);
	}
	
	
	
	@Test
	public void testGet() throws Exception {
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/inquiry/get")
				.param("inq_id", "40"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
	
	
	@Test
	public void testModify() throws Exception {
		
		String resultPage = mockMvc
			.perform(MockMvcRequestBuilders.post("/inquiry/modify")
					.param("inq_id", "40")
					.param("inq_type", "문의유형수정")
					.param("inq_title","수정된 테스트 새 글 제목")
					.param("inq_content","수정된 테스트 새 글 내용")
					.param("member_mid","gd"))
			.andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
				
	}
	
	
	@Test
	public void testRemove() throws Exception {
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/inquiry/remove")
				.param("inq_id", "40")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
		
	}
	
	
	

}
