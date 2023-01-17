package com.livecommerce.project.service;

import java.util.List;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductPostVO;

public interface ProductPostService {
	//모든 판매글 출력
	//판매글을 페이징 처리된 리스트 출력
	public int postGetTotal(String mid) throws Exception;
	public List<ProductPostVO> getProductPost(Criteria cri, String mid) throws Exception;
	//판매글 삭제
	public void postDelete(List<Integer> pindexList) throws Exception;
}