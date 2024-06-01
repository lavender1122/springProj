package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.validation.ObjectError;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.EmployeeService;
import kr.or.ddit.service.impl.EmployeeServiceImpl;
import kr.or.ddit.utils.ArticlePage;
import kr.or.ddit.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

//컨트롤러라고 알리기/ 재기동해야 컨트롤러라고 알수 있음 /재기동해서 객체로 만들어짐
//프링이가 빈(bean,객체)으로 등록하여 관리
@PreAuthorize("isAuthenticated()")
@Slf4j
@RequestMapping("/employee")
@Controller
public class EmployeeController {
	//의존성 주입(Dependency Injection)
//	@Autowired
//	EmployeeVO myEmepVO;
	@Autowired
	EmployeeService employeeService;
	
	/*
	   요청URI : /employee/create
	   요청파라미터 : 
	   요청방식 : get
	   
	   return 타입 : ModelAndView
	   model.addObject("title","직원 등록")
	   model.setViewName("employee/create");
	    */
	@RequestMapping(value="/create",method=RequestMethod.GET)
	public ModelAndView create(@ModelAttribute(value="employeeVO") EmployeeVO employeeVO) {
		ModelAndView mav = new ModelAndView();
		//데이터
//		mav.addObject("title", "직원등록");
		//jsp 경로
		//뷰리졸버
		// /WEB-INF/views/+employee/create+.jsp
		mav.setViewName("employee/create");
		return mav;
	}
	/*
	   요청URI : /employee/create
	   요청파라미터 : {empNo=A011, empName=개똥이, empAddress=세종시 새롬중앙로 11, empTelno=010-5656-2222, empSalary=5000000, filename=null}
	   요청방식 : post
	   
	   return 타입 : ModelAndView
	   model.setViewName("redirect:/employee/create");
	 */
	@RequestMapping(value = "/create",method = RequestMethod.POST)
	public ModelAndView createPost(@Validated EmployeeVO employeeVO
			,BindingResult brResult) {
		ModelAndView mav = new ModelAndView();
		log.info("employeeVO>>"+employeeVO);
		
		log.info("createPost -> brResult.hasErrors():"+brResult.hasErrors());
	      if(brResult.hasErrors()) {//true(오류발생)
	    	  //문제 인수인계 해야함
	    	  //forwarding 데이터 전달(0)
	    	  //검사 결과 오류 확인(객체와 관련된오류+멤버변수와 관련된 오류)
	    	  List<ObjectError> allErrors = brResult.getAllErrors();
	    	  //객체와 관련된 오류(중첩된 자바빈, 중첩된 자바빈 컬렉션)
	    	  List<ObjectError> globalErrors 
	    	  =  brResult.getGlobalErrors();
	    	  //멤버변수와 관련된 오류(프로퍼티, 필드)
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
	      }
		
//		EmployeeVO myEmpVO = new EmployeeVO();
//		myEmpVO.setEmpNo("A000");
//		myEmpVO.setEmpName("김수현");
//		myEmpVO.setEmpAddress("대전 중구 문화동1");A
//		myEmpVO.setEmpTelno("010-111-2222");
//		myEmpVO.setEmpSalary(60000000);
//		myEmpVO.setFilename("A000.jpg");
//		log.info("주입된 myEmpVO:" +myEmepVO);
		
//		int result = this.employeeService.createPost(employeeVO);
//		log.info("createPost.result>>"+result);
	    //redirect 데이터 전달(x)
		mav.setViewName("employee/create");
		
		return mav;
	}
	@ResponseBody
	@RequestMapping(value = "/createAjax",method = RequestMethod.POST)
	public int createAjax(@RequestBody EmployeeVO employeeVO) {
		log.info("employeeVO>>"+employeeVO);
		
		int result = this.employeeService.createPost(employeeVO);
		log.info("createPost.result>>"+result);
		return result;
		
	}
	@ResponseBody
	@PostMapping("/createFormData")
	public String createFormData(EmployeeVO employeeVO) {
		log.info("employeeVO>>"+employeeVO);
		
		int result = this.employeeService.createPost(employeeVO);
		log.info("createPost.result>>"+result);
		return employeeVO.getEmpNo();
		
	}
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav
			,@RequestParam(value="currentPage",required = false,defaultValue = "1") int currentPage
			,@RequestParam(value = "keyword",required = false,defaultValue = "") String keyword) {
		log.info("list");
		log.info("keyword:"+keyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword",keyword);
		map.put("currentPage",currentPage);
		
		//전체행 구하기
		int total = this.employeeService.getTotal(map);
		log.info("total >"+total);
		
		List<EmployeeVO> employeeVOList = this.employeeService.list(map);
		log.info("employeeVOList"+employeeVOList);
		
		
		
		mav.addObject("articlePage", new ArticlePage<EmployeeVO>(total, currentPage, 10, employeeVOList, keyword));
		mav.setViewName("employee/list");
		return mav;
	}
	
	@RequestMapping(value = "/detail",method = RequestMethod.GET)
	public ModelAndView detail(EmployeeVO employeeVO, ModelAndView mav) {
		employeeVO = this.employeeService.detail(employeeVO);
		log.info("employeeVO"+employeeVO);
		
		mav.addObject("employeeVO", employeeVO);
		mav.setViewName("employee/detail");
		return mav;
	}
	//요청URI :/employee/detailAjax
	// 요청파라미터(JSON.stringify):{"empNo":"A013"}
	//요청방식 :post
	//비동기(Asynchronous) : RequestBody(JSON 받음) /ResponseBody(JSON보냄)
	@ResponseBody
	@PostMapping("/detailAjax")
	public EmployeeVO detailAjax(@RequestBody EmployeeVO employeeVO) {
		employeeVO = this.employeeService.detail(employeeVO);
		log.info("employeeVO"+employeeVO);
		
		//2) return데이터
		return employeeVO;
	}
	@RequestMapping(value="updatePost",method=RequestMethod.POST)
	public ModelAndView updatePost(EmployeeVO employeeVO, ModelAndView mav) {
		log.info("update");
		int result =this.employeeService.updatePost(employeeVO);
		log.info("update ->result"+result);
		mav.setViewName("redirect:employee/detail?empNo="+employeeVO.getEmpNo());
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="updateAjax",method=RequestMethod.POST)
	public EmployeeVO updateAjax(@RequestBody EmployeeVO employeeVO) {
		log.info("update");
		int result =this.employeeService.updatePost(employeeVO);
		log.info("update ->result"+result);
		employeeVO = this.employeeService.detail(employeeVO);
		
		return employeeVO;
	}
	@RequestMapping(value="deletePost",method=RequestMethod.POST)
	public ModelAndView deletePost(EmployeeVO employeeVO, ModelAndView mav) {
		log.info("deletePost");
		int result =this.employeeService.deletePost(employeeVO);
		log.info("update ->result"+result);
		mav.setViewName("redirect:employee/list");
		return mav;
	}
	@ResponseBody
	@RequestMapping(value="deleteAjax",method=RequestMethod.POST)
	public int deleteAjax(@RequestBody EmployeeVO employeeVO) {
		
		int result =this.employeeService.deletePost(employeeVO);
		log.info("deleteAjax ->result"+result);
		return result;
	}
}
