package com.livecommerce.project.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.livecommerce.project.mapper.ProductPostMapper;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductPostAddVO;
import com.livecommerce.project.vo.ProductPostVO;
import com.livecommerce.project.vo.ProductVO;


import lombok.extern.log4j.Log4j;
/**
 * @author 김나형
 * @since 2023.01.16
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.16     김나형              최초 생성
 * 2023.01.19   김나형, 신기원      Transactional 설정
 * </pre>
 */
@Service
@Log4j
public class ProductPostServiceImpl implements ProductPostService{

	@Autowired
	ProductPostMapper postMapper;
	// post 개수
	@Override
	public int postGetTotal(String mid) throws Exception {
		log.info("Service - postGetTotal..");
		return postMapper.postGetTotal(mid);
	}
	// post 리스트
	@Override
	public List<ProductPostVO> getProductPost(Criteria cri, String mid) throws Exception {
		log.info("Service - getProductPostList.." + cri + mid);
		return postMapper.getProductPost(cri, mid);
	}
	//post 추가
	@Transactional(rollbackFor = {Exception.class})
	@Override
	public void postproductAdd(ProductPostVO post) throws Exception{
		postMapper.postAdd(post);
		log.info("service index : " + post.getPs_index());
		for(int i=0; i<post.getProductlist().size();i++) {
			postMapper.postproductAdd(post.getPs_index(), post.getProductlist().get(i));
		}
	}
	// post 상세정보
	@Override
	public ProductPostVO getPostDetail(int ps_index) throws Exception{
		log.info("getPostDetail : " + ps_index);
		return postMapper.getPostDetail(ps_index);
	}
	@Override
	public List<ProductPostAddVO> getPostProductDetail(int ps_index) throws Exception{
		log.info("getPostProductDetail : " + ps_index);
		return postMapper.getPostProductDetail(ps_index);
	}
	// post 수정
	@Transactional
	@Override
	public void postModify(ProductPostVO post) throws Exception{
		postMapper.postModify(post);
		log.info("postModify..." + post.getPs_index());
		for(int i=0; i<post.getProductlist().size();i++) {
			postMapper.postproductAdd(post.getPs_index(), post.getProductlist().get(i));
		}
	}
	public void postproductDelete(int ps_index) throws Exception{
		postMapper.postproductDelete(ps_index);
	}

	// post 삭제
	@Override
	public void postDelete(List<Integer> pindexList) throws Exception{
		postMapper.postDelete(pindexList);
	}
	// 판매상품리스트
	@Override
	public List<ProductVO> getpdlist() {
		return postMapper.getpdlist();
	}

}
