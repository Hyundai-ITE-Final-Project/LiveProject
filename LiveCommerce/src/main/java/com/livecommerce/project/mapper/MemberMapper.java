package com.livecommerce.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.MemberVO;
/**
 * @author 신기원
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.11	신기원		최초 생성, 정보조회, 로그인, 정보 수정
 * </pre>
 */
@Mapper
public interface MemberMapper {
	
	//ID로 회원 정보 조회
	public MemberVO findById(String mid);
	
	//로그인
	public int join(MemberVO memberVO);
	
	//회원 정보 변경
	public int changeInfo(MemberVO memberVO);
	
	//아이디 찾기
	public String findMyId(@Param("mname") String mname, @Param("mtel") String mtel);
	
	//비밀번호 찾기
	public String findMyPassword(@Param("mid") String mid, @Param("mname") String mname, @Param("mtel") String mtel);
}
