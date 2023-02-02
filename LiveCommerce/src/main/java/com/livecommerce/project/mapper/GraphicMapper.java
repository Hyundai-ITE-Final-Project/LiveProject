package com.livecommerce.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.GraphVO;

public interface GraphicMapper {
	//테스트용으로 날짜별 주문합계
	public List<GraphVO> countOrder();	
	//채팅 긍부정 통계
	public List<GraphVO> positivenegative(@Param("live_id") String live_id, @Param("mid") String mid);
}
