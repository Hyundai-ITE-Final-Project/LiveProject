package com.livecommerce.project.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.GraphVO;
/**
 * @author 김민석, 신기원
 * @since 2023.02.01
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.02.01	김민석		최초 생성
 * 2023.02.02	신기원		긍정/부정 Text생성
 * </pre>
 */
public interface GraphicService {
	//테스트용으로 날짜별 주문합계
	public List<GraphVO> countOrder();
	//채팅 긍부정 통계
	public List<GraphVO> positivenegative(String live_id, String mid);
	
	//긍정적인 문장
	public List<GraphVO> selectPositive(String liveId);
	
	//부정적인 문장
	public List<GraphVO> selectNegative(String liveId);
	
}
