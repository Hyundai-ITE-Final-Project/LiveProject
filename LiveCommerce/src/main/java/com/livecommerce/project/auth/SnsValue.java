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
import lombok.Data;

@Data
public class SnsValue implements SnsUrls{
	
	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	private DefaultApi20 api20Instance;
	private String profileUrl;
	
	private boolean isNaver;
	
	public SnsValue(String service, String clientId, String clientSecret, String redirectUrl) {
		this.service = service;
		this.clientId = clientId;
		this.clientSecret = clientSecret;
		this.redirectUrl = redirectUrl;
		
		this.isNaver = service.equals("naver");
		
		
		if (isNaver) {
			this.api20Instance = NaverAPI20.instance();
			this.profileUrl = NAVER_PROFILE_URL;
		}
	}

}
