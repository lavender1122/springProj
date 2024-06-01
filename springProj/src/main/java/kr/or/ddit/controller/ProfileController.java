package kr.or.ddit.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.or.ddit.service.ProfileServie;
import kr.or.ddit.vo.Activity;
import kr.or.ddit.vo.EmployeeVO;
import kr.or.ddit.vo.ProfileVO;
import kr.or.ddit.vo.Setting;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@RequestMapping("/profile")
@Controller
public class ProfileController {
	@Autowired
	ProfileServie profileServie;
	
	@GetMapping("/userfile")
	public String profile() {
//		log.info("home");
		return "profile/main"; 
	}
	@ResponseBody
	@GetMapping("/profileList")
	public ProfileVO profileList() {
//		log.info("home");
		String userId = "a001";
		ProfileVO profileVO = this.profileServie.profileInfo(userId);
//		log.info("profileVO" + profileVO);
		return profileVO; 
	}
	
	@ResponseBody
	@GetMapping("/activityAjax")
	public List<Activity> activityAjax() {
		log.info("activityAjax");
		String userId = "a001";
		List<Activity> activityAjax = this.profileServie.activityAjax(userId);
		log.info("activityAjax"+activityAjax);
		return activityAjax;
	}
	@ResponseBody
	@PostMapping("/settingCreateAjax")
	public String settingCreateAjax(@DateTimeFormat(pattern="yyyy-MM-dd")ProfileVO profileVO ) {
		log.info("settingCreateAjax ProfileVO"+profileVO);
		String userId = "a001";
		profileVO.setUserId(userId);
		int result = this.profileServie.settingCreateAjax(profileVO);
		log.info("controller setting result: "+result);
		return "success";
	}

}
