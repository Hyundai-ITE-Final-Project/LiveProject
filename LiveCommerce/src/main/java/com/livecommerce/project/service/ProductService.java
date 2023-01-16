package com.livecommerce.project.service;
/**
 * @author 김나형
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 230116		박소은		관리자 상품 관리
*/

import java.util.List;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductVO;

public interface ProductService {
	// 전체상품
	public List<ProductVO> getList(Criteria cri);
	// 전체상품갯수
	public int getTotal(Criteria cri);
	// 상품 상세보기
    public ProductVO productGetDetail(int pid);
    // 카테고리별 상품보기
    public List<ProductVO> getCategoryList(Criteria cri, String lcategory, String scategory);
    // 카테고리별 상품개수
    public int getCategoryTotal(String lcategory, String scategory);
    
    
    
    // 박소은 작성
    public void registerProduct(ProductVO product);
    
    public ProductVO getProduct(Long pid);
    
    public boolean modifyProduct(ProductVO product);
    
    public boolean removeProduct(Long pid);
    
    public List<ProductVO> getProductList();
}
