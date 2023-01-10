package com.livecommerce.project.service;

import java.util.List;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductVO;

public interface ProductService {
	// 전체상품
	public List<ProductVO> getList(Criteria cri);
}
