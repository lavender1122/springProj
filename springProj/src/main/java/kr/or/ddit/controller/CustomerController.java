package kr.or.ddit.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.ddit.service.CustomerService;
import kr.or.ddit.vo.CustomerVO;
import lombok.extern.slf4j.Slf4j;
@Slf4j
@RequestMapping("/customer")
@Controller
public class CustomerController {
	@Autowired
	CustomerService customerService;
	
	@RequestMapping(value = "/create", method = RequestMethod.GET)
	public ModelAndView create() {
		ModelAndView mav = new ModelAndView();
		mav.setViewName("customer/create");
		return mav;
	}
	@PostMapping("/create")
	public String create(CustomerVO customerVO, Model model) {
//		log.info("create -> customerVO"+customerVO);
		int result = this.customerService.create(customerVO);
//		log.info("create result"+result);
		
		return "redirect:/customer/list";
	}
	@GetMapping("/list")
	public String list(Model model,
			@RequestParam(value = "keyword",required = false,defaultValue = "") String keyword) {
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("keyword",keyword);
		
		List<CustomerVO> customerVOList = this.customerService.list(map);
		model.addAttribute("customerVOList", customerVOList);
		return "customer/list";
	}
	@GetMapping("/detail")
	public String detail(CustomerVO customerVO, Model model) {
		
		customerVO = this.customerService.detail(customerVO);
//		log.info("customerVO" + customerVO);
		
		model.addAttribute("customerVO", customerVO);
		
		return "customer/detail";
	}
	@PostMapping("/updatePost")
	public String updatePost(CustomerVO customerVO, Model model) {
//		log.info("update >>customerVO"+customerVO);
		int result = this.customerService.updatePost(customerVO);
//		log.info("update >>result:"+result);
		
		return "redirect:/customer/detail?cstNo="+customerVO.getCstNo();
	}
	@PostMapping("/deletePost")
	public String deletePost(CustomerVO customerVO, Model model) {
		log.info("deletePost->customerVO "+customerVO);	
		int result = this.customerService.deletePost(customerVO);
		log.info("deletePost >>result:"+result);
		
		return "redirect:/customer/list";
	}
	
}
