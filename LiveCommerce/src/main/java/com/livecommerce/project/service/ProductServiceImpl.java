package com.livecommerce.project.service;
/**
 * @author 김나형
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.11	김나형		생성
 * 2023.01.11	김나형		사용자 상품리스트, 상세페이지
 * 2023.01.11	김나형		카테고리별 상품 리스트
 * 2023.01.11	김나형		최근등록순 상품 리스트
 * 230116		박소은		테이블 변경 (재고, 상태, regdate)
*/

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.ProductMapper;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductVO;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Log4j
@Service
@AllArgsConstructor
public class ProductServiceImpl implements ProductService{

    @Autowired
    private ProductMapper mapper;
    //전체상품
    @Override
    public List<ProductVO> getListWithDate(Criteria cri){
    	log.info("list service 들어옴");
    	return mapper.getListWithDate(cri);
    }
    //전체상품갯수
    @Override
    public int getTotal(Criteria cri) {
    	log.info("service 전체상품갯수");
    	return mapper.getTotalCount(cri);
    }
    
    // 상품 상세 조회
    @Override
    public ProductVO productGetDetail(int pid) {
        return mapper.productGetDetail(pid);
    }
    
    // 카테고리별 상품 조회
    @Override
    public List<ProductVO> getCategoryList(Criteria cri, String lcategory, String scategory){
    	log.info("카테고리별 리스트");
    	return mapper.getListWithCategory(cri, lcategory, scategory);
    }
    
    // 카테고리별 상품 개수
    @Override
    public int getCategoryTotal(String lcategory, String scategory) {
    	return mapper.getCategoryTotal(lcategory, scategory);
    }
    
    
    
    
    
    
    // 박소은 작성
    
	@Override
	public void registerProduct(ProductVO product) {
		
		log.info("register product...." + product);
		
		mapper.insertProductSelectKey(product);
	}
	
	
//	@Override
//	public List<ProductVO> getProductList() {
//		
//		log.info("get Product List.....");
//		
//		return mapper.getProductList();
//	}
//	
	
	@Override
	public List<ProductVO> getProductList(Criteria cri){
		
		log.info("get list with criteria: " + cri);
		
		return mapper.getListWithPagingProduct(cri);
	}
	
	@Override
	public ProductVO getProduct(Long pid) {
		
		log.info("get product....." + pid);
		
		return mapper.readProduct(pid);
	}
	
	
	
	@Override
	public boolean modifyProduct(ProductVO product) {
		
		log.info("modify Product ... " + product);
		return mapper.updateProduct(product) == 1;
	}
	
	
	@Override
	public boolean removeProduct(Long pid) {
		
		log.info("remove product.... " + pid);
		return mapper.deleteProduct(pid) == 1;
	}
	
	
    
    
    

}
