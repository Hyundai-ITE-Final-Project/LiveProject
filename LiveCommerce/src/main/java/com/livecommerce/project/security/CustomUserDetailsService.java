package com.livecommerce.project.security;

import java.util.ArrayList;
import java.util.Collection;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;

import com.livecommerce.project.vo.MemberVO;
import com.livecommerce.project.mapper.MemberMapper;
import com.livecommerce.project.security.CustomMember;

import lombok.extern.log4j.Log4j;
/**
 * @author 신기원
 * @since 2022.10.18
 * @version 1.0
 * 
 * <pre>
 * 수정일                     수정자                   수정내용
 * ----------  --------    ---------------------------
 * 2022.10.18     신기원              최초 생성
 * </pre>
 */

//DB에서 VO객체의 정보를 가져와 사용자 정보를 담는 UserDetails객체로 바꾸는 서비스
@Log4j
public class CustomUserDetailsService implements UserDetailsService {

	@Autowired
	private MemberMapper mapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("Load User" + username);
		
		
		MemberVO vo = mapper.selectMember(username);
		//VO의 아이디, 패스워드, 권한 정보를 가져와 UserDetails 객체로 담아준다
		CustomMember user = new CustomMember(vo.getMid(), vo.getMpassword(), authorities(vo));
		return user;
	}
	
	// UserDetails의 권한의 반환 값과 VO의 mrole을 일치 시키기 위한 메소드
	private static Collection authorities(MemberVO memberDTO){
        Collection authorities = new ArrayList<>();
        if(memberDTO.getMrole().equals("ADMIN")){
            authorities.add(new SimpleGrantedAuthority("ADMIN"));
        }else{
            authorities.add(new SimpleGrantedAuthority("MEMBER"));
        }
        return authorities;
    }

}