package kr.or.ddit.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.LprodService;
import kr.or.ddit.utils.ArticlePage;
import kr.or.ddit.vo.LprodVO;
import kr.or.ddit.vo.ProductVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

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

	// 서비스를 호출하기 위해 의존성 주입(Dependency Injection-DI)
	// IoC(Inversion of Control) - 제어의 역전.(개발자가 객체생성하지 않고 스프링이 객체를 미리 생성해놓은 것을 개발자가
	// 요청)
	// DI - 의존성 주입(Dependency Injection) : 이미 만들어져 있는 BookServiceImpl.java를
	// @Service로 가져다씀
	@Autowired
	LprodService lprodService;

	/*
	 * 요청URI : /lprod/create 요청파라미터 : 요청방식 : get
	 */
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create(LprodVO lprodVO) {
		ModelAndView mav = new ModelAndView();

		// 데이터
		mav.addObject("title", "상품분류 등록");

		// jsp
		// /WEB-INF/views/ + lprod/create + .jsp
		mav.setViewName("lprod/create");

		return mav;
	}

	   /* 
	   요청URI : /lprod/create
	   요청파라미터 : {lprodId=14, lprodGu=P501, lprodNm=분식류}
	   요청방식 : post
	   
	   */
	   @RequestMapping(value="/create", method=RequestMethod.POST)
	   public String createPost(
			  @Valid @ModelAttribute(value="lprodvo") LprodVO lprodVO
			   ,BindingResult brResult) {
	      log.info("createPost->lprodVO : " + lprodVO);
	      
	      log.info("createPost -> brResult.hasErrors():"+brResult.hasErrors());
	      if(brResult.hasErrors()) {//true(오류발생)
	    	//검사 결과 오류 확인
	          List<ObjectError> allErrors = brResult.getAllErrors();
	          //객체와 관련된 오류
	          List<ObjectError> globalErrors 
	             =  brResult.getGlobalErrors();
	          //멤버변수와 관련된 오류
	          List<FieldError> fieldErrors 
	             =  brResult.getFieldErrors();
	          
	          for(ObjectError objectError : allErrors) {
	             log.info("allError : " + objectError);
	          }
	          
	          for(ObjectError objectError : globalErrors) {
	             log.info("globalError : " + objectError);
	          }
	          
	          for(FieldError fieldError : fieldErrors) {
	             log.info("fieldError : " + fieldError);
	          }
	    	  
	    	  return"lprod/create";
	    	  
	      }
	      
	      int result = this.lprodService.createPost(lprodVO);
	      log.info("createPost->result : " + result);
	      
	      ModelAndView mav = new ModelAndView();
	      
	      // redirect : 새로운 URI 요청
//	      mav.setViewName("redirect:/lprod/create");
	      
	      return "redirect:/lprod/create";
	   }
	/*
	 * 요청URI :/lprod/createAjax 요청파라미터(JSON->String : serialize) : {"lprodId":
	 * "14","lprodGu": "P501","lprodNm": "분식류"} 요청방식 : post
	 */
	@RequestMapping(value = "/createAjax", method = RequestMethod.POST)
	public ResponseEntity<String> createAjax(@RequestBody LprodVO lprodVO) {
//		log.info("createAjax->lprodVO : " + lprodVO);

//		int result = this.lprodService.createPost(lprodVO);
//		log.info("createPost->result : " + result);

		// HttpStatus.OK : HTTP 응답 상태 코드가 200(성공)
		ResponseEntity<String> entity = new ResponseEntity<String>("SUCCESS", HttpStatus.OK);
		return entity;
	}
	
	/*
	 * 요청URI :/lprod/createFormData 
	 * 요청파라미터
	 *  요청방식 : post
	 */
	@ResponseBody
	@PostMapping("/createFormData")
	public String createFormData(LprodVO lprodVO) {
		
		log.info("createFormData->lprodVO :"+lprodVO);
		
//		int result = this.lprodService.createPost(lprodVO);
//		log.info("createFormData->result : " + result);
		
		// HttpStatus.OK : HTTP 응답 상태 코드가 200(성공)
		return "SUCCESS";
	}

	/*
	 * 요청파라미터 : {keyword=개똥이} 또는 {currentPage=2 keyword=개똥이}
	 * 요청방식 : get
	 */
	/*
	 * 요청URI : /lprod/list?keyword=알탄 or /list or /list?keyword= 요청파라미터 : keyword=알탄
	 * 요청방식 : get
	 * 요청URI : /lprod/list or/lpord/list?currentPage=2 or lprod/list?currentPage=
	 */
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav,
			@RequestParam(value = "currentPage",required = false,defaultValue = "1")int currentPage,//있어도 되고 없어도 된다 기본값 1로 설정
			@RequestParam(value = "keyword", required = false, defaultValue = "") String keyword) {
		log.info("list에 왔다");

//		System.out.println(10/0); //일부러 에러 나게 함
		log.info("list keyword ->" + keyword);

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword", keyword);
		map.put("currentPage",currentPage);
		
		//전체 행의 수
		int total = this.lprodService.getTotal(map);
		log.info("list -> total:"+total);

		// Model(데이터)
		// 상품분류 목록
		List<LprodVO> lprodVOList = this.lprodService.list(map);
		log.info("list->lprodVOList : " + lprodVOList);

		mav.addObject("articlePage", new ArticlePage<LprodVO>(total,currentPage,10,lprodVOList,keyword));

		// View(jsp)
		mav.setViewName("lprod/list");

		return mav;
	}

	/*
	 * 요청URI : /lprod/listAjax 요청파라미터 :(JSON-Stirng):{"keyword":"P1"} 요청방식 : Post
	 */
	// 통신은 String으로 해야한다!
	// @ResponseBody : List -> String(serialize)
	@ResponseBody
	@RequestMapping(value = "/listAjax", method = RequestMethod.POST)
	public List<LprodVO> listAjax(@RequestBody Map<String, Object> map) {
		log.info("list에 왔다");
		log.info("" + map);

//	   Map<String, Object> map = new HashMap<String, Object>(); //스프링에서 자동으로 해중
//	   map.put("keyword","");

		// Model(데이터)
		// 상품분류 목록
		List<LprodVO> lprodVOList = this.lprodService.list(map);
		log.info("list->lprodVOList : " + lprodVOList);

		// ResponseEntity 사용하지 않고 @ResponseBody 사용
//	   ResponseEntity<List<LprodVO>> entity = new ResponseEntity<List<LprodVO>>(lprodVOList,HttpStatus.OK);

		return lprodVOList;
	}

	/*
	 * 요청URI : /lprod/detail?lprodGu=P101 요청파라미터 : lprodGu=P101 요청방식 : get
	 * 
	 * 리턴타입 : ModelAndView View : lprod > detail.jsp ModelAndView : 클래스
	 * detail(ModelAndView mav) => 스프링이 mav 객체 자동
	 */
	@RequestMapping(value = "/detail", method = RequestMethod.GET)
	public ModelAndView detail(LprodVO lprodVO, ModelAndView mav) {
		log.info("detail 왔다");
		// Model
		// lprod_SQL.xml 의 namespace인 lprod내의 id값인 detail에 접근하여
		// SELECT LPROD_ID, LPROD_GU, LPROD_NM
		// FROM LPROD
		// WHERE LPROD_GU = 'P101'
		// 을 처리한 후 다음이 콘솔에 출력되도록 해보자
//	      log.info("detail->lprodVO s: " + lprodVO);
		lprodVO = this.lprodService.detail(lprodVO);
		
		//productVOList도 넣어보자
	      /*
	      P1014   iPhone 6s   800000
	      P1015   LG PC 그램   1500000
	      P1016   Galaxy Tab S   900000
	       */
//		List<ProductVO> productVOList = new ArrayList<ProductVO>();
		
//		//첫번째 상품
//		ProductVO productVO1 = new ProductVO();
//		productVO1.setProductId("P104");
//		productVO1.setPname("iPhone 6s");
//		productVO1.setUnitPrice(800000);
//		ProductVO productVO2 = new ProductVO();
//		productVO2.setProductId("P1015");
//		productVO2.setPname("LG PC 그램");
//		productVO2.setUnitPrice(1500000);
//		ProductVO productVO3 = new ProductVO();
//		productVO3.setProductId("P1016");
//		productVO3.setPname("Galaxy Tab S");
//		productVO3.setUnitPrice(900000);
//		
//		//세 개의 상품을 상품분류로 넣어보자
//		productVOList.add(productVO1);productVOList.add(productVO2);productVOList.add(productVO3);
//		lprodVO.setProductVOList(productVOList);
		log.info("detail -> lprodVO(후):"+lprodVO);
		
		mav.addObject("lprodVO", lprodVO);
		// forwarding : jsp
		mav.setViewName("lprod/detail");
		return mav;
	}

	/*
	 * 요청URI : /lprod/updatePost 요청파라미터 : {lprodId=9, lprodGu=P403, lprodNm=문구류2}
	 * 요청방식 : post
	 */
	// 파라미터 안에 있는 ModelAndView => 자동으로 객체 생성
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
	 * 요청URI : /lprod/updateAjax 요청파라미터 : {lprodId: '14', lprodGu: 'P102', lprodNm:
	 * '전자제품'} 요청방식 : post
	 */
	@RequestMapping(value = "updateAjax", method = RequestMethod.POST)
	public ResponseEntity<LprodVO> updateAjax(@RequestBody LprodVO lprodVO) {
		log.info("updateAjax -> lprodVO : " + lprodVO);
		int result = this.lprodService.updatePost(lprodVO);
		log.info("update+result" + result);

		ResponseEntity<LprodVO> entity = new ResponseEntity<LprodVO>(lprodVO, HttpStatus.OK);
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
	@RequestMapping(value = "deleteAjax", method = RequestMethod.POST)
	public ResponseEntity<LprodVO> deleteAjax(@RequestBody LprodVO lprodVO) {
		log.info("deleteAjax ->" + lprodVO);
		int result = this.lprodService.deletePost(lprodVO);
		log.info("deletePost result" + result);
		ResponseEntity<LprodVO> entity = new ResponseEntity<LprodVO>(lprodVO, HttpStatus.OK);
		return entity;
	}
	/*
	    요청URI : /lprod/getLprodId
	    요청파라미터 : 
	    요청방식 : post
	    
	    응답타입 : int
	    응답데이터 : LPROD 테이블의 MAX(LPROD_ID)+1
    */
	@ResponseBody
	@PostMapping("/getLprodId")
	public int getLprodId() {
		int result =this.lprodService.lastLprodId();
		log.info("getLprodId >>"+result);
		return result;
	}
}