package com.livecommerce.project.service;

import com.livecommerce.project.vo.MemberVO;

/**
 * @author 신기원
 * @since 2023.01.12
 * @version 1.0
 * 
 * <pre>
 * 수정일              수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.12     신기원              최초 생성
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
	
	
}
