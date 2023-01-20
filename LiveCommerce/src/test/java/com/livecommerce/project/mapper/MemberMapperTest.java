package com.livecommerce.project.mapper;

import static org.junit.Assert.*;

import java.time.LocalDate;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.vo.MemberVO;

import lombok.extern.log4j.Log4j;
/**
 * @author 신기원
 * @since 2023.01.12
 * @version 1.0
 * 
 * <pre>
 * 수정일                     수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.12     신기원              최초 생성
 * </pre>
 */
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberMapperTest {

	@Autowired
	MemberMapper mapper;
	
	//아이디를 통해 회원 조회
	@Test
	public void test() {
		mapper.findById("gd");
		log.info(mapper);
	}
	
	//회원가입
	@Test
	public void testJoin() {
		MemberVO vo = new MemberVO();
		vo.setMid("8d");
		vo.setMpassword("gd");
		vo.setMname("gd");
		vo.setMtel("gd");
		vo.setMbirth(LocalDate.now());
		vo.setMemail("gd");
		vo.setMgender("남자");
		vo.setMrole("ADMIN");
		vo.setMaddress1("서울시");
		vo.setMaddress2("혜화");
		int r = mapper.join(vo);
		log.info(r);
	}
	
	//정보 수정
	@Test
	public void testInfo() {
		MemberVO vo = new MemberVO();
		vo.setMid("2d");
		vo.setMpassword("gd");
		vo.setMname("gd");
		vo.setMtel("11111");
		vo.setMbirth(LocalDate.now());
		vo.setMemail("@naver.com");
		vo.setMgender("남자");
		vo.setMjoindate(LocalDate.now());
		vo.setMrole("ADMIN");
		vo.setMaddress1("경기도");
		vo.setMaddress2("이천시");
		mapper.changeInfo(vo);
	}
	
	//아이디 찾기
	@Test 
	public void testMyId() {
		String id = mapper.findMyId("gd", "11111");
		log.info(id);
	}
	

}
