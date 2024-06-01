package kr.or.ddit.controller;

import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.slf4j.Slf4j;


@Slf4j
@Controller
public class SecurityController {
	//인증(Authentication) 거부
	//요청URI : /accessError
	
	@GetMapping("/accessError")
	public String accessError(Authentication auth,Model model) {
		//인증과 관련된 정보를 확인해보자
		log.info("access Denied"+auth);
		
		model.addAttribute("msg", "access Denied");
		
		//forwarding
		return "accessError";
	}
}
