package com.livecommerce.project.service;

import java.util.List;

import com.livecommerce.project.vo.LiveVO;

/**
 * @author 신기원
 * @since 2023.01.17
 * @version 1.0
 * 
 * <pre>
 * 수정일              수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.17     신기원              최초 생성
 * </pre>
 */
public interface LiveService {
	
	//현재 라이브 목록 가져오기
	public List<LiveVO> liveList();
}
