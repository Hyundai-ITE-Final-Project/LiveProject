package com.livecommerce.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductPostAddVO;
import com.livecommerce.project.vo.ProductPostVO;

public interface ProductPostMapper {
	//모든 판매글 출력
	//판매글을 페이징 처리된 리스트 출력
	public int postGetTotal(@Param("mid") String mid) throws Exception;
	public List<ProductPostVO> getProductPost(@Param("cri")Criteria cri, @Param("mid") String mid) throws Exception;
	
	// (post테이블) 판매글 등록
	public void postAdd(ProductPostVO post) throws Exception;
	// (post_add테이블) 판매글 등록에 상품들
	public void postproductAdd(ProductPostVO productpost) throws Exception;
	//판매글 수정
	//public int postModify(ProductPostVO post) throws Exception;
	//판매글 삭제
	public void postDelete(List<Integer> pindexList);
}
