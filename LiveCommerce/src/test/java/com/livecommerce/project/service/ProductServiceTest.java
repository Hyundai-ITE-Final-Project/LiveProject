package com.livecommerce.project.service;
/**
 * @author 김나형
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 230116		박소은		관리자 상품 등록 수정 삭제
*/

import static org.junit.Assert.assertNotNull;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class ProductServiceTest {
	@Autowired
	private ProductService service;
	
	@Test
	public void testGetList() {
		service.getListWithDate(new Criteria(2,10)).forEach(product -> log.info(product));
	}
	
	@Test
	public void testGetDetail() {
		service.productGetDetail(1);
	}
	
	@Test
	public void testGetCategory() {
        int result = service.getCategoryTotal("과일과채소", "산들내음");
        log.info("페이징 시 필요한 총 상품 개수 : " + result);
	}
	
	
	
	
	// 박소은 작성 
	
	@Test
	public void testExist() {
		
		log.info(service);
		assertNotNull(service);
	}
	
	
	@Test
	public void testRegisterProduct() {
		
		ProductVO product = new ProductVO();
		product.setPname("테스트 상품명");
		product.setLcategory("테스트 대분류");
		product.setScategory("테스트 소분류");
		product.setPrice(10000);
		product.setDetail("테스트 디테일");
		product.setPstock(100);
		product.setImg1("테스트 이미지 url");
		product.setPstatus(0);
		
		service.registerProduct(product);
		
		log.info("생성된 게시물의 번호: " + product.getPid());
	}
	
	
	
//	@Test
//	public void testGetProductList() {
//		
//		service.getProductList().forEach(product -> log.info(product));
//	}
	
	
	@Test
	public void testGetProduct() {
		log.info(service.getProduct(1L));
	}
	
	
	@Test
	public void testDeleteProduct() {
		
		log.info("REMOVE RESULT: " + service.removeProduct(213L));
		
	}
	
	
	@Test
	public void testUpdateProduct() {
		
		ProductVO product = service.getProduct(212L);
		
		if (product == null) {
			return;
			
		}
		
		product.setPname("상품명 수정합니다");
		log.info("MODIFY RESULT: "  + service.modifyProduct(product));
	}
}
