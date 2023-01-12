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
 * @author 신기원
 * @since 2022.10.17
 * @version 1.0
 * 
 * <pre>
 * 수정일              수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2022.10.17   신기원              최초 생성
 * </pre>
 */

//접속하려는 페이지에 권한이 없으면 동작하는 이벤트 핸들러
@Log4j
public class CustomAccessDeniedHandler implements AccessDeniedHandler{@Override
	public void handle(HttpServletRequest request, HttpServletResponse response,
			AccessDeniedException accessDeniedException) throws IOException, ServletException {
		log.error("Access Denied Handler");
		
		log.error("�̰� ��ū�� ���ų� ������ ���°ž�");
		
		response.sendRedirect("/error");
	}
	
}