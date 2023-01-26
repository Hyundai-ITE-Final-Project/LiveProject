package com.livecommerce.project.mapper;

import static org.junit.Assert.*;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.LiveVO;

import lombok.extern.log4j.Log4j;
/**
 * @author 신기원
 * @since 2023.01.16
 * @version 1.0
 * 
 * <pre>
 * 수정일                     수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.16     신기원              최초 생성
 * 2023.01.21     신기원              1개의 라이브 정보 가져오기
 * 2023.01.21     신기원              view 조회하기
 * 2023.01.22     신기원              라이브 등록하기
 * 2023.01.24     신기원              본인 라이브 목록 조회, Video 목록 조회
 * 2023.01.24     신기원              영상 다시보기
 * </pre>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class LiveMapperTest {

	@Autowired
	public LiveMapper mapper;
	
	//메인 페이지에서 라이브 중인 목록 가져오기
	@Test
	public void test() {
		log.info(mapper.liveList());
	}
	
	//라이브 아이디를 기준으로 정보 출력
	@Test
	public void testLiveInfo() {
		String liveId = "1";
		log.info(mapper.getLiveInfo(liveId));
	}
	
	@Test
	public void testGetView() {
		LiveVO liveVo = new LiveVO();
        liveVo.setLiveId("1");
		log.info(mapper.getLiveView(liveVo));
		
	}
	
	// 라이브 생성 테스트 Status 생성 로직을 같이 실행해야한다.
	@Test
	public void testCreateLive() {
		LiveVO liveVO = new LiveVO();
		liveVO.setMId("123");
		liveVO.setLiveId("22gd");
		liveVO.setLiveStartDay("2023-01-22");
		liveVO.setLiveStartTime("2023-01-22 18:00");
		liveVO.setLiveEndTime("2023-01-22 20:00");
		liveVO.setLiveView("1");
		liveVO.setPsIndex(82);
		liveVO.setLiveTitle("괜춘");
		log.info(liveVO);
		mapper.createLive(liveVO);
	}
	
	@Test
	public void testUpdateLive() {
		LiveVO liveVO = new LiveVO();
		liveVO.setLiveId("22gd");
		liveVO.setLiveStartDay("2023-01-22");
		liveVO.setLiveStartTime("2023-01-22 18:00");
		liveVO.setLiveEndTime("2023-01-22 20:00");
		liveVO.setLiveView("1");
		liveVO.setPsIndex(82);
		liveVO.setLiveTitle("괜춘");
		log.info(liveVO);
		mapper.createLive(liveVO);
	}
	
	@Test
	public void testMyLiveList() {
		String mId = "4d";
		log.info(mapper.myLiveList(mId));
	}
	
	@Test
	public void testVideoList() {
		log.info(mapper.allVideoList());
	}
	
	@Test
	public void testGetReplay() {
		String liveId = "live_134696";
		log.info(mapper.getReplayInfo(liveId));
	}
	
	@Test
	public void testUpdateLiveStatus() {
		log.info(mapper.updateLiveStatus());
	}
	
	@Test
	public void testOnlyVideo() {
		log.info(mapper.onlyVideoList());
	}


}
