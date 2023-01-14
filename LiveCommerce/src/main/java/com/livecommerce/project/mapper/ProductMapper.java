package com.livecommerce.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductVO;

public interface ProductMapper {
    //전체상품
	public List<ProductVO> getListWithPaging(Criteria cri);
    //전체상품갯수
	public int getTotalCount(Criteria cri);
	// 상품 상세조회
	public ProductVO productGetDetail(int pid);
	//카테고리별 상품리스트
	public List<ProductVO> getListWithCategory(Criteria cri, @Param("lcategory")String lcategory, @Param("scategory")String scategory);
	//카테고리별 총 상품개수
	public int getCategoryTotal(@Param("lcategory")String lcategory, @Param("scategory")String scategory);
}