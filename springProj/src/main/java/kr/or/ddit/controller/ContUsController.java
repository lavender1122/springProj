package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.ContUsService;
import kr.or.ddit.vo.ContUsVO;
import lombok.extern.slf4j.Slf4j;

@RequestMapping("/contUs")
@Slf4j
@Controller
public class ContUsController {
	
	@Autowired
	ContUsService contUsService;
	
	/*
	 요청URI : /contUs/create
	 요청파라미터 :
	 요청방식 : get
	 */
	@RequestMapping(value="/create",method=RequestMethod.GET)
	public ModelAndView create(ModelAndView mav) {
		log.info("create에 왔다");
		//View. jsp
		mav.setViewName("contUs/create");
		
		return mav;
	}
	@RequestMapping(value = "/createPost", method=RequestMethod.POST)
	public ModelAndView createPost(ContUsVO contUsVO
			,ModelAndView mav) {
		log.info("이쪽으로 와야된다!");
//		log.info("createPost contUsVO ->"+contUsVO);
		
		//CONT_US 테이블 insert
		
		int result = this.contUsService.createPost(contUsVO);
		log.info("createPost result"+result);
		
		//목록 이동: 새로운 URI 요청
		mav.setViewName("redirect:/contUs/list");
		return mav;
		
	}
	@ResponseBody
	@PostMapping("/createFormData")
	public String createFormData(ContUsVO contUsVO) {
		
		log.info("createFormData ContUsVO"+contUsVO);
		
		int result = this.contUsService.createPost(contUsVO);
		log.info("createFormData result"+result);
		
		return "SCCUESS";
	}
	/*
	   요청URI : /contUs/list
	   요청파라미터 : 
	   요청방식 : get
	    */
	@RequestMapping(value = "list", method = RequestMethod.GET)
	public ModelAndView list(ModelAndView mav) {
//		log.info("list왔다");
		//Model
		mav.addObject("title", "문의게시판");
		List<ContUsVO> ContUsVOList = this.contUsService.list();
		log.info("ContUsVOList"+ContUsVOList);
		
		mav.addObject("ContUsVOList", ContUsVOList);
		//forwarding ;jsp
		mav.setViewName("contUs/list");
		return mav;
	}
}
