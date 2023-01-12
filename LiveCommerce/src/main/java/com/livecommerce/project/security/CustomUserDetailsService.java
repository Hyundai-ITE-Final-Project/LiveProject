//package com.livecommerce.project.security;
//
//import java.util.ArrayList;
//import java.util.Collection;
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.security.core.authority.SimpleGrantedAuthority;
//import org.springframework.security.core.userdetails.UserDetails;
//import org.springframework.security.core.userdetails.UserDetailsService;
//import org.springframework.security.core.userdetails.UsernameNotFoundException;
//
//import com.livecommerce.project.vo.MemberVO;
//import com.livecommerce.project.mapper.MemberMapper;
//import com.livecommerce.project.security.CustomMember;
//
//import lombok.extern.log4j.Log4j;
///**
// * @author �ű��
// * @since 2022.10.18
// * @version 1.0
// * 
// * <pre>
// * ������                     ������                   ��������
// * ----------  --------    ---------------------------
// * 2022.10.18     �ű��              ���� ����
// * </pre>
// */
//
////DB���� VO��ü�� ������ ������ ����� ������ ��� UserDetails��ü�� �ٲٴ� ����
//@Log4j
//public class CustomUserDetailsService implements UserDetailsService {
//
//	@Autowired
//	private MemberMapper mapper;
//	
//	@Override
//	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
//		log.info("Load User" + username);
//		
//		
//		MemberVO vo = mapper.selectMember(username);
//		//VO�� ���̵�, �н�����, ���� ������ ������ UserDetails ��ü�� ����ش�
//		CustomMember user = new CustomMember(vo.getMid(), vo.getMpassword(), authorities(vo));
//		return user;
//	}
//	
//	// UserDetails�� ������ ��ȯ ���� VO�� mrole�� ��ġ ��Ű�� ���� �޼ҵ�
//	private static Collection authorities(MemberVO memberDTO){
//        Collection authorities = new ArrayList<>();
//        if(memberDTO.getMrole().equals("ADMIN")){
//            authorities.add(new SimpleGrantedAuthority("ADMIN"));
//        }else{
//            authorities.add(new SimpleGrantedAuthority("MEMBER"));
//        }
//        return authorities;
//    }
//
//}