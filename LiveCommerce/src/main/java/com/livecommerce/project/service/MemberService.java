package com.livecommerce.project.service;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.Criteria;
import com.livecommerce.project.vo.MemberVO;
import com.livecommerce.project.vo.OrderVO;

/**
 * @author 신기원
 * @since 2023.01.12
 * @version 1.0
 * 
 * <pre>
 * 수정일              수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.12     신기원              최초 생성, 회원가입, 정보수정, 아이디 찾기
 * 2023.01.29           박소은		스트리밍 키 조회 및 업데이트 		
 * </pre>
 */
public interface MemberService {
	
	//회원가입
	public String join(MemberVO memberVO);
	
	//회원 정보 수정
	public int changeInfo(MemberVO memberVO);
	
	//아이디 찾기
	public int findID(String mname, String mtel);
	
	/* 주문자 정보 */
	public MemberVO getMemberInfo(String mid);
	
	
	
	/* 박소은 */
	
	/* 스트리밍 키 조회*/
	public String getStreamKey(String mid);
	
	/* 스트리밍 키 업데이트*/
	public String updateStreamKey(MemberVO memberVO);
	
	
	/* 전체 멤버 리스트 */
	public List<MemberVO> getMemberListAll(Criteria cri);
	
	/* 멤버 총 인원 */
	public int getMemberTotal(Criteria cri);
	
	/* 멤버 권한변경 */
	public int updateRole(String mid);
	
}
