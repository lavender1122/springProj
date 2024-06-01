package kr.or.ddit.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import kr.or.ddit.mapper.MemberMapper;
import kr.or.ddit.vo.MemberVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class CustomUserDetailsService2 implements UserDetailsService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		log.info("CustomUserDetailsService2 ->username "+username);
		//select
		
		MemberVO memberVO =	this.memberMapper.detail(username);
		log.info("CustomUserDetailsService2-> memberVO"+memberVO);
		
		//User(스프링꺼)
		//CustomUser2(우리꺼)
		return memberVO==null?null:new CumstomUser2(memberVO);
	}

}
