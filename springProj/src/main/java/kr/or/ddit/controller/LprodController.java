package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.LprodService;
import kr.or.ddit.vo.LprodVO;
import lombok.extern.slf4j.Slf4j;

//1.스프림 프레임워크에게 "이 클래스는  컨트롤러야" 라고 알려주자
//스프링은 servlet-context.xml의 context:component-scan의 설정에 의해
//이 클래스를 자바빈 객체로 등록(메모리에 바인딩).
@Slf4j //롬깅
@RequestMapping("/lprod") // 클래스 레벨에서 url 처리
@Controller //객체로 만들어서 메모리에 올려버림
public class LprodController { 
	//서비스를 호출하기 위해 의존성 주입(Dependency Injection-DI)
	//IoC(Inversion of Control) - 제어의 역전.(개발자가 객체생성하지 않고 스프링이 객체를 미리 생성해놓은 것을 개발자가 요청)
	//의존성 ( Injection)
	@Autowired
	LprodService lprodService;
	   /*
    요청URI : /lprod/create
    요청파라미터 : 
    요청방식 : get
    */
	@RequestMapping(value="/create",method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		//데이터
		mav.addObject("title", " 상품분류 등록");
		//jsp 경로
		// /WEB-INF/views/+ lprod/create+.jsp
		mav.setViewName("lprod/create");
		return mav;
	}
	/*
	 	요청URI : /lprod/create
    	요청파라미터 : {lprodId=14, lprodGu=P501, lprodNm=분식류}
    	요청방식 : post
	 */
	@RequestMapping(value="/create",method = RequestMethod.POST) //lprod => 클래스 레벨에서 처리중?
	public ModelAndView  createPost(LprodVO lprodVO) {
		log.info("createPost -> lprodVO:"+lprodVO);
		//상품 등록
		int result =this.lprodService.createPost(lprodVO);
		log.info("createPost.result"+result);
		
		ModelAndView mav = new ModelAndView();
		
		//redirect => 새로운 url 요청
		mav.setViewName("redirect:/lprod/create");
		
		return mav;
	}
	/*
	 
	 
	 */

}
