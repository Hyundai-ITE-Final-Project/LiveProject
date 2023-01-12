package com.livecommerce.project.mapper;

/* 
 * 작성자 : 김민석
 * 작성일 : 2022.10.17.월
 * QnaMapperTests : QnaMapper.xml을 test 자바소스
 */
import java.sql.Timestamp;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;

import lombok.extern.log4j.Log4j;

@Log4j
@RunWith(SpringJUnit4ClassRunner.class)
@ContextConfiguration("file:src/main/webapp/WEB-INF/spring/root-context.xml")
public class OrderMapperTests {

	@Autowired
	private OrderMapper ordermapper;			//MemberMapper.java �������̽� ������ ����
	
//	//���� �Է� �׽�Ʈ �޼ҵ�
//	@Test
//	public void qnaInsert() throws Exception{
//		QnaVO qna = new QnaVO();
//		
////		qna.setMId("bansongs");
//		qna.setQTitle("test");			//��������
//		qna.setQContent("test");		//���ǳ���
//		qna.setQDate(new Timestamp(System.currentTimeMillis()));		//���ǳ�¥
//		qna.setQReplyDate(new Timestamp(System.currentTimeMillis()));		//����ȸ�ų�¥
////		qna.setQReplyTitle("test");		//����ȸ������
////		qna.setQReplyContent("test");	//����ȸ�ų���
////		qna.setQManager("bansongs");
////		qna.setMNo(1);
//		qnamapper.qnaInsert(qna);
//		
//		log.info(qna);
//		
//	}
	
//	@Test
//	public void orderSelect() throws Exception{	
//		
//		int pid= 1;
//		List<QnaDTO> list = qnamapper.qnaSelect(qna);
//	    System.out.println(list);
//	}
	
//	@Test
//	public void qnaDelete() throws Exception {
//		int qid = 26;
//		qnamapper.qnaDelete(qid);
//		System.out.println("삭제성공");
//	}
	
//	@Test
//	public void memberIdChk() throws Exception {
//		String id = "test3";
//		String id2 = "test123";
//		membermapper.idCheck(id);
//		membermapper.idCheck(id2);
//		System.out.println(membermapper.idCheck(id));
//		System.out.println(membermapper.idCheck(id2));
//	}
	
//	 /* �α��� ���� mapper �޼��� �׽�Ʈ */
//	@Test
//	public void memberLogin() throws Exception {
//		MemberVO member = new MemberVO();
//		
//		member.setMemberId("test3");
//		member.setMemberPw("test3");
//		membermapper.memberLogin(member);
//		System.out.println("��� �� : " + membermapper.memberLogin(member));
//	}
	
	
	
}
