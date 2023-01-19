package com.livecommerce.project.mapper;

/**
 * @author 김나형
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 230116		박소은		관리자상품관리
*/


import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.Criteria2;
import com.livecommerce.project.vo.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({ "file:src/main/webapp/WEB-INF/spring/root-context.xml",
	"file:src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml",
	"file:src/main/webapp/WEB-INF/spring/security-context.xml"})
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
	
	
	// 박소은 작성
	
	@Test
	public void testGetProductList() {
		mapper.getProductList().forEach(product -> log.info(product));
	}
	
	
//	@Test
//	public void testPagingProduct() {
//		Criteria2 cri2 = new Criteria2();
//		
//		List<ProductVO> list = mapper.getListWithPagingProduct(cri2);
//		
//		list.forEach(product -> log.info(product));
//	}
	
	
	
	
	@Test
	public void testProductInsert() {
		
		ProductVO product = new ProductVO();
		product.setPname("테스트 상품명");
		product.setLcategory("테스트 대분류");
		product.setScategory("테스트 소분류");
		product.setPrice(10000);
		product.setDetail("테스트 디테일");
		product.setPstock(100);
		product.setImg1("테스트 이미지 url");
		product.setPstatus(0);
		
		mapper.insertProduct(product);
		
		log.info(product);
		
		
	}
	
	
	@Test
	public void testInsertrProductSelectKey() {
		
		ProductVO product = new ProductVO();
		product.setPname("테스트 상품명");
		product.setLcategory("테스트 대분류");
		product.setScategory("테스트 소분류");
		product.setPrice(10000);
		product.setDetail("테스트 디테일");
		product.setPstock(100);
		product.setImg1("테스트 이미지 url");
		product.setPstatus(0);
		
		mapper.insertProductSelectKey(product);
		
		log.info(product);
		
	}
	
	
	@Test
	public void testReadProduct() {
		
		ProductVO product = mapper.readProduct(5L);
		
		log.info(product);
	}
	
	
	@Test
	public void testDeleteProduct() {
		log.info("DELETE COUNT: " + mapper.deleteProduct(211L));
	}
	
	
	
	@Test
	public void testUpdate() {
		ProductVO product = new ProductVO();
		product.setPid(212L);
		product.setPname("수정된 테스트 상품명");
		product.setLcategory("수정된 테스트 대분류");
		product.setScategory("수정된 테스트 소분류");
		product.setPrice(10000);
		product.setDetail("수정된 테스트 디테일");
		product.setPstock(100);
		product.setImg1("수정된 테스트 이미지 url");
		product.setPstatus(0);
		
		
		int count = mapper.updateProduct(product);
		log.info("UPDATE COUNT: " +  count);
	}
}
