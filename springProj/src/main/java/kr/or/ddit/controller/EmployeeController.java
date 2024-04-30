package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.EmployeeService;
import kr.or.ddit.service.impl.EmployeeServiceImpl;
import kr.or.ddit.vo.EmployeeVO;
import lombok.extern.slf4j.Slf4j;

//컨트롤러라고 알리기/ 재기동해야 컨트롤러라고 알수 있음 /재기동해서 객체로 만들어짐
//프링이가 빈(bean,객체)으로 등록하여 관리
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
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		//데이터
		mav.addObject("title", "직원등록");
		//jsp 경로
		//뷰리졸버
		// /WEB-INF/views/+employee/create+.jsp
		mav.setViewName("employee/create");
		return mav;
	}
	/*
	   요청URI : /employee/create
	   요청파라미터 : {empNo=A011, empName=개똥이, empAddress=세종시 새롬중앙로 11, empTelno=010-5656-2222, empSalary=5000000, filename=A011.jpg}
	   요청방식 : post
	   
	   return 타입 : ModelAndView
	   model.setViewName("redirect:/employee/create");
	 */
	@RequestMapping(value = "/create",method = RequestMethod.POST)
	public ModelAndView createPost(EmployeeVO employeeVO) {
		ModelAndView mav = new ModelAndView();
		log.info("employeeVO>>"+employeeVO);
//		EmployeeVO myEmpVO = new EmployeeVO();
//		myEmpVO.setEmpNo("A000");
//		myEmpVO.setEmpName("김수현");
//		myEmpVO.setEmpAddress("대전 중구 문화동1");A
//		myEmpVO.setEmpTelno("010-111-2222");
//		myEmpVO.setEmpSalary(60000000);
//		myEmpVO.setFilename("A000.jpg");
//		log.info("주입된 myEmpVO:" +myEmepVO);
		
		int result = this.employeeService.createPost(employeeVO);
		log.info("createPost.result>>"+result);
		
		mav.setViewName("redirect:employee/create");
		
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
	
	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav
			,@RequestParam(value = "keyword",required = false,defaultValue = "") String keyword) {
		log.info("list");
		log.info("keyword:"+keyword);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword",keyword);
		
		List<EmployeeVO> employeeVOList = this.employeeService.list(map);
		log.info("employeeVOList"+employeeVOList);
		
		mav.addObject("employeeVOList", employeeVOList);
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
}
