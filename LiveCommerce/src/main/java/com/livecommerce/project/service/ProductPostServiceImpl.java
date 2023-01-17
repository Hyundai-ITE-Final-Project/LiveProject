package com.livecommerce.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.livecommerce.project.mapper.ProductPostMapper;
import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductPostVO;

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
	
	/*
	 * // post 삭제
	 * 
	 * @Override public int postDelete(String pindex) throws Exception { return
	 * postMapper.postDelete(pindex); }
	 */
	
	@Override
	public void postDelete(List<Integer> pindexList) throws Exception{
		postMapper.postDelete(pindexList);
	}

}
