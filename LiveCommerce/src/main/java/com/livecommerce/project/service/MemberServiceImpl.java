package com.livecommerce.project.service;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.livecommerce.project.mapper.MemberMapper;
import com.livecommerce.project.vo.MemberVO;

/**
 * @author 신기원
 * @since 2023.01.12
 * @version 1.0
 * 
 *          <pre>
 * 수정일                    수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2023.01.12    신기원                	 최초 생성
 * 2023.01.29	박소은		스트리밍 키 조회 및 수정 
 * 
 *          </pre>
 */

@Service
@Transactional(readOnly = true)
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberMapper memberMapper;

	/* 주문자 정보 */
	@Override
	public MemberVO getMemberInfo(String mid) {

		return memberMapper.getMemberInfo(mid);

	}

	@Autowired
	private PasswordEncoder encoder;

	/**
	 * 메서드 설명 : 컨트롤러로 전달 받은 패스워드 암호화
	 *
	 * @param memberVO
	 * @return String
	 */

	private String password(String mpassword) {
		return encoder.encode(mpassword);

	}

	@Override
	public String join(MemberVO memberVO) {
		memberVO.setMpassword(password(memberVO.getMpassword()));
		memberMapper.join(memberVO);
		return memberVO.getMid();
	}

	/**
	 * 메서드 설명 : 회원 전화번호, 이메일, 주소 변경
	 *
	 * @param memberVO
	 * @return int -> 1이면 성공
	 */
	@Override
	public int changeInfo(MemberVO memberVO) {
		// memberVO.setMpassword(password(memberVO.getMpassword()));
		int result = memberMapper.changeInfo(memberVO);
		if (result > 0)
			return 1;
		return 0;
	}

	/**
	 * 메서드 설명 : 회원 이름과 전화번호로 아이디 조회
	 *
	 * @param 이름, 전화번호
	 * @return int -> 1이면 성공
	 */
	@Override
	public int findID(String mname, String mtel) {
		String result = memberMapper.findMyId(mname, mtel);
		if (result != null)
			return 1;
		return 0;
	}

	/* 박소은 작성 */

	/* 스트리밍 키 조회 */
	@Override
	public String getStreamKey(String mid) {

		return memberMapper.getStreamKey(mid);

	}

	@Override
	public String updateStreamKey(MemberVO memberVO) {
		System.out.println("우레레레레레렐레레");
		UUID uuid = UUID.randomUUID();
		String stream = "live_" + uuid.toString();
		memberVO.setStreamKey(stream);
		memberMapper.updateStreamKey(memberVO);
		return stream;
	}

}
