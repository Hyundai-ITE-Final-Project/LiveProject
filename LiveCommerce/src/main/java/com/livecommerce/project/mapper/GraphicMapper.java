package com.livecommerce.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
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
@Mapper
public interface GraphicMapper {
	//테스트용으로 날짜별 주문합계
	public List<GraphVO> countOrder();	
	//채팅 긍부정 통계
	public List<GraphVO> positivenegative(@Param("live_id") String live_id, @Param("mid") String mid);
	
	public List<GraphVO> selectPositive(String liveId);
	
	public List<GraphVO> selectNegative(String liveId);
}
