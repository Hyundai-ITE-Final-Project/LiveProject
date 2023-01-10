package com.livecommerce.project.mapper;

import java.util.List;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductVO;

public interface ProductMapper {
	public List<ProductVO> getListWithPaging(Criteria cri);
}
