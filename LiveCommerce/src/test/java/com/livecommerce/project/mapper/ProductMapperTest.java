package com.livecommerce.project.mapper;

import java.util.List;

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

public class ProductMapperTest {
	@Autowired
	private ProductMapper mapper;
	
	@Test
	public void testPaging() {
		Criteria cri = new Criteria();
		cri.setPageNum(3);
		cri.setAmount(10);
		List<ProductVO> list = mapper.getListWithPaging(cri);
		list.forEach(product -> log.info(product));
	}
	
	@Test
	public void testDetail() {
		ProductVO product = mapper.productGetDetail(1);
		log.info(product);
	}
	
	@Test
	public void testCategory() {
		Criteria cri = new Criteria();
		cri.setPageNum(1);
		cri.setAmount(10);
		String lcategory = "과일과채소";
		String scategory = "계절과일";
		
		List<ProductVO> result = mapper.getListWithCategory(cri, lcategory, scategory);
		
		for(ProductVO vo : result) {
			log.info("브랜드별 상품리스트 : " + vo);
		}
	}
}
