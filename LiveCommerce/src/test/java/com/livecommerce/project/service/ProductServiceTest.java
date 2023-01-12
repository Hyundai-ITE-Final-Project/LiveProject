package com.livecommerce.project.service;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j

public class ProductServiceTest {
	@Autowired
	private ProductService service;
	
	@Test
	public void testGetList() {
		service.getList(new Criteria(2,10)).forEach(product -> log.info(product));
	}
	
	@Test
	public void testGetDetail() {
		service.productGetDetail(1);
	}
	
}
