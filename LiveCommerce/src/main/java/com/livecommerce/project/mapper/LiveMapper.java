package com.livecommerce.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.livecommerce.project.vo.LiveVO;
import com.livecommerce.project.vo.ProductVO;
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
 * 2023.01.21	신기원		실시간 영상 조회수 기능
 * 2023.01.22	신기원		라이브 등록
 * 2023.01.22	김나형		영상별 상품리스트보기
 * 2023.01.24	신기원		본인 라이브 목록, Video 목록 조회
 * </pre>
 */
@Mapper
public interface LiveMapper {
	
	public List<LiveVO> liveList();
	public LiveVO getLiveInfo(String liveId);
	public void setLiveView(LiveVO liveVO);
	public int getLiveView(LiveVO liveVO);
	// 라이브 방송별 상품리스트
	public List<ProductVO> getLiveProductList(int ps_index);
	public int createLive(LiveVO liveVO);
	public int countLive1Status(Map<String, Object> liveMap);
	public List<LiveVO> myLiveList(String mId);
	public List<LiveVO> videoList();
}
