package com.livecommerce.project.service;

import java.text.ParseException;
import java.util.List;

import com.livecommerce.project.vo.LiveVO;
import com.livecommerce.project.vo.ProductVO;

/**
 * @author 신기원
 * @since 2023.01.17
 * @version 1.0
 * 
 * <pre>
 * 수정일              수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.17     신기원              최초 생성, 라이브 목록
 * 2023.01.19     신기원              실시간 영상 상세정보
 * 2023.01.21     신기원              실시간 영상 뷰 + 1 업데이트
 * 2023.01.21     신기원              라이브 등록
 * 2023.01.22	    김나형		    영상별 상품리스트
 * 2023.01.24	    신기원		  Video(모든 영상) 목록 조회
 * </pre>
 */
public interface LiveService {
	
	//현재 라이브 목록 가져오기
	public List<LiveVO> liveList();
	public LiveVO getLiveInfo(String liveId);
	public void setLiveView(LiveVO liveVo);
	public int getLiveView(LiveVO liveVo);
	public List<ProductVO> getLiveProductList(int ps_index);
	public int createLive(LiveVO liveVO) throws ParseException;
	public List<LiveVO> myLiveList(String mId);
	public List<LiveVO> videoList();
}
