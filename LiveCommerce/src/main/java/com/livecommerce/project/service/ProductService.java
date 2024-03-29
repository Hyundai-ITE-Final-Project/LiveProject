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
 * 230116		박소은		관리자 상품 관리
 * 2023.02.03	김나형		랜덤상품 추천
 * 2023.02.04	김나형		상품 재고별 정렬
*/

import java.util.List;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductVO;

public interface ProductService {
	// 전체상품
	public List<ProductVO> getListWithDate(Criteria cri);
	// 랜덤상품
	public List<ProductVO> getProductRandom();
	//상품 재고순으로 정렬
	public List<ProductVO> getProductStock();
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
    
//    public List<ProductVO> getProductList();
    
    public List<ProductVO> getProductList(Criteria cri);
}
