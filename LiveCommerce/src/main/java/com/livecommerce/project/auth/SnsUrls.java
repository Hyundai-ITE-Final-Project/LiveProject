package com.livecommerce.project.auth;
/**
 * @author 박소은
 * @since 2023.01.28
 * @version 1.0
 * 
 * <pre>
 * 수정일              	수정자                   수정내용
2023.01.28		박소은		최초생성
 * </pre>
 */ 
public interface SnsUrls {
	static final String NAVER_ACCESS_TOKEN = "https://nid.naver.com/oauth2.0/token?grant_type=authorization_code";
	static final String NAVER_AUTH = "https://nid.naver.com/oauth2.0/authorize";

	static final String NAVER_PROFILE_URL = "https://openapi.naver.com/v1/nid/me";
}
