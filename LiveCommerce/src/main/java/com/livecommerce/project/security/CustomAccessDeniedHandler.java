package com.livecommerce.project.security;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

import lombok.extern.log4j.Log4j;
/**
 * CustomAccessDeniedHandler
 * @author �ű��
 * @since 2022.10.17
 * @version 1.0
 * 
 * <pre>
 * ������              ������                   ��������
 * ----------  --------    ---------------------------
 * 2022.10.17   �ű��              ���� ����
 * </pre>
 */

//�����Ϸ��� �������� ������ ������ �����ϴ� �̺�Ʈ �ڵ鷯
@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler{@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		log.error("Access Denied Handler");
		
		log.error("�̰� ��ū�� ���ų� ������ ���°ž�");
		
		response.sendRedirect("/error");
	}
	
}