package com.livecommerce.project.service;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.livecommerce.project.mapper.MemberMapper;
import com.livecommerce.project.vo.MemberVO;


/**
 * @author �ű��
 * @since 2023.01.12
 * @version 1.0
 * 
 * <pre>
 * ������                    ������                   ��������
 * ----------  --------    ---------------------------
 * 2023.01.12    �ű��                	 ���� ����

 * </pre>
 */

@Service
@Transactional(readOnly=true)
public class MemberServiceImpl implements MemberService{

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
     * �޼��� ���� : ��Ʈ�ѷ��� ���� ���� �н����� ��ȣȭ
     *
     * @param   memberVO
     * @return  String
     */
	
	private String password(String mpassword) {
		return encoder.encode(mpassword);
		
	}
	@Override
	public String join(MemberVO memberVO) {
//		memberVO.setMpassword(encoder.encode(memberVO.getMpassword()));
		memberVO.setMpassword(password(memberVO.getMpassword()));
//		memberVO.setm
		memberMapper.join(memberVO);
		return memberVO.getMid();
	}

	/**
     * �޼��� ���� : ȸ�� ��ȭ��ȣ, �̸���, �ּ� ����
     *
     * @param   memberVO
     * @return  int -> 1�̸� ����
     */
	@Override
	public int changeInfo(MemberVO memberVO) {
		memberVO.setMpassword(password(memberVO.getMpassword()));
		int result = memberMapper.changeInfo(memberVO);
		if(result > 0) return 1;
		return 0;
	}
	
	/**
     * �޼��� ���� : ȸ�� �̸��� ��ȭ��ȣ�� ���̵� ��ȸ
     *
     * @param   �̸�, ��ȭ��ȣ
     * @return  int -> 1�̸� ����
     */
	@Override
	public int findID(String mname, String mtel) {
		String result = memberMapper.findMyId(mname, mtel);
		if(result != null) return 1;
		return 0;
	}
	
}
