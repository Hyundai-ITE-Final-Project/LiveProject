package com.livecommerce.project.mapper;

import java.util.List;

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
 * 2023.01.22	김나형		영상별 상품리스트보기
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
}
