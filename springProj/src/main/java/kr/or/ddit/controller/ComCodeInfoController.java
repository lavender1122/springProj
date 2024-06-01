package kr.or.ddit.controller;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.or.ddit.service.ComCodeInfoService;
import kr.or.ddit.service.ComDetCodeInfoService;
import kr.or.ddit.vo.ComCodeInfoVO;
import kr.or.ddit.vo.ComDetCodeInfoVO;
import lombok.extern.slf4j.Slf4j;
import oracle.jdbc.proxy.annotation.Post;

@Slf4j
@RequestMapping("/comCodeInfo")
@Controller
public class ComCodeInfoController {
	
	@Autowired
	ComCodeInfoService comCodeInfoService;
	@Autowired
	ComDetCodeInfoService comDetCodeInfoService;
	
	//입력 뷰
	@GetMapping("/create")
	public String create(Model model) {
		//공통 코드 불러오기
		List<ComCodeInfoVO> comCodeInfoVOList=this.comCodeInfoService.create();
		//forwarding
		model.addAttribute("comCodeInfoVOList", comCodeInfoVOList);
		return "comCodeInfo/create";
	}
	//입력 실행
	@PostMapping("/createPost")
	public String createPost(ComCodeInfoVO comCodeInfoVO) {
		log.info("createPost->comCodeInfoVO"+comCodeInfoVO);
		
		int result =this.comCodeInfoService.createPost(comCodeInfoVO);
		log.info("createPost ->result:"+result);
		//입력 후 상세로 이동
		return "redirect:/detail?comCode="+comCodeInfoVO.getComCode();
	}
	// 상세뷰
	@GetMapping("/detail")
	public String detail(ComCodeInfoVO comCodeInfoVO) {
		
		//forwarding
		return "comCodeInfo/detail";
	}
	//수정 실행
	@PostMapping("/updatePost")
	public String updatePost(ComCodeInfoVO comCodeInfoVO) {
		//수정 후 상세 이동
		return "redirect:/detail?comCode="+comCodeInfoVO.getComCode();
	}
	
	//삭제 실행
	@PostMapping("/deletePost")
	public String deletePost() {
		//삭제 후 목록 이동
		return "redirect:/comCodeInfo/list";
	}
	@GetMapping("/list")
	public String list(Map<String, Object> map, Model model) {
		List<ComCodeInfoVO> ComCodeInfoVOList =this.comCodeInfoService.list(map);
		log.info("list ->ComCodeInfoVOList" +ComCodeInfoVOList);
		
		List<ComDetCodeInfoVO> ComDetCodeInfoVOList = this.comDetCodeInfoService.create();
		log.info("list ->ComDetCodeInfoVOList" +ComDetCodeInfoVOList);
		
		model.addAttribute("ComDetCodeInfoVOList", ComDetCodeInfoVOList);
		model.addAttribute("ComCodeInfoVOList", ComCodeInfoVOList);
		return "comCodeInfo/list";
	}
}
