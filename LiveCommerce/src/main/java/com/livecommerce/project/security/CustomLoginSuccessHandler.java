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
 * @author 신기원
 * @since 2022.10.18
 * @version 1.0
 * 
 * <pre>
 * 수정일              수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2022.10.18   신기원              최초 생성
 * 2022.10.25	신기원	   USER_MEMBER 리다이렉트 위치 지정
 * </pre>
 */

//로그인 성공시 동작하는 이벤트 핸들러
@Log4j
public class CustomLoginSuccessHandler implements AuthenticationSuccessHandler {

	@Override
	public void onAuthenticationSuccess(HttpServletRequest request, HttpServletResponse response,
			Authentication auth) throws IOException, ServletException {
		
		List<String> roleNames = new ArrayList<>();
		
		//계정의 권한 목록을 가져와서 리스트에 담는다
		auth.getAuthorities().forEach(authority -> {
			roleNames.add(authority.getAuthority());
		});
		log.info("success");
		
		//권한이 관리자면 관리자 페이지 그 외는 메인페이지로 전송
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