package com.livecommerce.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.livecommerce.project.mapper.MemberMapper;
import com.livecommerce.project.vo.MemberVO;


@Service
@Transactional(readOnly=true)
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberMapper membermapper;
	/* 주문자 정보 */
	@Override
	public MemberVO getMemberInfo(String mid) {
		
		return membermapper.getMemberInfo(mid);
		
	}
}
