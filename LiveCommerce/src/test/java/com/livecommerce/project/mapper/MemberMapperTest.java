package com.livecommerce.project.mapper;

import static org.junit.Assert.*;

import java.time.LocalDate;
import java.util.Date;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml"})
@Log4j
public class MemberMapperTest {

	@Autowired
	MemberMapper mapper;
	@Test
	public void test() {
//		MemberVO vo = new MemberVO();
//		vo.setMid("gd");
//		vo.setMpassword("gd");
//		vo.setMname("gd");
//		vo.setMtel("gd");
//		vo.setMbirth(LocalDate.now());
//		vo.setMemail("gd");
//		vo.setMgender(12);
//		vo.setMnickname("gd");
//		vo.setMjoindate(LocalDate.now());
//		vo.setMpoint(1);
		mapper.selectMember("gd");
	}

}
