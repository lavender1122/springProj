package kr.or.ddit.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ProfileVO {
	private String userName;
	private String profileUserImg;
	private String introduction;
	private String education;
	private String location;
//	private String skills;
	private String notes;
	private String userId;
	private MultipartFile profileUpdateUserImg;
	private List<Activity> activity;
	
	private List<Setting> setVOList;
}
