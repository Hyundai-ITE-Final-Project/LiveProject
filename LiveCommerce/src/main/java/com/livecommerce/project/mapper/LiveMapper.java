package com.livecommerce.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import com.livecommerce.project.vo.LiveVO;
/**
 * @author 신기원
 * @since 2023.01.17
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.17	신기원		최초 생성, 실시간 영상 목록조회
 * 2023.01.19	신기원		영상 상세 정보 보기
 * </pre>
 */
@Mapper
public interface LiveMapper {
	
	public List<LiveVO> liveList();
	public LiveVO getLiveInfo(String liveId);
}
