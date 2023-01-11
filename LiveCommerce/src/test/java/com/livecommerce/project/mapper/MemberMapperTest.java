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

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberMapperTest {

	@Autowired
	MemberMapper mapper;
	@Test
	public void test() {
		mapper.findById("gd");
		log.info(mapper);
	}
	
	@Test
	public void testJoin() {
		MemberVO vo = new MemberVO();
		vo.setMid("2d");
		vo.setMpassword("gd");
		vo.setMname("gd");
		vo.setMtel("gd");
		vo.setMbirth(LocalDate.now());
		vo.setMemail("gd");
		vo.setMgender("남");
		vo.setMjoindate(LocalDate.now());
		vo.setMrole("ADMIN");
		vo.setMaddress1("서울시");
		vo.setMaddress2("삼성동");
		int r = mapper.join(vo);
		log.info("결과확인 : " +r);
	}
	
	@Test
	public void testInfo() {
		MemberVO vo = new MemberVO();
		vo.setMid("2d");
		vo.setMpassword("gd");
		vo.setMname("gd");
		vo.setMtel("11111");
		vo.setMbirth(LocalDate.now());
		vo.setMemail("@naver.com");
		vo.setMgender("남");
		vo.setMjoindate(LocalDate.now());
		vo.setMrole("ADMIN");
		vo.setMaddress1("서울시??");
		vo.setMaddress2("삼성동!!");
		mapper.changeInfo(vo);
	}
	
	@Test 
	public void testMyId() {
		String id = mapper.findMyId("gd", "11111");
		log.info("ID찾기 성공 : " + id);
	}
	
	@Test 
	public void testMyPassword() {
		String id = mapper.findMyPassword("2d", "gd", "11111");
		log.info("ID찾기 성공 : " + id);
	}
}
