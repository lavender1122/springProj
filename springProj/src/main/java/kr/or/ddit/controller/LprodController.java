package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.LprodService;
import kr.or.ddit.vo.LprodVO;
import lombok.extern.slf4j.Slf4j;

/*
Controller 어노테이션
스프링 프레임워크에게 "이 클래스는 웹 브라우저의 요청(request)를
받아들이는 컨트롤러야" 라고 알려주는 것임.
스프링은 servlet-context.xml의 context:component-scan의 설정에 의해
이 클래스를 자바빈 객체로 등록(메모리에 바인딩).
*/
//스프링 프레임워크에게 "이 클래스는 컨트롤러야"라고 알려주자
@Slf4j
@RequestMapping("/lprod")
@Controller
public class LprodController {
   
   //서비스를 호출하기 위해 의존성 주입(Dependency Injection-DI)
   //IoC(Inversion of Control) - 제어의 역전.(개발자가 객체생성하지 않고 스프링이 객체를 미리 생성해놓은 것을 개발자가 요청)
   // DI - 의존성 주입(Dependency Injection) : 이미 만들어져 있는 BookServiceImpl.java를 @Service로 가져다씀
   @Autowired
   LprodService lprodService;
   
   /*
   요청URI : /lprod/create
   요청파라미터 : 
   요청방식 : get
    */
   @RequestMapping(value="/create",method=RequestMethod.GET)
   public ModelAndView create() {
      ModelAndView mav = new ModelAndView();
      
      // 데이터
      mav.addObject("title", "상품분류 등록");
      
      // jsp
      // /WEB-INF/views/ + lprod/create +     .jsp
      mav.setViewName("lprod/create");
      
      return mav;
   }
   
   /* 
   요청URI : /lprod/create
   요청파라미터 : {lprodId=14, lprodGu=P501, lprodNm=분식류}
   요청방식 : post
   */
   @RequestMapping(value="/create", method=RequestMethod.POST)
   public ModelAndView createPost(LprodVO lprodVO) {
      log.info("createPost->lprodVO : " + lprodVO);
      
      int result = this.lprodService.createPost(lprodVO);
      log.info("createPost->result : " + result);
      
      ModelAndView mav = new ModelAndView();
      
      // redirect : 새로운 URI 요청
      mav.setViewName("redirect:/lprod/create");
      
      return mav;
   }
   
   /*
   요청URI : /lprod/list
   요청파라미터 : 
   요청방식 : get
   */
   @RequestMapping(value="/list", method=RequestMethod.GET)
   public ModelAndView list(ModelAndView mav) {
      log.info("list에 왔다");
      
      //Model(데이터)
      //상품분류 목록
      List<LprodVO> lprodVOList = this.lprodService.list();
      log.info("list->lprodVOList : " + lprodVOList);
      
      mav.addObject("lprodVOList", lprodVOList);
      
      //View(jsp)
      mav.setViewName("lprod/list");
      
      return mav;
   }
   /*
   요청URI : /lprod/detail?lprodGu=P101
   요청파라미터 : lprodGu=P101
   요청방식 : get
   
   리턴타입 : ModelAndView
   View : lprod > detail.jsp 
   ModelAndView : 클래스
   detail(ModelAndView mav) => 스프링이 mav 객체 자동
   */
   @RequestMapping(value = "/detail", method =RequestMethod.GET)
   public ModelAndView detail(LprodVO lprodVO,ModelAndView mav) {
	   log.info("detail 왔다");
	 //Model
	      // lprod_SQL.xml 의 namespace인 lprod내의 id값인 detail에 접근하여
	      // SELECT LPROD_ID, LPROD_GU, LPROD_NM
	    // FROM     LPROD
	     // WHERE  LPROD_GU = 'P101'
	    // 을 처리한 후 다음이 콘솔에 출력되도록 해보자
	      log.info("detail->lprodVO : " + lprodVO);
	   lprodVO = this.lprodService.detail(lprodVO);
	   log.info("lprodVO>>"+lprodVO);
	   mav.addObject("lprodVO", lprodVO);
	   //forwarding : jsp
	   mav.setViewName("lprod/detail");
	   return mav;
   }
  
}