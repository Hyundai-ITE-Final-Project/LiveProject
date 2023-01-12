package com.livecommerce.project.service;

import com.livecommerce.project.vo.MemberVO;

public interface MemberService {
	/* 주문자 정보 */
	public MemberVO getMemberInfo(String mid);
}
