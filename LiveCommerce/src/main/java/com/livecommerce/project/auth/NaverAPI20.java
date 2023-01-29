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
import com.github.scribejava.core.builder.api.DefaultApi20;

public class NaverAPI20 extends DefaultApi20 implements SnsUrls{
	
	private NaverAPI20() {
		
	}
	
	private static class InstanceHolder{
		private static final NaverAPI20 INSTANCE = new NaverAPI20();
	}
	
	public static NaverAPI20 instance() {
		return InstanceHolder.INSTANCE; 
		
	}

	@Override
	public String getAccessTokenEndpoint() {
		 return NAVER_ACCESS_TOKEN;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return NAVER_AUTH;
	}

}
