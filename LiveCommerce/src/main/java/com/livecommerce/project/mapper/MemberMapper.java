package com.livecommerce.project.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;

import com.livecommerce.project.vo.MemberVO;
/**
 * @author �ű��
 * @since 2023.01.11
 * @version 1.0
 * 
 * <pre>
 * ������              	������                   ��������
 * ----------  --------    ---------------------------
 * 2023.01.11	�ű��		���� ����, ������ȸ, �α���, ���� ����
 * </pre>
 */
@Mapper
public interface MemberMapper {
	
	//ID�� ȸ�� ���� ��ȸ
	public MemberVO findById(String mid);
	
	//�α���
	public int join(MemberVO memberVO);
	
	//ȸ�� ���� ����
	public int changeInfo(MemberVO memberVO);
	
	//���̵� ã��
	public String findMyId(@Param("mname") String mname, @Param("mtel") String mtel);
	
	//��й�ȣ ã��
	public String findMyPassword(@Param("mid") String mid, @Param("mname") String mname, @Param("mtel") String mtel);
	
	/* 주문자 주소 정보 */
	public MemberVO getMemberInfo(String mid);
}
