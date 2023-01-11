package com.livecommerce.project.security;


import java.util.Collection;

import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.User;
/**
 * @author �ű��
 * @since 2022.10.18
 * @version 1.0
 * 
 * <pre>
 * ������                     ������                   ��������
 * ----------  --------    ---------------------------
 * 2022.10.18     �ű��              ���� ����
 * </pre>
 */

//UserDetails ��ü�� �����ϴ� User ����ü�� ����ϴ� Ŭ����(����� ������ ��� ����)
public class CustomMember extends User{
	

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	public CustomMember(String username, String password, Collection<? extends GrantedAuthority> authorities) {
		super(username, password, authorities);
	}


}