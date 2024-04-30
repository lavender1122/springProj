package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
//   @RequestMapping(value="/create", method=RequestMethod.POST)
//   public ModelAndView createPost(LprodVO lprodVO) {
////      log.info("createPost->lprodVO : " + lprodVO);
//      
//      int result = this.lprodService.createPost(lprodVO);
////      log.info("createPost->result : " + result);
//      
//      ModelAndView mav = new ModelAndView();
//      
//      // redirect : 새로운 URI 요청
//      mav.setViewName("redirect:/lprod/create");
//      
//      return mav;
//   }
   /* 
	요청URI :/lprod/createAjax
      요청파라미터(JSON->String : serialize) : {"lprodId": "14","lprodGu": "P501","lprodNm": "분식류"}
      요청방식 : post
    */
   @RequestMapping(value="/createAjax", method=RequestMethod.POST)
   public ResponseEntity<String> createAjax(@RequestBody LprodVO lprodVO) {
      log.info("createAjax->lprodVO : " + lprodVO);
	   
	   int result = this.lprodService.createPost(lprodVO);
       log.info("createPost->result : " + result);
	   
	   //HttpStatus.OK : HTTP 응답 상태 코드가 200(성공)
	   ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS",HttpStatus.OK);
	   return entity;
   }
   
   /*
   요청URI : /lprod/list
   요청파라미터 : 
   요청방식 : get
   */
   /*
   요청URI : /lprod/list?keyword=알탄 or /list or /list?keyword=
   요청파라미터 : keyword=알탄
   요청방식 : get
 */
   @RequestMapping(value="/list", method=RequestMethod.GET)
   public ModelAndView list(ModelAndView mav,
		   @RequestParam(value="keyword",required = false,defaultValue = "") String keyword) {
      log.info("list에 왔다");
      log.info("list keyword ->"+keyword);
      
      Map<String, Object> map = new HashMap<String, Object>();
      map.put("keyword",keyword);
      
      //Model(데이터)
      //상품분류 목록
      List<LprodVO> lprodVOList = this.lprodService.list(map);
      log.info("list->lprodVOList : " + lprodVOList);
      
      mav.addObject("lprodVOList", lprodVOList);
      
      //View(jsp)
      mav.setViewName("lprod/list");
      
      return mav;
   }
   /*
   요청URI : /lprod/listAjax
   요청파라미터 :(JSON-Stirng):{"keyword":"P1"}
   요청방식 : Post
 */
   //통신은 String으로 해야한다!
   //@ResponseBody : List -> String(serialize) 
   @ResponseBody
   @RequestMapping(value="/listAjax", method=RequestMethod.POST)
   public List<LprodVO> listAjax(@RequestBody Map<String,Object> map) {
	   log.info("list에 왔다");
	   log.info(""+map);
	   
//	   Map<String, Object> map = new HashMap<String, Object>(); //스프링에서 자동으로 해중
//	   map.put("keyword","");
	   
	   //Model(데이터)
	   //상품분류 목록
	   List<LprodVO> lprodVOList = this.lprodService.list(map);
	   log.info("list->lprodVOList : " + lprodVOList);
	   
	   //ResponseEntity 사용하지 않고 @ResponseBody 사용
//	   ResponseEntity<List<LprodVO>> entity = new ResponseEntity<List<LprodVO>>(lprodVOList,HttpStatus.OK);
	   
	   return lprodVOList;
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
//	      log.info("detail->lprodVO s: " + lprodVO);
	   lprodVO = this.lprodService.detail(lprodVO);
//	   log.info("lprodVO>>"+lprodVO);
	   mav.addObject("lprodVO", lprodVO);
	   //forwarding : jsp
	   mav.setViewName("lprod/detail");
	   return mav;
   }
   /*
   요청URI : /lprod/updatePost
    요청파라미터 : {lprodId=9, lprodGu=P403, lprodNm=문구류2}
    요청방식 : post
    */
   //파라미터 안에 있는 ModelAndView => 자동으로 객체 생성
//   @RequestMapping(value = "updatePost", method=RequestMethod.POST)
//   public ModelAndView updatePost(LprodVO lprodVO
//		   ,ModelAndView mav) {
////	   log.info("updatePost -> lprodVO : "+lprodVO);
//	   //Model
//	   int result = this.lprodService.updatePost(lprodVO);
//	   log.info("update+result"+result);
//	   //View : redirect(새로운 URI 요청)
//	   mav.setViewName("redirect:/lprod/detail?lprodGu="+lprodVO.getLprodGu());
//	   
//	   return mav;
//   }
   /*
   요청URI : /lprod/updateAjax
    요청파라미터 : {lprodId: '14', lprodGu: 'P102', lprodNm: '전자제품'}
    요청방식 : post
    */
   @RequestMapping(value = "updateAjax", method=RequestMethod.POST)
   public ResponseEntity<LprodVO> updateAjax(@RequestBody LprodVO lprodVO) {
	   log.info("updateAjax -> lprodVO : "+lprodVO);
	   int result = this.lprodService.updatePost(lprodVO);
	   log.info("update+result"+result);
	   
	   ResponseEntity<LprodVO> entity
	   	 =new ResponseEntity<LprodVO>(lprodVO, HttpStatus.OK);
	   	 return entity;
   }
//   @RequestMapping(value = "deletePost",method=RequestMethod.POST)
//   public ModelAndView deletePost(LprodVO lprodVO
//		   ,ModelAndView mav) {
//	   log.info("deletePost ->"+lprodVO);
//	   int result= this.lprodService.deletePost(lprodVO);
//	   log.info("deletePost result"+result);
//	   mav.setViewName("redirect:/lprod/list");
//	   return mav;
//   }
   @RequestMapping(value = "deleteAjax",method=RequestMethod.POST)
   public ResponseEntity<LprodVO> deleteAjax(@RequestBody LprodVO lprodVO) {
	   log.info("deleteAjax ->"+lprodVO);
	   int result= this.lprodService.deletePost(lprodVO);
	   log.info("deletePost result"+result);
	   ResponseEntity<LprodVO> entity = new ResponseEntity<LprodVO>(lprodVO,HttpStatus.OK);
	   return entity;
   }
  
}