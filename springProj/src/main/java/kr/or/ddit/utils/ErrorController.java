package kr.or.ddit.utils;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class ErrorController {
	
	//요청URI : /error/error400
	@GetMapping("/error/error400")
	public String error400() {
		
		//forwarding: jsp
		return "error/error400";
	}
	//요청URI : /error/error404
	@GetMapping("/error/error404")
	public String error404() {
		
		//forwarding: jsp
		return "error/error404";
	}
	//요청URI : /error/error500
	@GetMapping("/error/error500")
	public String error500() {
		
		//forwarding: jsp
		return "error/error500";
	}
	//요청URI : /error/errorException
	@GetMapping("/error/errorException")
	public String errorException() {
		
		//forwarding: jsp
		return "error/errorException";
	}
	
}
