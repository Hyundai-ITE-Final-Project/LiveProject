package com.livecommerce.project.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import com.livecommerce.project.vo.LiveVO;
import com.livecommerce.project.vo.ProductPostVO;
import com.livecommerce.project.vo.ProductVO;
import com.livecommerce.project.vo.VideoVO;
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
 * 2023.01.25	신기원		영상 다시보기
 * 2023.01.26	신기원		라이브 상태 변경, 녹화된 영상만 가져오기, 라이브 수정, 라이브 저장하기
 * 2023.01.27	신기원		라이브 최신순, 인기순 목록
 * 2023.01.30	신기원		라이브 예고
 * 2023.01.31	김나형		라이브 레시피 노출
 * </pre>
 */
@Mapper
public interface LiveMapper {
	
	public List<LiveVO> liveList();
	public List<LiveVO> trailerList();
	public LiveVO getLiveInfo(String liveId);
	public LiveVO getReplayInfo(String liveId);
	public void setLiveView(LiveVO liveVO);
	public int getLiveView(LiveVO liveVO);
	public List<ProductVO> getLiveProductList(int ps_index);
	public ProductPostVO getRecipe(int ps_index) throws Exception;
	public int createLive(LiveVO liveVO);
	public int updateLive(LiveVO liveVO);
	public int countLive1Status(Map<String, Object> liveMap);
	public List<LiveVO> myLiveList(String mId);
	public List<LiveVO> recentVideoList();
	public List<LiveVO> viewVideoList();
	public int createVideo(VideoVO video);
	public int updateLiveVideo(LiveVO live);
	public int updateLiveStatus();
	public List<String> onlyVideoList();
	
}
