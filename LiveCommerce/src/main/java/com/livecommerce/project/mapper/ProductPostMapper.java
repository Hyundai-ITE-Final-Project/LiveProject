package com.livecommerce.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductPostAddVO;
import com.livecommerce.project.vo.ProductPostVO;
import com.livecommerce.project.vo.ProductVO;
/**
 * @author 김나형
 * @since 2023.01.16
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * 2023.01.16		김나형		최초생성
 * 2023.01.24		신기원		라이브 등록 가능한 판매글 리스트
 * </pre>
 */ 
public interface ProductPostMapper {
	//모든 판매글 출력
	//판매글을 페이징 처리된 리스트 출력
	public int postGetTotal(@Param("mid") String mid) throws Exception;
	public List<ProductPostVO> getProductPost(@Param("cri")Criteria cri, @Param("mid") String mid) throws Exception;
	
	// (post테이블) 판매글 등록
	public void postAdd(ProductPostVO post) throws Exception;
	// (post_add테이블) 판매글 등록에 상품들
	public void postproductAdd(@Param("ps_index") int ps_index, @Param("pid") int pid) throws Exception;
	// ps_index를 통해 상세정보 가져오기
	public ProductPostVO getPostDetail(int ps_index) throws Exception;
	public List<ProductPostAddVO>getPostProductDetail(int ps_index) throws Exception;
	// (post테이블) 판매글 수정
	public void postModify(ProductPostVO post) throws Exception;
	// (post_add테이블) 판매글 수정에 상품들
	public void postproductDelete(int ps_index) throws Exception;
	public void postproductModify(@Param("ps_index") int ps_index, @Param("pid") int pid) throws Exception;
	//판매글 삭제
	public void postDelete(List<Integer> pindexList);
	//판매 상품 리스트
	public List<ProductVO> getpdlist();
	//라이브 등록시 판매글 리스트
	public List<ProductPostVO> getLivePostList(String mId);
}
