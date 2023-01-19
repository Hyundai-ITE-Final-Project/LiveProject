package com.livecommerce.project.service;

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
2023.01.16		김나형		최초생성
 * </pre>
 */ 
public interface ProductPostService {
	//모든 판매글 출력
	//판매글을 페이징 처리된 리스트 출력
	public int postGetTotal(String mid) throws Exception;
	public List<ProductPostVO> getProductPost(Criteria cri, String mid) throws Exception;
	//판매글 등록
	public void postproductAdd(ProductPostVO post) throws Exception;
	//판매글 상세
	public ProductPostVO getPostDetail(int ps_index) throws Exception;
	public List<ProductPostAddVO> getPostProductDetail(int ps_index) throws Exception;
	//판매글 수정
	public void postModify(ProductPostVO post) throws Exception;
	public void postproductDelete(int ps_index) throws Exception;
	//판매글 삭제
	public void postDelete(List<Integer> pindexList) throws Exception;
	//판매 상품
	public List<ProductVO> getpdlist();
}
