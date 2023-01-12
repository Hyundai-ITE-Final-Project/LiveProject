package com.livecommerce.project.service;

import com.livecommerce.project.vo.MemberVO;

/**
 * @author �ű��
 * @since 2023.01.12
 * @version 1.0
 * 
 * <pre>
 * ������              ������                   ��������
 * ----------  --------    ---------------------------
 * 2023.01.12     �ű��              ���� ����
 * </pre>
 */
public interface MemberService {
	
	//ȸ������
	public String join(MemberVO memberVO);
	
	//ȸ�� ���� ����
	public int changeInfo(MemberVO memberVO);
	
	//���̵� ã��
	public int findID(String mname, String mtel);
	
	/* 주문자 정보 */
	public MemberVO getMemberInfo(String mid);
	
	
}
