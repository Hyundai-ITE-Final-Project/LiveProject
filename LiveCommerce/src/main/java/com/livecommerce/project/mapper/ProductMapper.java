package com.livecommerce.project.mapper;

import java.util.List;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.ProductVO;

public interface ProductMapper {
    //전체상품
	public List<ProductVO> getListWithPaging(Criteria cri);
    //전체상품갯수
	public int getTotalCount(Criteria cri);
}
