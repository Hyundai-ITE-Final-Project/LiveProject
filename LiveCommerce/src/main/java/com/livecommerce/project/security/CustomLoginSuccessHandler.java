package com.livecommerce.project.security;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.core.Authentication;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import lombok.extern.log4j.Log4j;
/**
 * CustomLoginSuccessHandler
 * @author �ű��
 * @since 2022.10.18
 * @version 1.0
 * 
 * <pre>
 * ������              ������                   ��������
 * ----------  --------    ---------------------------
 * 2022.10.18   �ű��              ���� ����
 * 2022.10.25	�ű��	   USER_MEMBER �����̷�Ʈ ��ġ ����
 * </pre>
 */

//�α��� ������ �����ϴ� �̺�Ʈ �ڵ鷯
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		List<String> roleNames = new ArrayList<>();
		
		//������ ���� ����� �����ͼ� ����Ʈ�� ��´�
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		log.info("success");
		
		//������ �����ڸ� ������ ������ �� �ܴ� ������������ ����
		if(roleNames.contains("ADMIN")) {
			response.sendRedirect("/member/admin");
			return;
		} else if(roleNames.contains("USER")) {
			response.sendRedirect("/");
			return;
		}
		
		response.sendRedirect("/");
	}

}