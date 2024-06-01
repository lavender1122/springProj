package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;

@Slf4j
@Controller
public class LoginController {
	//DI/IoC
	//security-context.xml의 bean 등록되어 있음
	@Autowired
	PasswordEncoder passwordEncoder;
	
	@GetMapping("/login")
	public String loginForm(Model model) {
		
		//비밀번호 처리기 암호화
		String pwd = "java";
		
		//encode : 암호화 한다
		String encodedPwd = this.passwordEncoder.encode(pwd);
		log.info("encodedPwd:"+encodedPwd);
		
		//forwarding : jsp // /view/+ loginForm +.jsp
		return "loginForm";
	}
}
