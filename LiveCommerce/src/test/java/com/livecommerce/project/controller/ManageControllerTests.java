package com.livecommerce.project.controller;

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

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@WebAppConfiguration
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
@Log4j
public class ManageControllerTests {
	
	
	@Autowired
	private WebApplicationContext ctx;
	
	private MockMvc mockMvc;
	
	
	@Before
	public void setup() {
		this.mockMvc = MockMvcBuilders.webAppContextSetup(ctx).build();
	}
	
	
	@Test
	public void testProducts() throws Exception {
		
		
		log.info(
				mockMvc.perform(MockMvcRequestBuilders.get("/manage/products"))
				.andReturn()
				.getModelAndView()
				.getModelMap());
	}
	
	
	@Test
	public void testRegisterProduct() throws Exception{
		
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/manage/register")
				.param("pname", "상품 이름")
				.param("lcategory", "상품 대분류")
				.param("scategory", "상품 소분류")
				.param("detail", "상품 상세")
				.param("img1", "상품 img url")
				
			).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}
	
	
	
	@Test
	public void testGetProduct() throws Exception{
		
		log.info(mockMvc.perform(MockMvcRequestBuilders
				.get("/manage/get")
				.param("pid", "2"))
				.andReturn()
				.getModelAndView().getModelMap());
	}
	
	
	
	@Test
	public void testModifyProduct() throws Exception {
		
		String resultPage = mockMvc
			.perform(MockMvcRequestBuilders.post("/manage/modify")
					.param("pid", "212")
					.param("pname", "수정 상품 이름")
					.param("lcategory", "수정 상품 대분류")
					.param("scategory", "수정 상품 소분류")
					.param("detail", "수정 상품 상세")
					.param("img1", "수정 상품 img url"))
			.andReturn().getModelAndView().getViewName();
		
		
		log.info(resultPage);
	}
	
	
	@Test
	public void testRemoveProduct() throws Exception{
		String resultPage = mockMvc.perform(MockMvcRequestBuilders.post("/manage/remove")
				.param("pid", "214")
				).andReturn().getModelAndView().getViewName();
		
		log.info(resultPage);
	}

}

