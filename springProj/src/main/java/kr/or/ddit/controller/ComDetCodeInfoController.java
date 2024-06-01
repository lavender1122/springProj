package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.ComCodeInfoService;
import kr.or.ddit.service.ComDetCodeInfoService;
import kr.or.ddit.vo.ComDetCodeInfoVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@RequestMapping("/ComDetCodeInfo")
@Controller
public class ComDetCodeInfoController {
	
	@Autowired
	ComDetCodeInfoService comDetCodeInfoService;
	
	//입력 뷰
	@GetMapping("/create")
	public String create(Model model) {
		
		//forwarding
		return "comCodeInfo/create";
	}
	//입력 실행
	@PostMapping("/createPost")
	public String createPost(ComDetCodeInfoVO comDetCodeInfoVO) {
		log.info("createPost->comDetCodeInfoVO"+comDetCodeInfoVO);
		
		int result =this.comDetCodeInfoService.createPost(comDetCodeInfoVO);
		log.info("createPost ->result:"+result);
		//입력 후 상세로 이동
		return "redirect:/comCodeInfo/detail?comCode="+comDetCodeInfoVO.getComCode();
	}
	// 상세뷰
	@GetMapping("/detail")
	public String detail(ComDetCodeInfoVO comDetCodeInfoVO) {
		
		//forwarding
		return "comCodeInfo/detail";
	}
	//수정 실행
	@PostMapping("/updatePost")
	public String updatePost(ComDetCodeInfoVO comDetCodeInfoVO) {
		//수정 후 상세 이동
		return "redirect:/detail?comCode="+comDetCodeInfoVO.getComCode();
	}
	
	//삭제 실행
	@PostMapping("/deletePost")
	public String deletePost() {
		//삭제 후 목록 이동
		return "redirect:/comCodeInfo/list";
	}
	@GetMapping("/list")
	public String list(Map<String, Object> map, Model model) {
		List<ComDetCodeInfoVO> ComCodeInfoVOList =this.comDetCodeInfoService.list(map);
		log.info("list ->ComCodeInfoVOList" +ComCodeInfoVOList);
		
		model.addAttribute("ComCodeInfoVOList", ComCodeInfoVOList);
		return "comCodeInfo/list";
	}
	//요청파라미터:{"comCode":"HBY01"}
	//기본키+1
	@ResponseBody
	@PostMapping("/getNextComCode")
	public String getNextComCode(@RequestBody ComDetCodeInfoVO comDetCodeInfoVO) {
		log.info("getNextComCode ->comDetCodeInfoVO:"+comDetCodeInfoVO);
		String comDetCode = 
				this.comDetCodeInfoService.getNextComCode(comDetCodeInfoVO);
		log.info("comDetCode:"+comDetCode);
		return comDetCode;
	}
}
