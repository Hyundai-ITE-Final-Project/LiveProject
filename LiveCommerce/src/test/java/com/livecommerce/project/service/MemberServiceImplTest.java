package com.livecommerce.project.service;

import static org.junit.Assert.*;

import java.time.LocalDate;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import com.livecommerce.project.mapper.MemberMapper;
import com.livecommerce.project.mapper.MemberMapperTest;
import com.livecommerce.project.vo.MemberVO;

import lombok.extern.log4j.Log4j;

@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration({"file:src/main/webapp/WEB-INF/spring/root-context.xml",
"file:src/main/webapp/WEB-INF/spring/security-context.xml" })
@Log4j
public class MemberServiceImplTest {

	 @Autowired public MemberService memberService;
	  
	 @Autowired public MemberMapper memberMapper;
	 
	 @Test public void testjoin() {
		 MemberVO vo = new MemberVO(); vo.setMid("4d");
		 vo.setMpassword("gd");
		 vo.setMname("gd");
		 vo.setMtel("gd");
		 vo.setMbirth(LocalDate.now());
		 vo.setMemail("gd");
		 vo.setMgender("��");
		 vo.setMrole("ADMIN");
		 vo.setMaddress1("�����");
		 vo.setMaddress2("�Ｚ��");
		 log.info(memberService.join(vo)); 
	 }
	  
	 @Test public void testChangeInfo() {
		 MemberVO vo = memberMapper.findById("3d"); vo.setMtel("010"); vo.setMemail("naver.com");
	 vo.setMaddress1("��⵵"); vo.setMaddress2("��õ��");
	 log.info(memberService.changeInfo(vo)); }
	  
	 @Test public void testID() { log.info(memberMapper.findMyId("gd", "010")); }
	 

}
