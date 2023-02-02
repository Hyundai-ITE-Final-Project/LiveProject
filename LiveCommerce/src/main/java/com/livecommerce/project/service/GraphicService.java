package com.livecommerce.project.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.GraphVO;

public interface GraphicService {
	//테스트용으로 날짜별 주문합계
	public List<GraphVO> countOrder();
	//채팅 긍부정 통계
	public List<GraphVO> positivenegative(String live_id, String mid);
}
