package com.livecommerce.project.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.livecommerce.project.mapper.LiveMapper;
import com.livecommerce.project.vo.LiveVO;
/**
 * @author 신기원
 * @since 2023.01.17
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.17     신기원              최초 생성, 라이브 목록
 * 2023.01.19     신기원              실시간 영상 상세정보
 * 2023.01.21     신기원              실시간 영상 뷰 + 1 업데이트
 * </pre>
 */

@Service
@Transactional(readOnly = true)
public class LiveServiceImpl implements LiveService{

	@Autowired
	private LiveMapper liveMapper;
	
	
	//라이브되는 영상 리스트
	@Override
	public List<LiveVO> liveList() {
		return liveMapper.liveList();
	}


	//실시간 영상 상세정보 받아오기
	@Override
	public LiveVO getLiveInfo(String liveId) {
		return liveMapper.getLiveInfo(liveId);
	}


	@Override
	public void setLiveView(LiveVO liveVO) {
		liveMapper.setLiveView(liveVO);
	}


	@Override
	public int getLiveView(LiveVO liveVO) {
		
		return liveMapper.getLiveView(liveVO);
	}

}
