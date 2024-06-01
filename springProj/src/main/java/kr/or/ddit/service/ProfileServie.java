package kr.or.ddit.service;

import java.util.List;

import kr.or.ddit.vo.Activity;
import kr.or.ddit.vo.ProfileVO;

public interface ProfileServie {

	public ProfileVO profileInfo(String userId);

	public List<Activity> activityAjax(String userId);

	public int settingCreateAjax(ProfileVO profileVO);

}
