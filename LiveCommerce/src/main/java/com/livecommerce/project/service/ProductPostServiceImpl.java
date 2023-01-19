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

@Service
@Log4j
public class ProductPostServiceImpl implements ProductPostService{

	@Autowired
	ProductPostMapper postMapper;
	@Override
	public int postGetTotal(String mid) throws Exception {
		log.info("Service - postGetTotal..");
		return postMapper.postGetTotal(mid);
	}

	@Override
	public List<ProductPostVO> getProductPost(Criteria cri, String mid) throws Exception {
		log.info("Service - getProductPostList.." + cri + mid);
		return postMapper.getProductPost(cri, mid);
	}
	
	@Override
	public void postAdd(ProductPostVO post) throws Exception{
		postMapper.postAdd(post);
	}
	
	@Transactional
	@Override
	public void postproductAdd(ProductPostVO post) throws Exception{
		postMapper.postAdd(post);
		log.info("service index : " + post.getPs_index());
		for(int i=0; i<post.getProductlist().size();i++) {
			postMapper.postproductAdd(post.getPs_index(), post.getProductlist().get(i));
		}
	}
	
	@Override
	public void postDelete(List<Integer> pindexList) throws Exception{
		postMapper.postDelete(pindexList);
	}

	@Override
	public List<ProductVO> getpdlist() {
		return postMapper.getpdlist();
	}

}
