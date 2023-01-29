package com.livecommerce.project.mapper;

/**
 * @author 김나형
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.11	김나형		생성
 * 230116		박소은		관리자상품관리
*/


import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductVO;

public interface ProductMapper {
	// 김나형 작성
    //상품 등록순으로 정렬
	public List<ProductVO> getListWithDate(Criteria cri);
    //전체상품갯수
	public int getTotalCount(Criteria cri);
	// 상품 상세조회
	public ProductVO productGetDetail(int pid);
	//카테고리별 상품리스트
	public List<ProductVO> getListWithCategory(Criteria cri, @Param("lcategory")String lcategory, @Param("scategory")String scategory);
	//카테고리별 총 상품개수
	public int getCategoryTotal(@Param("lcategory")String lcategory, @Param("scategory")String scategory);
	
	
	// 박소은 작성
//	@Select("select * from product")
	public List<ProductVO> getProductList();
	
	public List<ProductVO> getListWithPagingProduct(Criteria cri);
	
	public void insertProduct(ProductVO product);
	
	public void insertProductSelectKey(ProductVO product);
	
	public ProductVO readProduct(Long pid);
	
	public int deleteProduct(Long pid);
	
	public int updateProduct(ProductVO product);
}