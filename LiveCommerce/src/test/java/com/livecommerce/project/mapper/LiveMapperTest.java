package com.livecommerce.project.mapper;

import static org.junit.Assert.*;

import java.time.LocalDateTime;

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

}
