package com.livecommerce.project.service;

import static org.junit.Assert.*;

import java.text.ParseException;
import java.time.LocalDate;
import java.time.LocalDateTime;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.LiveVO;
import com.livecommerce.project.vo.ProductPostVO;

import lombok.extern.log4j.Log4j;
/**
 * @author 신기원
 * @since 2023.01.17
 * @version 1.0
 * 
 * <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.17    신기원                	 최초 생성
 * 2023.01.19    신기원                	 라이브 상세정보
 * 2023.01.21    신기원                	 실시간 영상 view + 1
 * 2023.01.22    신기원                	 라이브 등록
 * 2023.01.24    신기원              		 본인 라이브 목록 조회
 * </pre>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class LiveServiceTest {

	@Autowired
	private LiveService liveService;
	
	//라이브 목록 조회
	@Test
	public void test() {
		log.info(liveService.liveList());
	}
	
	//라이브 상세정보
	@Test
	public void testGetLiveInfo() {
		String liveId = "1";
		log.info(liveService.getLiveInfo(liveId));
	}
	
	@Test
	public void testGetReply() {
		String liveId = "live_134696";
		log.info(liveService.getReplayInfo(liveId));
	}
	
	@Test
	public void testSetLiveView() {
		LiveVO liveVO = new LiveVO();
        liveVO.setLiveId("1");
        log.info("live" + liveVO);
        liveService.setLiveView(liveVO);
        
	}
	
	@Test
	public void testCreateLive() {
		LiveVO liveVO  = new LiveVO();
		liveVO.setMId("123");
		liveVO.setLiveTitle("테스트");
		liveVO.setPsIndex(72);
		liveVO.setLiveStartDay(LocalDate.now().toString());
		liveVO.setLiveStartTime("2023-01-24 10:00");
		liveVO.setLiveEndTime("2023-01-24 14:00");
		try {
			liveService.createLive(liveVO);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		log.info(liveVO);
	}
	
	@Test
	public void testMyLiveList() {
		String mId = "4d";
		liveService.myLiveList(mId);
	}
	
	//라이브 저장
	@Test
	public void testSaveLive() {
		liveService.saveLiveVideo("1");
	}
	@Test
	public void testallVideoList() {
		liveService.recentVideoList();
	}


}
