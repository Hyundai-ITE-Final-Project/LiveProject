package com.livecommerce.project.mapper;

import java.util.List;

import com.livecommerce.project.vo.GraphVO;

public interface GraphicMapper {
	//테스트용으로 날짜별 주문합계
	public List<GraphVO> countOrder();	
	
}
