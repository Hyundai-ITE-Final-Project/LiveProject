package com.livecommerce.project.mapper;

import org.apache.ibatis.annotations.Mapper;

import com.livecommerce.project.vo.MemberVO;

@Mapper
public interface MemberMapper {
	public MemberVO selectMember(String mid);
}
