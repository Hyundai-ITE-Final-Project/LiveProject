package com.livecommerce.project.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.Criteria;
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
 * 2023.01.29       박소은		스트리밍 키 조회 및 수정
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
	
	/* 주문자 주소 정보 */
	public MemberVO getMemberInfo(String mid);
	
	
	/* 스트리밍 키 조회 */
	public String getStreamKey(String mid);
	
	/* 스트리밍 키 변경 */
	public int updateStreamKey(MemberVO memberVO); 
	
	/* 전체 멤버 리스트 */
	public List<MemberVO> getMemberListAll(Criteria cri);
	
	/* 멤버 총 인원 */
	public int getMemberTotal(Criteria cri);
	
	/* 멤버 권한변경 */
	public int updateRole(@Param("mid")String mid);
}
