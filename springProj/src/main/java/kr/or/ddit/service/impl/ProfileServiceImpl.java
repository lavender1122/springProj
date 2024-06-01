package kr.or.ddit.service.impl;

import java.util.List;
import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.or.ddit.dao.ProfileDao;
import kr.or.ddit.service.ProfileServie;
import kr.or.ddit.utils.UploadController;
import kr.or.ddit.vo.Activity;
import kr.or.ddit.vo.ProfileVO;
import kr.or.ddit.vo.Setting;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Service
public class ProfileServiceImpl implements ProfileServie {
	@Autowired
	ProfileDao profileDao;
	
	//파일 업로드 위치
	@Autowired
	String uploadFolder;
	
	@Autowired
	UploadController uploadController;

	@Override
	public ProfileVO profileInfo(String userId) {
		return this.profileDao.profileInfo(userId);
	}

	@Override
	public List<Activity> activityAjax(String userId) {
		return this.profileDao.activityAjax(userId);
	}

	@Override
	public int settingCreateAjax(ProfileVO profileVO) {
		//profile 테이블 수정
		String fileName = profileVO.getProfileUpdateUserImg().getOriginalFilename();// v파일이름
		fileName = "/"+this.uploadController.getFolder().replace("\\", "/")+"/"
				+UUID.randomUUID().toString()+"_"+fileName;
		profileVO.setProfileUserImg(fileName);
		log.info("profileVO"+ profileVO);
		int result = this.profileDao.profileUpdateAjax(profileVO);
		
		//setting 테이블 추가
		List<Setting> setVOList= profileVO.getSetVOList();
		for(Setting setting:setVOList) {
			setting.setUserId(profileVO.getUserId());
			result += this.profileDao.settingCreateAjax(setting);
			log.info("setting"+setting);
		}
		MultipartFile profileUpdateUserImg =profileVO.getProfileUpdateUserImg();
		result += this.uploadController.uploadOne(profileUpdateUserImg, profileVO.getUserId());
		
		//파일 업로드
		
		return result;
	}
	
}
