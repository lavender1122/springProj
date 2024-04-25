package kr.or.ddit.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.ProjectAddService;
import kr.or.ddit.service.impl.ProjectAddServiceImpl;
import kr.or.ddit.vo.ProjectAddVO;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/projectAdd")
@Controller
public class ProjectAddController {
	@Autowired
	ProjectAddService projectAddService;
	
	@RequestMapping(value="/create",method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		// /WEB-INF/views/+ lprod/create+.jsp
		mav.setViewName("/projectAdd/create");
		return mav;
	}
	
	@RequestMapping(value="/create",method = RequestMethod.POST) //lprod => 클래스 레벨에서 처리중?
	public ModelAndView  createPost(ProjectAddVO projectAddVO) {
		log.info("createPost -> projectAddVO:"+projectAddVO);
		
		int result =this.projectAddService.createPost(projectAddVO);
		log.info("createPost.result"+result);
		ModelAndView mav = new ModelAndView();
		
		mav.setViewName("/projectAdd/create");
		return mav;
	}
}
