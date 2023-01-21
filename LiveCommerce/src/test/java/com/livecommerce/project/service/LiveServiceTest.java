package com.livecommerce.project.service;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.LiveVO;

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
	public void testSetLiveView() {
		LiveVO liveVO = new LiveVO();
        liveVO.setLiveId("1");
        log.info("live" + liveVO);
        liveService.setLiveView(liveVO);
        
	}

}
