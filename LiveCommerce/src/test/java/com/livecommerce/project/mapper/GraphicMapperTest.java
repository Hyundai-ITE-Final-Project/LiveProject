package com.livecommerce.project.mapper;

import static org.junit.Assert.*;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

/**
 * @author 신기원
 * @since 2023.02.02
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.02.02	신기원		최초 생성, 긍정, 부정 Text생성
 * </pre>
 */

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class GraphicMapperTest {
	
	@Autowired
	private GraphicMapper mapper;
	
	@Test
	public void testSelectPositive() {
		log.info(mapper.selectPositive("live_84694"));
	}
	
	@Test
	public void testSelectNegative() {
		log.info(mapper.selectNegative("live_84694"));
	}

}
