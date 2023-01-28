package com.livecommerce.project.auth;

import java.time.LocalDate;

import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuth2AccessToken;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;
import com.livecommerce.project.vo.MemberVO;

/**
 * @author 박소은
 * @since 2023.01.28
 * @version 1.0
 * 
 * <pre>
 * 수정일             수정자                   수정내용
2023.01.28		박소은		최초생성
 * </pre>
 */ 


public class SNSLogin {
	private OAuth20Service oauthService;
	private SnsValue sns;
	
	public SNSLogin(SnsValue sns) {
		this.oauthService = new ServiceBuilder(sns.getClientId())
				.apiSecret(sns.getClientSecret())
				.callback(sns.getRedirectUrl())
				.scope("profile")
				.build(sns.getApi20Instance());
		
		this.sns = sns;
	}

	public String getNaverAuthURL() {
		return this.oauthService.getAuthorizationUrl();
	}
	
	public MemberVO getUserProfile(String code) throws Exception {
		OAuth2AccessToken accessToken = oauthService.getAccessToken(code);
		
		OAuthRequest request = new OAuthRequest(Verb.GET, this.sns.getProfileUrl());
		oauthService.signRequest(accessToken, request);
		
		Response response = oauthService.execute(request);
		return parseJson(response.getBody());
		
		
	}

	private MemberVO parseJson(String body) throws Exception {
		MemberVO memberVO = new MemberVO();
		LocalDate currentDate = LocalDate.now();
				
		
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(body);
		System.out.println(rootNode);
		
		JsonNode resNode = rootNode.get("response");
		if (this.sns.isNaver()) {
			
			memberVO.setMid(resNode.get("id").asText());
			memberVO.setMpassword("123456");
			memberVO.setMname(resNode.get("name").asText());
			memberVO.setMtel(resNode.get("mobile").asText());
			memberVO.setMemail(resNode.get("email").asText());
			memberVO.setMgender(resNode.get("gender").asText());
			memberVO.setMjoindate(currentDate);
			memberVO.setMpoint(0);
			memberVO.setMrole("user");
			memberVO.setMbirth(currentDate);
			memberVO.setMaddress1("미입력");
			memberVO.setMaddress2("미입력");
			memberVO.setMzipcode("미입력");
			
		}
		
		
		return memberVO;
	}

}
